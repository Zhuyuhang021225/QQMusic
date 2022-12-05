package com.zhuyuhang.service;

import com.zhuyuhang.damain.Singer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Zhuyuhang
 */
public interface SingerFollowService {

    public Integer getSingerFollowCount(Integer singer_id);

    public List<Singer> getFocusSingerList(Integer user_id);
}
