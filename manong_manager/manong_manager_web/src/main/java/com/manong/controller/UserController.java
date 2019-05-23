package com.manong.controller;



import com.manong.pojo.User;
import com.manong.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.regex.Pattern;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/InsertUser" ,method = RequestMethod.POST)
    @ResponseBody
    public void registered(@RequestBody User user) {
        userService.insertUser(user);
    }
    @RequestMapping(value = "/selectUser" ,method = RequestMethod.POST)
    @ResponseBody
    public User selectUser(@RequestParam("userName") String userName) {
        User user = userService.selectUser(userName);

        return user;


    }
    @RequestMapping(value = "/changeLoginStatus" ,method = RequestMethod.POST)
    @ResponseBody
    public String changeLoginStatus(@RequestParam("isLogin") Integer isLogin,@RequestParam("id") Integer id) {
        int i = userService.changeLoginStatus(isLogin, id);
        if (i>0){
            return "success";
        }else {
            return "faild";
        }
    }



}
