package com.hilive.controller;

import com.alibaba.fastjson.JSON;
import com.hilive.domain.*;
import com.hilive.mapper.*;
import com.hilive.service.articleService;
import com.hilive.util.StringDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/10.
 */
@Controller
public class articleController {
    @Autowired
    articleService articleService;
    @Autowired
    UserMapper userMapper;
    @Autowired
    articleCommentMapper articleCommentMapper;
    @Autowired
    articleTransmitMapper articleTransmitMapper;
    @Autowired
    ArticlePraiseInfoMapper articlePraiseInfoMapper;
    @Autowired
    ArticleMapper articleMapper;
@RequestMapping("currentuser/write_article")
    public String write_article(){
    return "write_article";
}
@RequestMapping("do_write_article")
    public String do_write_article(Articleinfo articleinfo, HttpServletRequest request){
    Userinfo u= (Userinfo) request.getSession().getAttribute("userinfo");
    articleinfo.setTopic_html_content(request.getParameter("test-editormd-html-code"));
    articleinfo.setContent("");
    articleinfo.setUser_id(u.getId());
    Date d=new Date();
    Timestamp t=new Timestamp(d.getTime());
    articleinfo.setCreatetime(t);
    articleMapper.addArticle(articleinfo);
    userMapper.addArticle(u.getId());
    Userinfo user=userMapper.selectUser(u.getId());
    request.getSession().setAttribute("userinfo",user);
    return "redirect:/";
}
@RequestMapping("view_article")
    public void view_article(HttpServletRequest request) {
//    ModelAndView m = new ModelAndView();
//    List<Map<String, Object>> list = articleMapper.allArticle();
//    Userinfo u = (Userinfo) request.getSession().getAttribute("userinfo");
//    if (u != null) {
//        List<Integer> list2 = articlePraiseInfoMapper.currentuserPraise(u.getId());
//        for (Integer i : list2) {
//            for (Map<String, Object> map : list) {
//                if (map.get("id") == i) {
//                    map.put("isPraise", 1);
//                }
//            }
//
//        }
//    }
//        for (Map<String, Object> map : list) {
//            map.put("createtime", StringDate.getStringDate((Date) map.get("createtime")));
//        }
//        m.addObject("allArticle", list);
//        m.setViewName("view_article");


//    return m;
}
@RequestMapping("details/{id}")
    public ModelAndView details(@PathVariable int id,HttpServletRequest request) throws IOException {
    ModelAndView m=new ModelAndView();
    Map<String,Object> article_details=articleMapper.view_article(id);

    article_details.put("createtime",StringDate.getStringDate((Date) article_details.get("createtime")));
    m.addObject("article_details",article_details);

    /*查看全部评论*/
    List<Map<String,Object>> map=articleCommentMapper.currentComment(id);
    for(Map<String,Object> aa:map)
    {
        aa.put("createtime",StringDate.getStringDate((Date) aa.get("createtime")));
    }
    m.addObject("currentComment",map);
    m.setViewName("article_details");
    return m;
}
//文章赞部分
@RequestMapping("praise/{id}")
    public void praise(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) throws IOException {


        articlePraiseInfo a = new articlePraiseInfo();
        Userinfo u = (Userinfo) request.getSession().getAttribute("userinfo");
        if(u==null)
        {
            response.getWriter().print(3);
        }
        else{
            a.setUser_id(u.getId());
            a.setArticle_id(id);
            a.setIsPraiseType(1);
            articlePraiseInfo ar = articlePraiseInfoMapper.selectType(a);
            if (ar == null) {

                articlePraiseInfoMapper.addArticlePraiseInfo(a);
                articleMapper.add_praise(id);
                response.getWriter().println(1);
            } else {
                articlePraiseInfoMapper.deleteArticlePraiseInfo(ar);
                articleMapper.reducePraise(id);
                response.getWriter().println(0);

            }

    }
}

