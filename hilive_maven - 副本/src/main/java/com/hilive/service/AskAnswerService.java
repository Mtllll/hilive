package com.hilive.service;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 18-4-24.
 */

public interface AskAnswerService {
    public ModelAndView askanswerPages();
    public ModelAndView addanswerPages();
}
