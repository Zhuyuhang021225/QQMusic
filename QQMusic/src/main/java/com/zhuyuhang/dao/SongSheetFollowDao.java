package com.zhuyuhang.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @author Zhuyuhang
 */
@Repository
public interface SongSheetFollowDao {

    @Select("select count(*) from song_sheet_follow where user_id = #{user_id}")
    public Integer getFollowedSongSheetCount(@Param("user_id") Integer user_id);


    @Select("select count(*) from song_sheet_follow where user_id = #{user_id} and song_sheet_id = #{songSheet_id}")
    public Integer isFollowed(@Param("user_id")Integer user_id, @Param("songSheet_id")Integer songSheet_id);


    @Insert("insert into song_sheet_follow values (#{user_id}, #{songSheet_id})")
    public Integer followSongSheet(@Param("user_id")Integer user_id, @Param("songSheet_id")Integer songSheet_id);


    @Delete("delete from song_sheet_follow where user_id = #{user_id} and song_sheet_id = #{songSheet_id}")
    public Integer unFollowSongSheet(@Param("user_id")Integer user_id, @Param("songSheet_id")Integer songSheet_id);
}
