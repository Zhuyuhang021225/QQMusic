package com.zhuyuhang.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @author Zhuyuhang
 */
@Repository
public interface SongSheetDetailsDao {

    @Select("select count(*) from song_sheet_details where song_sheet_id = (select song_sheet_id from song_sheet_follow inner join song_sheet on song_sheet.id = song_sheet_follow.song_sheet_id where user_id = #{user_id} and name = '我喜欢')")
    public Integer getLikeSongCount(@Param("user_id") Integer user_id);


    @Insert("insert into song_sheet_details values (#{song_id}, #{songSheet_id})")
    public void addSongToSongSheet(@Param("song_id")Integer song_id, @Param("songSheet_id")Integer songSheet_id);
}
