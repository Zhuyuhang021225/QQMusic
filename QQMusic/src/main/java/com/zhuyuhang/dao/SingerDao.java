package com.zhuyuhang.dao;

import com.zhuyuhang.damain.Singer;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @author Zhuyuhang
 */
@Repository
public interface SingerDao {

    @Select("select * from singer where id = #{singer_id}")
    public Singer findSingerById(Integer singer_id);

    @Select("select * from singer where name = #{keyWords}")
    public Singer findSingerByKeyWords(String keyWords);
}
