package com.manong.mapper;

import com.manong.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);


    public User selectUser(String userName);

    public int changeLoginStatus(@Param("isLogin") Integer isLogin , @Param("id")Integer id);


}