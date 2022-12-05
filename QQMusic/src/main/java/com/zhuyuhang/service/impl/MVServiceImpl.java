package com.zhuyuhang.service.impl;

import com.zhuyuhang.damain.MV;
import com.zhuyuhang.dao.MVDao;
import com.zhuyuhang.service.MVService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Zhuyuhang
 */
@Service
public class MVServiceImpl implements MVService {
    @Autowired
    private MVDao mvDao;


    @Override
    public Integer getMVCountBySingerId(Integer singer_id) {
        return mvDao.getMVCountBySingerId(singer_id);
    }

    @Override
    public List<MV> getMVListBySingerId(Integer singer_id) {
        return mvDao.getMVListBySingerId(singer_id);
    }
}
