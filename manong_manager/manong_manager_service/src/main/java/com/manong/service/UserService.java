package com.manong.service;

import com.manong.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserService {

    int insertUser(User user);

    User selectUser(String userName);

    int changeLoginStatus(@Param("isLogin") Integer isLogin , @Param("id")Integer id);
}
