package com.zhuyuhang.dao;

import com.zhuyuhang.damain.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Zhuyuhang
 */
@Repository
public interface UserDao {

    @Select("select * from user where account = #{account} and password = #{password}")
    public User login(@Param("account") String account, @Param("password") String password);


    @Select("select * from user where id = #{user_id}")
    public User findUserById(@Param("user_id") Integer user_id);
}
