package com.hilive.controller;

import com.hilive.domain.Foruminfo;
import com.alibaba.fastjson.JSON;
import com.hilive.domain.RelationInfo;
import com.hilive.domain.Userinfo;
import com.hilive.mapper.ArticleMapper;
import com.hilive.mapper.ForumMapper;
import com.hilive.mapper.RelationMapper;
import com.hilive.mapper.UserMapper;
import com.hilive.util.GenerateCode;
import com.hilive.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.management.relation.Relation;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

/**
 * Created by Administrator on 2018/4/8.
 */
@Controller
public class userController {
    @Autowired
    ForumMapper forumMapper;
    @Autowired
    ArticleMapper articleMapper;
    @Autowired
    UserMapper userMapper;

    @Autowired
    RelationMapper relationMapper;
    //跳转到注册页
    @RequestMapping("reg")
    public String reg() {
        return "reg";
    }

    //增加用户
    @RequestMapping("do_reg")
    public String do_reg(Userinfo userinfo, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        if(userinfo.getPassword().length()<6)
//        {
//            request.setAttribute("psdError","密码不能少于6位");
//            request.getRequestDispatcher("reg").forward(request,response);
//        }
        userinfo.setPassword(MD5.MD5(userinfo.getPassword()));
        Date d = new Date();
        Timestamp t = new Timestamp(d.getTime());
        userinfo.setCreatetime(t);
        userMapper.addUser(userinfo);
        Userinfo u = userMapper.selectUser(userinfo.getId());
        request.getSession().setAttribute("userinfo", u);
        return "redirect:/";
    }

    //ajax检查注册时用户名是否已经存在
    @RequestMapping("ajaxCheckName/{username}")
    public void ajaxCheck(@PathVariable String username, HttpServletResponse response) throws IOException {
        Userinfo u = userMapper.nameIsExist(username);
        if (u == null) {
            response.getWriter().println(0);
        } else {
            response.getWriter().println(1);
        }
    }

    //跳转到编辑页面
    @RequestMapping("currentuser/edit_personalInfo")
    public String edit_personalInfo() {
        return "edit_personalInfo";
    }

    //修改用户
    @RequestMapping("do_edit_personalInfo")
    public String do_edit_personalInfo(@RequestParam MultipartFile avatar2, Userinfo userinfo, HttpServletRequest request) throws IOException {
        String path = request.getServletContext().getRealPath("/upload");
        File floder = new File(path);
        if (!floder.exists()) {
            floder.mkdirs();
        }
        UUID uuid = UUID.randomUUID();
        String strUUID = uuid.toString();
        String finalsavepath = path + "/" + strUUID + avatar2.getOriginalFilename();
        request.getSession().setAttribute("avatar", strUUID + avatar2.getOriginalFilename());
        File file = new File(finalsavepath);
        avatar2.transferTo(file);
        Userinfo u = (Userinfo) request.getSession().getAttribute("userinfo");
       if(avatar2.getOriginalFilename().equals(""))
        {
 userinfo.setAvatar(u.getAvatar());
        }
        else {
           userinfo.setAvatar(strUUID + avatar2.getOriginalFilename());
       }

        userinfo.setId(u.getId());
        userMapper.updateUser(userinfo);
        Userinfo finalinfo = userMapper.selectUser(u.getId());
        request.getSession().setAttribute("userinfo", finalinfo);
        return "redirect:/";
    }
    //ajax修改头像
    @RequestMapping("ajaxFile")
    public void ajaxfile(@RequestParam MultipartFile avatar,HttpServletRequest request,HttpServletResponse response) throws IOException {
        String path=request.getServletContext().getRealPath("/upload");
        File f=new File(path);
        if(!f.exists()){
            f.mkdir();
        }
        UUID uuid = UUID.randomUUID();
        String strUUID = uuid.toString();
        String name=avatar.getOriginalFilename();
        String finalname=strUUID+name;
        File file=new File(path+"/"+finalname);
        avatar.transferTo(file);


//        Userinfo user=new Userinfo();
//        user.setAvatar(finalname);
        Userinfo u=(Userinfo)request.getSession().getAttribute("userinfo");
        u.setAvatar(finalname);
        userMapper.updateUser(u);
       response.getWriter().println(finalname);

    }

    @RequestMapping("login")
    public String login(String preUrl, Model model, Userinfo userinfo, HttpServletRequest request, HttpServletResponse response) throws IOException {
        userinfo.setPassword(MD5.MD5(userinfo.getPassword()));
        Userinfo n = userMapper.FindUserByNameAndPkey(userinfo);

        String string = request.getParameter("yyy");
        String code = (String) request.getSession().getAttribute("code");
        if (n == null) {
            model.addAttribute("error", "账号或密码错误");
            return "login";
        } else if (!string.equalsIgnoreCase(code)) {
            model.addAttribute("reult", "验证码错误");
            return "login";
        } else {
            request.getSession().setAttribute("userinfo", n);
            return "redirect:" + preUrl;
        }
    }

