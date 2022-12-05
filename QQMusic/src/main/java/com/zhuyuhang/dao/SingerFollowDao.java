package com.zhuyuhang.dao;

import com.zhuyuhang.damain.Singer;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * @author Zhuyuhang
 */
@Repository
public interface SingerFollowDao {

    @Select("select count(*) from singer_follow where singer_id = #{singer_id}")
    public Integer getSingerFollowCount(@Param("singer_id") Integer singer_id);


    @Select("select * from singer where id in (select singer_id from singer_follow where user_id = #{user_id})")
    public List<Singer> getFocusSingerList(@Param("user_id") Integer user_id);


}
