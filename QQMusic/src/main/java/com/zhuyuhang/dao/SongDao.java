package com.zhuyuhang.dao;

import com.zhuyuhang.damain.Album;
import com.zhuyuhang.damain.Schools;
import com.zhuyuhang.damain.Singer;
import com.zhuyuhang.damain.Song;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Zhuyuhang
 */
@Repository
public interface SongDao {

    @Select("select * from song where id = #{song_id}")
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
    public Song getSongById(@Param("song_id") Integer song_id);


    @Select("select * from song where id = #{song_id}")
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
    public List<Song> getSongListById(@Param("song_id") Integer song_id);


    @Select("select count(*) from song where singer_id = #{singer_id}")
    public Integer getSongCountBySingerId(@Param("singer_id") Integer singer_id);


    @Select("select count(*) from album where singer_id = #{singer_id}")
    public Integer getAlbumCountBySingerId(@Param("singer_id") Integer singer_id);


    @Select("select * from song where singer_id = #{singer_id} order by publish_time desc limit 0,10")
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
    public List<Song> getSongListBySingerId(@Param("singer_id") Integer singer_id);


    @Select("select * from song where album_id = #{album_id}")
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
    public List<Song> getSongListByAlbumId(@Param("album_id") Integer album_id);


    @Select("select * from song where id in (select song_id from song_sheet_details where song_sheet_id = #{song_sheet_id})")
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
    public List<Song> getSongListBySongSheetId(@Param("song_sheet_id") Integer song_sheet_id);


    @Select("select * from song inner join singer on singer.id = song.singer_id where song.name like concat('%',#{keyWords},'%') or singer.name like concat('%',#{keyWords},'%') limit 0,8")
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
    public List<Song> getSongListByKeyWords(@Param("keyWords") String keyWords);


    @Select("select count(*) from song_sheet_details where song_id = #{song_id} and song_sheet_id in (select song_sheet_id from song_sheet_follow where user_id = #{user_id} and song_sheet_id in (select song_sheet_id from song_sheet where name = '我喜欢'))")
    public Integer isLike(@Param("user_id")Integer user_id, @Param("song_id")Integer song_id);


    @Insert("insert into song_sheet_details values (#{song_id}, (select song_sheet_id from song_sheet_follow inner join song_sheet on song_sheet_follow.song_sheet_id = song_sheet.id where name = '我喜欢'))")
    public Integer likeSong(@Param("user_id")Integer user_id, @Param("song_id")Integer song_id);


    @Delete("delete from song_sheet_details where song_id = #{song_id} and song_sheet_id = (select song_sheet_id from song_sheet_follow inner join song_sheet on song_sheet_follow.song_sheet_id = song_sheet.id where name = '我喜欢')")
    public Integer unLikeSong(@Param("user_id")Integer user_id, @Param("song_id")Integer song_id);

}