    @RequestMapping("yanzheng")
    public void yanzheng(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        char[] codeSequence = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789".toCharArray();
        String code = "";
        for (int i = 0; i < 4; i++) {
            Random random = new Random();
            int num = random.nextInt(codeSequence.length);
            code += codeSequence[num];
        }
        GenerateCode generate = new GenerateCode();
        BufferedImage bufferedImage = generate.Generate(code);
        OutputStream fileOutputStream = response.getOutputStream();
        ImageIO.write(bufferedImage, "jpeg", fileOutputStream);
        request.getSession().setAttribute("code", code);

    }

    @RequestMapping("login1")
    public String login1(HttpServletRequest request) {
        String preUrl = request.getHeader("Referer");
        request.setAttribute("preUrl", preUrl);
        return "login";
    }



    @RequestMapping("logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/";
    }

    //我的主页
    @RequestMapping("currentuser/myHomePage")
    public String homePage(HttpServletRequest request,Model model) {
        Userinfo u=(Userinfo)request.getSession().getAttribute("userinfo");
        List<Foruminfo> f= forumMapper.getPostsByUserID(u.getId());
        model.addAttribute("model",f);
        return "myHomePage";
    }
    //用户的主页
    @RequestMapping("otheruser/{id}")
    public ModelAndView otheruser(@PathVariable int id,HttpServletRequest request)
    {
        Userinfo c=(Userinfo)request.getSession().getAttribute("userinfo");

        Userinfo u=userMapper.selectUser(id);
        ModelAndView m=new ModelAndView();
        String isFollow="";
        if(c==null)
        {
            m.addObject("otheruserinfo",u);
            isFollow="关注";
            m.addObject("strFollow",isFollow);
            m.setViewName("otherInfo");
        }
        else
        {
            if(id==c.getId())
            {
                m.setViewName("myHomePage");
            }
            else{
                RelationInfo relationInfo=new RelationInfo();
                relationInfo.setMy_id(c.getId());
                relationInfo.setHer_id(id);

                m.addObject("otheruserinfo",u);
                List<Map<String,Object>> relationType=relationMapper.selectRelation(relationInfo);
                System.out.println(relationType);
                if(relationType.size() == 0||((int)relationType.get(0).get("our_relation")==2&&relationType.size()==1))
                {
                    isFollow="关注";
                }
                else
                {
                    isFollow="取消关注";
                }
                m.addObject("strFollow",isFollow);
                m.setViewName("otherInfo");
            }
        }


        return m;
    }

    //关注
    @RequestMapping("follow/{otheruserid}")
    public void follow(@PathVariable int otheruserid,HttpServletRequest request,HttpServletResponse response) throws IOException {
        Userinfo userinfo=(Userinfo)request.getSession().getAttribute("userinfo");

        userMapper.addFollow(userinfo.getId());
        userMapper.addFans(otheruserid);
        Userinfo uuu=userMapper.selectUser(userinfo.getId());
        request.getSession().setAttribute("userinfo",uuu);
        RelationInfo follow=new RelationInfo();
        RelationInfo fans=new RelationInfo();

        follow.setMy_id(userinfo.getId());
        follow.setHer_id(otheruserid);
        relationMapper.addFollowRelation(follow);

        fans.setMy_id(userinfo.getId());
        fans.setHer_id(otheruserid);
        relationMapper.addFansRelation(fans);

        String isFollow="关注";
        String stringJson= JSON.toJSONString(isFollow);
        response.getWriter().println(stringJson);
    }

    //取消关注
    @RequestMapping("noFollow/{otheruserid}")
    public void noFollow(@PathVariable int otheruserid,HttpServletRequest request,HttpServletResponse response) throws IOException {
        Userinfo userinfo=(Userinfo)request.getSession().getAttribute("userinfo");

        userMapper.deleteFollow(userinfo.getId());
        userMapper.deleteFans(otheruserid);
        Userinfo uuu=userMapper.selectUser(userinfo.getId());
        request.getSession().setAttribute("userinfo",uuu);
        RelationInfo follow=new RelationInfo();
        RelationInfo fans=new RelationInfo();

        follow.setMy_id(userinfo.getId());
        follow.setHer_id(otheruserid);
        relationMapper.deleteFollowRelation(follow);

        fans.setMy_id(userinfo.getId());
        fans.setHer_id(otheruserid);
        relationMapper.deleteFansRelation(fans);

        String isNotFollow="取消关注";
        String stringJson= JSON.toJSONString(isNotFollow);
        response.getWriter().println(stringJson);
    }

    //关注列表
    @RequestMapping("ajax_follow/{otheruserid}")
    public void ajaxFollow(@PathVariable int otheruserid,HttpServletResponse response) throws IOException {
        List<Map<String,Object>> mapList=relationMapper.selectFollowUsersById(otheruserid);

        String stringJson=JSON.toJSONString(mapList);
        response.getWriter().println(stringJson);
    }

    //粉丝列表
    @RequestMapping("ajax_fans/{otheruserid}")
    public void ajaxFans(@PathVariable int otheruserid,HttpServletResponse response) throws IOException {
        List<Map<String,Object>> mapList=relationMapper.selectFansUsersById(otheruserid);

        String stringJson=JSON.toJSONString(mapList);
        response.getWriter().println(stringJson);
    }
}