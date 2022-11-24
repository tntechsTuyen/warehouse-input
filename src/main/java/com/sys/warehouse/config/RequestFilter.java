package com.sys.warehouse.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@PropertySource({ "classpath:database.properties" })
public class RequestFilter implements HandlerInterceptor {

    @Autowired
    private Environment env;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession(false);
        System.out.println("filter data");
        boolean permission = true;
        try{
            Object oauth = session.getAttribute(env.getProperty("session.login"));
            permission = (null == oauth) ? false : true;
        }catch (Exception e){
            permission = false;
        }

        if(permission) {
            return true;
        } else {
            response.sendRedirect("/login");
            return false;
        }
    }
}
