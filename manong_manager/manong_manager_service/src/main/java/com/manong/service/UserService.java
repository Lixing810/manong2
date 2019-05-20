package com.manong.service;

import com.manong.pojo.User;

import java.util.List;

public interface UserService {

    List<User> selectAll();

    User selectByPrimaryKey(Integer userId);



}
