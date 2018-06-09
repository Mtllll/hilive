package com.hilive.controller;

import com.alibaba.fastjson.JSON;
import com.hilive.domain.Foruminfo;
import com.hilive.domain.PageData;
import com.hilive.domain.PageInfo;
import com.hilive.domain.Userinfo;
import com.hilive.mapper.ForumMapper;
import com.hilive.mapper.ResponsepostMapper;
import com.hilive.mapper.SecondResponsepostMapper;
import com.hilive.mapper.UserMapper;
import com.hilive.util.StringDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 18-4-9.
 */
@Controller
public class ForumController {
    @Autowired
    UserMapper userMapper;
    @Autowired
    ForumMapper forumMapper;

    @Autowired
    ResponsepostMapper responsepostMapper;

    @Autowired
    SecondResponsepostMapper secondResponsepostMapper;

    @RequestMapping("viewPersonalPost/{userid}")
    public void viewPersonalPost(@PathVariable int userid,HttpServletResponse response) throws IOException {
        List<Foruminfo> mapList=forumMapper.getPostsByUserID(userid);
//
//        PageData<Foruminfo> pageData = new PageData();
//        pageData.setList(mapList);
        String StringJson=JSON.toJSONString(mapList);
        System.out.println(StringJson);
        response.getWriter().println(StringJson);
    }

    @RequestMapping("outDoorHall")
    public String gotoOutDoorHall()
    {
        return "outdoorHall";
    }

    @RequestMapping("forum")
    public void gotoForum(PageInfo pageInfo, HttpServletRequest request, HttpServletResponse response) throws IOException {
        //加载分页
        System.out.println(pageInfo.getPageIndex());
        System.out.println(pageInfo.getPageSize());
        int total=forumMapper.getTotalRecords();
        System.out.println(total);

        List<Map<String,Object>> pagedPostList=forumMapper.getPagedPosts(pageInfo);
        System.out.println(pagedPostList);

        for(Map<String,Object> map:pagedPostList)
        {
            Date date=(Date)map.get("publishtime");
            Date date1=(Date)map.get("lastresponsetime");
            String strDate= StringDate.getStringDate(date);
            String strDate1= StringDate.getStringDate(date1);
            map.put("publishtime",strDate);
            map.put("lastresponsetime",strDate1);
        }

        PageData<Map<String,Object>> pagesData=new PageData<>();
        pagesData.setTotal(total);
        pagesData.setList(pagedPostList);

        String strJson= JSON.toJSONString(pagesData);
        System.out.println(strJson);
        response.getWriter().println(strJson);

        //加载全部
//        List<Map<String,Object>> postLst=forumMapper.getAllPost();
//        for(Map<String,Object> map:postLst)
//        {
//            Date date=(Date)map.get("publishtime");
//            String strDate= StringDate.getStringDate(date);
//            map.put("publishtime",strDate);
//        }
//        request.getSession().setAttribute("postLst",postLst);
//        System.out.println(postLst);
//        return "outdoorHall";
    }

    @RequestMapping("currentuser/gotoAddPost")
    public String gotoAddPost()
    {
        return "writePost";
    }

    @RequestMapping("addPost")
    public String addPost(Model model, Foruminfo foruminfo, HttpServletRequest request)
    {

        HttpSession session=request.getSession();
        Userinfo userinfo=(Userinfo)session.getAttribute("userinfo");
        foruminfo.setAuthorid(userinfo.getId());
        foruminfo.setTopic_html_content(request.getParameter("test-editormd-html-code"));
        Date date=new Date();
        Timestamp timestamp=new Timestamp(date.getTime());
        foruminfo.setPublishtime(timestamp);
        forumMapper.addPost(foruminfo);
        userMapper.addPost(userinfo.getId());
        Userinfo u=userMapper.selectUser(userinfo.getId());
        request.getSession().setAttribute("userinfo",u);
        Map<String,Object> stringObjectMap=forumMapper.getPostById(foruminfo.getId());
        model.addAttribute("postView",stringObjectMap);
        return "redirect:viewPost/"+foruminfo.getId();
    }

    @RequestMapping("viewPost/{pid}")
    public String viewPost(Model model, @PathVariable Integer pid,HttpServletRequest request)
    {
        forumMapper.addViewCount(pid);
        Map<String,Object> map=forumMapper.getPostById(pid);
        Date date=(Date)map.get("publishtime");
        String strDate=StringDate.getStringDate(date);
        map.put("publishtime",strDate);
        List<Map<String,Object>> mapList=responsepostMapper.getAllResponsesById(pid);
        for(Map<String,Object> map1:mapList)
        {
            Date date1=(Date)map1.get("responsetime");
            String strDate1= StringDate.getStringDate(date1);
            map.put("responsetime",strDate1);
        }
        request.getSession().setAttribute("postid",pid);
        model.addAttribute("responsepostList",mapList);
        model.addAttribute("postView",map);

        List<List<Map<String,Object>>> allSecondResponse=new ArrayList<>();
        int count=secondResponsepostMapper.getCount();
        if(count!=0)
        {
            Integer num=secondResponsepostMapper.getMaxId();
            for(int i=0;i<num;i++)
            {
                List<Map<String,Object>> secondResponseById=secondResponsepostMapper.getAllSecondResponsepostById(num);
                if(secondResponseById!=null)
                {
                    allSecondResponse.add(secondResponseById);
                }
            }
            model.addAttribute("allSecondResponse",allSecondResponse);
        }
        return "postPage";
    }

    @RequestMapping("deletePost/{pid}")
    public String deletePost(@PathVariable Integer pid)
    {
        forumMapper.deletePost(pid);
        return "redirect:/forum";
    }
}
