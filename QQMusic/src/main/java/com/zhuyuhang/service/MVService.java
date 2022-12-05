package com.zhuyuhang.service;

import com.zhuyuhang.damain.MV;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Zhuyuhang
 */
public interface MVService {

    public Integer getMVCountBySingerId(Integer singer_id);

    public List<MV> getMVListBySingerId(Integer singer_id);
}
