package com.manong.controller;



import com.manong.pojo.User;
import com.manong.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/user")
    @ResponseBody
    public List<User> getAll(){
        return userService.selectAll();
    }

    @RequestMapping("/user/{id}")
    @ResponseBody
    public User getUserById(@PathVariable Integer id){
        return userService.selectByPrimaryKey(id);
    }
}
