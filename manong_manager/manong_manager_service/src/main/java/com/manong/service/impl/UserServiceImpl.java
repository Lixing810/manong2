package com.manong.service.impl;

import com.manong.mapper.UserMapper;
import com.manong.pojo.User;
import com.manong.pojo.UserExample;
import com.manong.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public List<User> selectAll() {
        return userMapper.selectAll();
    }

    @Override
    public User selectByPrimaryKey(Integer userId) {
        UserExample userExample =  new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andIdEqualTo(userId);

        List<User> userList = userMapper.selectByExample(userExample);
        if (userList.size()>0){
            return userList.get(0);
        }
        return null;
    }
}
