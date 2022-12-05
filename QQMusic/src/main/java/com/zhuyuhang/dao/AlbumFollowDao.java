package com.zhuyuhang.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

/**
 * @author Zhuyuhang
 */
@Repository
public interface AlbumFollowDao {

    @Select("select count(*) from album_follow where user_id = #{user_id}")
    public Integer getFollowedAlbumCount(@Param("user_id") Integer user_id);


    @Select("select count(*) from album_follow where user_id = #{user_id} and album_id = #{album_id}")
    public Integer isFollowed(@Param("user_id")Integer user_id, @Param("album_id")Integer album_id);


    @Insert("insert into album_follow values (#{user_id}, #{album_id})")
    public Integer followAlbum(@Param("user_id")Integer user_id, @Param("album_id")Integer album_id);


    @Delete("delete from album_follow where user_id = #{user_id} and album_id = #{album_id}")
    public Integer unFollowAlbum(@Param("user_id")Integer user_id, @Param("album_id")Integer album_id);
}
