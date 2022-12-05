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
public interface UserFollowDao {

    @Select("select count(*) from user_follow where follow_id = #{user_id}")
    public Integer getFollowCount(@Param("user_id") Integer user_id);


    @Select("select count(*) from user_follow where be_followed_id = #{user_id}")
    public Integer getFansCount(@Param("user_id") Integer user_id);


    @Select("select * from user where id in (select follow_id from user_follow where be_followed_id = #{user_id})")
    public List<User> getFansList(@Param("user_id") Integer user_id);


    @Select("select * from user where id in (select be_followed_id from user_follow where follow_id = #{user_id})")
    public List<User> getFocusUserList(@Param("user_id") Integer user_id);
}
