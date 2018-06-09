package com.hilive.controller;

import com.alibaba.fastjson.JSON;
import com.hilive.domain.*;
import com.hilive.mapper.AnswerMapper;
import com.hilive.mapper.Answer_praiseinfoMapper;
import com.hilive.mapper.QuestionMapper;

import com.hilive.mapper.Question_browsecountMapper;
import com.hilive.service.AskAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 18-4-10.
 */
@Controller
public class AskAnswerController {
    @Autowired
    QuestionMapper questionMapper;
    @Autowired
    AnswerMapper answerMapper;
    @Autowired
    Answer_praiseinfoMapper answer_praiseinfoMapper;
    @Autowired
    Question_browsecountMapper question_browsecountMapper;
    @Autowired
    AskAnswerService askAnswerService;
    @RequestMapping("askanswer")
    public ModelAndView askanswerPage() {
       ModelAndView modelAndView=askAnswerService.askanswerPages();
        return modelAndView;
    }
//提问
    @RequestMapping("addaskinfo")
    public ModelAndView addanswerPage() {
    ModelAndView modelAndView=askAnswerService.addanswerPages();
        return modelAndView;
    }
//添加问题
    @RequestMapping("addquestion")
    public ModelAndView addquestions(QuestionInfo questionInfo, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        Userinfo userinfo = (Userinfo) request.getSession().getAttribute("userinfo");
        int n = questionMapper.isQuestionByTitle(questionInfo.getTitle());
        String string = request.getParameter("test-editormd-html-code");
        if (n >= 1) {
            modelAndView.addObject("error", "此问题已经存在（点击查看）");
            modelAndView.addObject("title", questionInfo.getTitle());
            modelAndView.setViewName("writequestion");
        } else {
            questionInfo.setUser_id(userinfo.getId());
            Date date = new Date();
            Timestamp timestamp = new Timestamp(date.getTime());
            questionInfo.setCreatetime(timestamp);
            questionInfo.setTopic_html_content(string);
            questionMapper.addQuestion(questionInfo);
            Map<String, Object> map = questionMapper.getQuestionById(questionInfo.getId());
            modelAndView.addObject("map", map);
            modelAndView.setViewName("questioninfo");
        }


        return modelAndView;
    }
//回复
    @RequestMapping("addanswer")
    public void addanswer(AnswerInfo answerInfo, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Userinfo userinfo = (Userinfo) request.getSession().getAttribute("userinfo");
        answerInfo.setAnswer_userid(userinfo.getId());
        Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        answerInfo.setCreatetime(timestamp);

        answerInfo.setAgree_count(1);
        answerMapper.addAnswer(answerInfo);
        questionMapper.updateQuestionAnswer_countByQuestionId(answerInfo.getQuestion_id());
        Map<String, Object> map2Answer = answerMapper.getAnswersByAnswerId(answerInfo.getId());
        String json = JSON.toJSONString(map2Answer);
        System.out.println("json"+json);
        response.getWriter().println(json);


    }
//按文章名查具体文章//浏览
    @RequestMapping("readonequestion/{title}")
    public ModelAndView readonequestion(@PathVariable String title, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        Userinfo userinfo = (Userinfo) request.getSession().getAttribute("userinfo");
        modelAndView.addObject("n", userinfo);
        Map<String, Object> mapTitle = questionMapper.getQuestionByTitle(title);
        modelAndView.addObject("mapTitle", mapTitle);
        int index = 0;
        for (String map : mapTitle.keySet()) {
            if (map.equals("id")) {
                index = (int) mapTitle.get(map);
            }
        }
        //判断此人是否看过这个问题
        if(userinfo!=null){
            Question_browsecount question_browsecount=new Question_browsecount();
            question_browsecount.setQuestionid(index);
            question_browsecount.setUserid(userinfo.getId());
            Question_browsecount question_browsecount1=question_browsecountMapper.getBrowseByQidAndUid(question_browsecount);
            if (question_browsecount1==null){
                question_browsecountMapper.addbrowseinfo(question_browsecount);
                questionMapper.addbrowse_count(index);
            }
        }


        List<Map<String, Object>> mapList = answerMapper.getAnswersByQuestionId(index);
        modelAndView.addObject("list_answer", mapList);
        modelAndView.setViewName("questionsinfo");
        return modelAndView;
    }


//搜索
    @RequestMapping("serchquestion")
    public ModelAndView serchquestionPage(QuestionInfo questionInfo) {
        QuestionInfo questionInfo1=new QuestionInfo();
        ModelAndView modelAndView = new ModelAndView();
        String string=questionInfo.getTitle();
        questionInfo1.setTopic_html_content("%"+string+"%");
        questionInfo1.setTitle("%"+string+"%");
        List<Map<String,Object>> questionsMap=questionMapper.getQuestionsByTitleOrTopic_html_content(questionInfo1);
        modelAndView.addObject("questionsMap",questionsMap);

        modelAndView.addObject("title",string);
        modelAndView.setViewName("viewquestionarray");
        return modelAndView;
    }

    //回复的点赞
    @RequestMapping("agreencount")
    public void addagreencount(AnswerInfo answerInfo, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Userinfo userinfo = (Userinfo) request.getSession().getAttribute("userinfo");
        if (userinfo == null) {
            response.getWriter().println("n");
        } else {
            Answer_praiseinfo answer_praiseinfo = new Answer_praiseinfo();
            answer_praiseinfo.setAnswerid(answerInfo.getId());
            answer_praiseinfo.setUserid(userinfo.getId());
            Answer_praiseinfo answer_praiseinfo1 = answer_praiseinfoMapper.getAllByAidAndUid(answer_praiseinfo);

            boolean a = false;
            if (answer_praiseinfo1 != null) {
                answer_praiseinfoMapper.deleteinfo(answerInfo.getId());
                answerMapper.cutagree_count(answerInfo.getId());
                a = true;
            } else {
                answer_praiseinfoMapper.insterinfo(answer_praiseinfo);
                answerMapper.addagree_count(answerInfo.getId());
                a = false;
            }
            int num = 0;
            if (a == true) {
                num = answerMapper.getAnsweragree_countByAnswerId(answerInfo.getId());

            } else {
                num = answerMapper.getAnsweragree_countByAnswerId(answerInfo.getId());

            }
            System.out.println(num);
            response.getWriter().println(num);
        }

    }

}

