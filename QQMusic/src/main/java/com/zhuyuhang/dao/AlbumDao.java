package com.zhuyuhang.dao;

import com.zhuyuhang.damain.Album;
import com.zhuyuhang.damain.Singer;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Zhuyuhang
 */
@Repository
public interface AlbumDao {

    @Select("select * from album where id = #{album_id}")
    @Results({
            @Result(
                    property = "singer",column = "singer_id",
                    javaType = Singer.class,
                    one = @One(select = "com.zhuyuhang.dao.SingerDao.findSingerById")
            )
    })
    public Album findAlbumById(@Param("album_id") Integer album_id);


    @Select("select * from album where id in (select album_id from album_follow where user_id = #{user_id})")
    @Results({
            @Result(
                    property = "singer",column = "singer_id",
                    javaType = Singer.class,
                    one = @One(select = "com.zhuyuhang.dao.SingerDao.findSingerById")
            )
    })
    public List<Album> findAlbumListByUserId(@Param("user_id") Integer user_id);


    @Select("select * from album where id in (select album_id from song where singer_id = #{singer_id}) order by publish_time desc")
    @Results({
            @Result(
                    property = "singer",column = "singer_id",
                    javaType = Singer.class,
                    one = @One(select = "com.zhuyuhang.dao.SingerDao.findSingerById")
            )
    })
    public List<Album> findAlbumListBySingerId(@Param("singer_id") Integer singer_id);


    @Select("select * from album where name like concat('%',#{keyWords},'%')")
    @Results({
            @Result(
                    property = "singer",column = "singer_id",
                    javaType = Singer.class,
                    one = @One(select = "com.zhuyuhang.dao.SingerDao.findSingerById")
            )
    })
    public List<Album> findAlbumListByKeyWords(@Param("keyWords") String keyWords);


    @Select("select * from album limit #{begin},#{length}")
    @Results({
            @Result(
                    property = "singer",column = "singer_id",
                    javaType = Singer.class,
                    one = @One(select = "com.zhuyuhang.dao.SingerDao.findSingerById")
            )
    })
    public List<Album> findAll(@Param("begin") Integer begin, @Param("length") Integer length);
}
