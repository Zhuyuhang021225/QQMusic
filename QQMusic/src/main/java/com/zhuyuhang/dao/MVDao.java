package com.zhuyuhang.dao;

import com.zhuyuhang.damain.MV;
import com.zhuyuhang.damain.Song;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Zhuyuhang
 */
@Repository
public interface MVDao {

    @Select("select count(id) from mv where song_id in (select id from song where singer_id = #{singer_id})")
    public Integer getMVCountBySingerId(@Param("singer_id") Integer singer_id);


    @Select("select * from mv where song_id in (select id from song where singer_id = #{singer_id})")
    @Results({
            @Result(
                    property = "song", column = "song_id",
                    javaType = Song.class,
                    one = @One(select = "com.zhuyuhang.dao.SongDao.getSongById")
            )
    })
    public List<MV> getMVListBySingerId(@Param("singer_id") Integer singer_id);
}
