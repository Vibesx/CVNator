/*
package web.controllers;

import web.util.DBAccess;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

*/
/**
 * Created by Leon on 4/29/2016.
 *//*

@Controller
@EnableWebMvc
public class MainPageController {
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public Model getMainPage(Model model) {
        DBAccess dbAccess = null;
        String result = "blank";
        try {
            dbAccess = new DBAccess();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(dbAccess != null) {
            result = dbAccess.testSelect();
        }
        //ModelAndView model = new ModelAndView();
        model.addAttribute("username", result);
        //return new ModelAndView("index", "username", "testtttt");
        return model;
    }

    @RequestMapping(value = "/")
    public void testSmth() {
        int a = 1;
        int b = 2;
        a += b;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLoginPage(Model model) {
        model.addAttribute("login", "message");
        System.out.println("test");
        return "login";
    }

    @RequestMapping(value = "/welcome")
    public ModelAndView helloWorld(ModelAndView model) {

        String message = "<br><div style='text-align:center;'>"
                + "<h3>********** Hello World, Spring MVC Tutorial</h3>This message is coming from CrunchifyHelloWorld.java **********</div><br><br>";
        //ModelAndView model = new ModelAndView();
        model.addObject("message", message);
        return model;
        //return new ModelAndView("welcome", "message", message);
    }
}

*/

package com.leon.web.controller;

import com.leon.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainPageController {

    /*@Autowired
    UserService userService;*/

    @RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
    public ModelAndView defaultPage() {

        ModelAndView model = new ModelAndView();
        //model.addObject("title", "Spring Security Login Form - Database Authentication");
        //model.addObject("message", "This is default page!");
        model.setViewName("index");
        return model;

    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public ModelAndView test() {
        ModelAndView model = new ModelAndView();
        model.setViewName("test");
        return model;
    }

    @RequestMapping(value = "/admin**", method = RequestMethod.GET)
    public ModelAndView adminPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Login Form - Database Authentication");
        model.addObject("message", "This page is for ROLE_ADMIN only!");
        model.setViewName("admin");

        return model;

    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username and password!");
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("login");

        return model;

    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public ModelAndView signupPage() {

        ModelAndView model = new ModelAndView();
        //model.addObject("title", "Spring Security Login Form - Database Authentication");
        //model.addObject("message", "This is default page!");
        model.setViewName("signup");
        return model;

    }

    //for 403 access denied page
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {

        ModelAndView model = new ModelAndView();

        //check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            System.out.println(userDetail);

            model.addObject("username", userDetail.getUsername());

        }

        model.setViewName("403");
        return model;

    }

}
