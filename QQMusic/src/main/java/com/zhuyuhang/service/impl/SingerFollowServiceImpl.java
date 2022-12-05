package com.zhuyuhang.service.impl;

import com.zhuyuhang.damain.Singer;
import com.zhuyuhang.dao.SingerDao;
import com.zhuyuhang.dao.SingerFollowDao;
import com.zhuyuhang.service.SingerFollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Zhuyuhang
 */
@Service
public class SingerFollowServiceImpl implements SingerFollowService {
    @Autowired
    private SingerFollowDao singerFollowDao;

    @Override
    public Integer getSingerFollowCount(Integer singer_id) {
        return singerFollowDao.getSingerFollowCount(singer_id);
    }

    @Override
    public List<Singer> getFocusSingerList(Integer user_id) {
        return singerFollowDao.getFocusSingerList(user_id);
    }
}
