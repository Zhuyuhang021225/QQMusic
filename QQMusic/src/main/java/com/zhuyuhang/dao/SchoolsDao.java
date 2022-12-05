package com.zhuyuhang.dao;

import com.zhuyuhang.damain.Schools;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @author Zhuyuhang
 */
@Repository
public interface SchoolsDao {

    @Select("select * from schools where id = #{schools_id}")
    public Schools findSchoolsById(@Param("schools_id") Integer schools_id);
}
