package com.hilive.controller;

import com.alibaba.fastjson.JSON;
import com.hilive.domain.Lastresponsepostinfo;
import com.hilive.domain.Responsepostinfo;
import com.hilive.domain.SecondResponsepostinfo;
import com.hilive.domain.Userinfo;
import com.hilive.mapper.ForumMapper;
import com.hilive.mapper.ResponsepostMapper;
import com.hilive.mapper.SecondResponsepostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by ttc on 18-4-10.
 */
@Controller
public class ResponsepostController {

    @Autowired
    ForumMapper forumMapper;
    @Autowired
    ResponsepostMapper responsepostMapper;
    @Autowired
    SecondResponsepostMapper secondResponsepostMapper;

    @RequestMapping("addResponsepost")
    public void addResponsepost(Responsepostinfo responsepostinfo, HttpServletRequest request, HttpServletResponse response)
    {
        int pid=(int)request.getSession().getAttribute("postid");
        forumMapper.addResponseCount(pid);
        Date date=new Date();
        Timestamp timestamp=new Timestamp(date.getTime());
        responsepostinfo.setResponsetime(timestamp);
        Userinfo userinfo=(Userinfo)request.getSession().getAttribute("userinfo");

        Lastresponsepostinfo lastresponsepostinfo=new Lastresponsepostinfo();
        lastresponsepostinfo.setPostid(pid);
        lastresponsepostinfo.setLastresponsetime(timestamp);
        lastresponsepostinfo.setLastusername(userinfo.getUsername());
        lastresponsepostinfo.setLastuserid(userinfo.getId());
        forumMapper.changeLastUser(lastresponsepostinfo);


        responsepostinfo.setResponseuserid(userinfo.getId());
        responsepostMapper.addResponse(responsepostinfo);
        String strJson = JSON.toJSONString(responsepostinfo);
        try {
            response.getWriter().println(strJson);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("delete_comment/{cid}")
    public String deleteComment(@PathVariable Integer cid,HttpServletRequest request){
        responsepostMapper.deleteComment(cid);
        int pid=(int) request.getSession().getAttribute("postid");
        forumMapper.minusResponseCount(pid);
        return "redirect:/viewPost/"+pid;
    }

    @RequestMapping("addSecondResponsepost")
    public void addSecondResponsepost(SecondResponsepostinfo secondResponsepostinfo, HttpServletResponse httpServletResponse)
    {
        Date date=new Date();
        Timestamp timestamp=new Timestamp(date.getTime());
        secondResponsepostinfo.setSecond_responsepost_createtime(timestamp);
        secondResponsepostMapper.addSecondResponsepost(secondResponsepostinfo);
        String strJson = JSON.toJSONString(secondResponsepostinfo);
        System.out.println(strJson);
        try {
            httpServletResponse.getWriter().println(strJson);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
