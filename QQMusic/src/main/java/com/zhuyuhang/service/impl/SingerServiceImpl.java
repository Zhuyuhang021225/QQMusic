package com.zhuyuhang.service.impl;

import com.zhuyuhang.damain.Singer;
import com.zhuyuhang.dao.SingerDao;
import com.zhuyuhang.service.SingerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Zhuyuhang
 */
@Service
public class SingerServiceImpl implements SingerService {
    @Autowired
    private SingerDao singerDao;

    @Override
    public Singer getSingerById(Integer singer_id) {
        return singerDao.findSingerById(singer_id);
    }

    @Override
    public Singer findSingerByKeyWords(String keyWords) {
        return singerDao.findSingerByKeyWords(keyWords);
    }
}
