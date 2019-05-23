package com.manong.service.impl;

import com.manong.mapper.UserMapper;
import com.manong.pojo.User;
import com.manong.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public int insertUser(User user) {
        user.setIsLogin(0);
        user.setStatus(0);
      return userMapper.insert(user);
    }

    @Override
    public User selectUser(String userName) {
        return userMapper.selectUser(userName);
    }

    @Override
    public int changeLoginStatus(@Param("isLogin") Integer isLogin , @Param("id")Integer id) {
        return userMapper.changeLoginStatus(isLogin,id);
    }
}
