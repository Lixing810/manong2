package com.manong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @RequestMapping("/")
    public String index() {
        return "index";
    }
    @RequestMapping(value = "/registered")
    public String registered() {
        return "registered";
    }

    @RequestMapping(value = "/manager")
    public String manager() {
        return "manager";
    }
}
