package com.sys.warehouse.controller;

import com.sys.warehouse.dto.User;
import com.sys.warehouse.service.IUserService;
import com.sys.warehouse.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
@PropertySource({ "classpath:database.properties" })
public class IndexController {

    @Autowired
    private Environment env;

    @Autowired
    private UserServiceImpl userService;

    @GetMapping({"/", "home"})
    public String goIndex(){
        return "index";
    }

    @GetMapping("/login")
    public String goLogin(Model model){
        model.addAttribute("loginForm", new User());
        return "login";
    }

    @PostMapping("/login")
    public String doLogin(HttpSession session, @ModelAttribute("loginForm") User user){
        Integer idUser = userService.login(user);
        if(idUser == null) return "redirect:/login";
        session.setAttribute(env.getProperty("session.login"), idUser);
        return "redirect:/home";
    }

}
