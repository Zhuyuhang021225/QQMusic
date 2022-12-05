package com.zhuyuhang.dao;

import com.zhuyuhang.damain.*;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Zhuyuhang
 */
@Repository
public interface SongSheetDao {

    @Select("select * from song where id in (select song_id from song_sheet_details where song_sheet_id = (select song_sheet_id from song_sheet_follow inner join song_sheet on song_sheet.id = song_sheet_follow.song_sheet_id where user_id = #{user_id} and name = '我喜欢'))")
    @Results({
            @Result(
                    property = "singer", column = "singer_id",
                    javaType = Singer.class,
                    one = @One(select = "com.zhuyuhang.dao.SingerDao.findSingerById")
            ),
            @Result(
                    property = "album", column = "album_id",
                    javaType = Album.class,
                    one = @One(select = "com.zhuyuhang.dao.AlbumDao.findAlbumById")
            ),
            @Result(
                    property = "schools", column = "schools_id",
                    javaType = Schools.class,
                    one = @One(select = "com.zhuyuhang.dao.SchoolsDao.findSchoolsById")
            )
    })
    public List<Song> getLikeSongs(@Param("user_id") Integer user_id);


    @Select("select * from song_sheet where id in (select song_sheet_id from song_sheet_follow where user_id = #{user_id})")
    @Results({
            @Result(
                    property = "creator", column = "creator",
                    javaType = User.class,
                    one = @One(select = "com.zhuyuhang.dao.UserDao.findUserById")
            )
    })
    public List<SongSheet> getSongSheetListByUserId(@Param("user_id") Integer user_id);


    @Select("select * from song_sheet where id = #{songSheet_id}")
    @Results({
            @Result(
                    property = "creator", column = "creator",
                    javaType = User.class,
                    one = @One(select = "com.zhuyuhang.dao.UserDao.findUserById")
            )
    })
    public SongSheet getSongSheetId(@Param("songSheet_id") Integer songSheet_id);


    @Select("select * from song_sheet where creator = #{creator}")
    @Results({
            @Result(
                    property = "creator", column = "creator",
                    javaType = User.class,
                    one = @One(select = "com.zhuyuhang.dao.UserDao.findUserById")
            )
    })
    public List<SongSheet> getSongSheetListByCreator(@Param("creator") Integer creator);


    @Insert("insert into song_sheet (name,create_time,cover,creator) values (#{name},now(),'cover.png',user_id")
    public void createSongSheet(@Param("create")Integer user_id, @Param("name")String name);
}