    @RequestMapping("currentuser/myArticle")
    public void myArtcile(HttpServletRequest request,HttpServletResponse response){
    Userinfo u=(Userinfo)request.getSession().getAttribute("userinfo");

    List<Map<String,Object>> list=articleMapper.selectById(u.getId());
    ModelAndView m=new ModelAndView();
    m.addObject("personnalArticle",list);
    m.setViewName("personnalArticle");


    }
    //文章转发部分
    @RequestMapping("do_transmit/{value}")
    public void do_transmit(@PathVariable int value,HttpServletRequest request,HttpServletResponse response) throws IOException {
        articleTransmitInfo ar=new articleTransmitInfo();
        ar.setArticle_id(value);


        Userinfo u=(Userinfo)request.getSession().getAttribute("userinfo");
        if(u==null)
        {
            response.getWriter().println(0);
        }
        else{
            ar.setUser_id(u.getId());
            Date d=new Date();
            Timestamp t=new Timestamp(d.getTime());
            ar.setCreatetime(t);

            userMapper.addCollect(u.getId());
            Userinfo user=userMapper.selectUser(u.getId());
            request.getSession().setAttribute("userinfo",user);
            articleTransmitMapper.add_articleTransmitMapper(ar);
            articleMapper.add_transmit(value);
            response.getWriter().println(1);
        }


    }
    @RequestMapping("myTransmit")
    public ModelAndView myTransmit(HttpServletRequest request){
        Userinfo u=(Userinfo)request.getSession().getAttribute("userinfo");
        List<Map<String,Object>> list=articleTransmitMapper.selectTransmitSelf(u.getId());
        ModelAndView m=new ModelAndView();
        m.addObject("transmitBySelf",list);
        m.setViewName("transmitBySelf");
        return m;
    }

    //文章评论部分
    @RequestMapping("comment")
    public void comment(articleCommentInfo a,HttpServletRequest request,HttpServletResponse response) throws IOException {

       Userinfo u= (Userinfo)request.getSession().getAttribute("userinfo");
        a.setUser_id(u.getId());
        Date d=new Date();
        Timestamp t=new Timestamp(d.getTime());
        a.setCreatetime(t);
        articleCommentMapper.addComment(a);
        articleMapper.add_comment(a.getArticle_id());
        String str=JSON.toJSONString(a);
        response.getWriter().println(str);
        System.out.println(str);
    }
    /*查看别人的信息*/
    @RequestMapping("othersInfo/{id}")
    public ModelAndView others(@PathVariable int id)
    {
        ModelAndView m=new ModelAndView();
        Userinfo u=userMapper.selectUser(id);
        m.addObject("otherInfo",u);
        m.setViewName("otherInfo");
        return m;
    }
   @RequestMapping(" ajax_view_article/{id}")
    public void  ajax_view_article(@PathVariable int id,HttpServletResponse response) throws Exception {
       List<Map<String,Object>> list=articleMapper.selectById(id);
       String strJson=JSON.toJSONString(list);
       response.getWriter().print(strJson);
   }
   //ajax收藏文章
    @RequestMapping("ajax_collection_article/{id}")
    public void ajax_collection_article(@PathVariable int id,HttpServletResponse response) throws IOException {
        List<Map<String,Object>> list=articleMapper.ajax_collection_article(id);
        System.out.println(list);
        response.getWriter().print(JSON.toJSONString(list));
    }
//ajax 下拉自动刷新

    @RequestMapping("getMoreArticle/{aid}")
public void getMoreArticle(@PathVariable int aid,HttpServletResponse response,HttpServletRequest request) throws IOException, InterruptedException {


        List<Map<String,Object>> a=articleMapper.getMoreArticle(aid);
        Userinfo u = (Userinfo) request.getSession().getAttribute("userinfo");
        if (u != null) {
            List<Integer> list2 = articlePraiseInfoMapper.currentuserPraise(u.getId());
            for (Integer i : list2) {
                for (Map<String, Object> map : a) {
                    if (map.get("id") == i) {
                        map.put("isPraise", 1);
                    }
                }
            }
        }
        for (Map<String, Object> map : a) {
            map.put("createtime", StringDate.getStringDate((Date) map.get("createtime")));
        }
        String strJson=JSON.toJSONString(a);
        Thread.sleep(500);
        response.getWriter().print(strJson);
}
}
