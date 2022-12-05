package com.zhuyuhang.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @author Zhuyuhang
 */
@Repository
public interface MVFollowDao {

    @Select("select count(*) from MV_follow where user_id = #{user_id}")
    public Integer getFollowedMVCount(@Param("user_id") Integer user_id);
}
