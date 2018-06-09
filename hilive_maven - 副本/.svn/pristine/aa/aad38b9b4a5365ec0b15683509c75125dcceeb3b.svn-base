package com.hilive.interceptor;

import com.hilive.domain.Userinfo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2018/4/9.
 */

public class logInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse httpServletResponse, Object o) throws Exception {
        Userinfo u=(Userinfo)req.getSession().getAttribute("userinfo");
        if(u!=null)
        {
            return true;
        }
        else {
            String preUrl=req.getHeader("Referer");
            req.setAttribute("preUrl",preUrl);
            req.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req,httpServletResponse);
            return false;
        }

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
