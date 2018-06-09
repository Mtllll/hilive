package com.hilive.service;

import com.hilive.domain.Userinfo;
import com.hilive.mapper.QuestionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 18-4-24.
 */
@Service
public class AskAnswerServiceImp implements AskAnswerService {
   @Autowired
    QuestionMapper questionMapper;
    @Autowired
    HttpServletRequest request;
    @Override
    public  ModelAndView askanswerPages() {
        List<Map<String, Object>> AllQuestionslist=questionMapper.getAllQuestions();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("list_questions", AllQuestionslist);
        modelAndView.setViewName("viewaskawer");
        return modelAndView;
    }

    @Override
    public ModelAndView addanswerPages() {
        Userinfo userinfo = (Userinfo) request.getSession().getAttribute("userinfo");
        ModelAndView modelAndView = new ModelAndView();
        if (userinfo == null) {
            modelAndView.addObject("error", "登陆后再提问");
            modelAndView.setViewName("viewaskawer");
        } else {
            modelAndView.setViewName("writequestion");
        }
        return modelAndView;
    }
}
