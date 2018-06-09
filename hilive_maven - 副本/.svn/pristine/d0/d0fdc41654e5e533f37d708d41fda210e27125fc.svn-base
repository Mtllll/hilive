package com.hilive.controller;

import com.alibaba.fastjson.JSON;
import com.hilive.domain.GoodsComment;
import com.hilive.domain.Userinfo;
import com.hilive.mapper.GoodsCommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by ttc on 18-4-8.
 */
@Controller
public class GoodsCommentController {
    @Autowired
    GoodsCommentMapper goodsCommentMapper;
    @RequestMapping("add_comment")
    public void add_comment(GoodsComment goodsComment, String goodsInfo_id, HttpServletResponse response, HttpServletRequest request) throws IOException {

        Userinfo userinfo= (Userinfo) request.getSession().getAttribute("userinfo");
        goodsComment.setUserid(userinfo.getId());
        Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        goodsComment.setComment_time(timestamp);
        int good=Integer.parseInt(goodsInfo_id);
        goodsComment.setGoods_id(good);
        goodsComment.setPraise_count(0);
        goodsCommentMapper.addGoodsComment(goodsComment);
        String jsonString = JSON.toJSONString(goodsComment);
        response.getWriter().println(jsonString);
    }


}
