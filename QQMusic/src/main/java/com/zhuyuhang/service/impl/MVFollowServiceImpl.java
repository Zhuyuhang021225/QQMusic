package com.zhuyuhang.service.impl;

import com.zhuyuhang.dao.MVFollowDao;
import com.zhuyuhang.service.MVFollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Zhuyuhang
 */
@Service
public class MVFollowServiceImpl implements MVFollowService {
    @Autowired
    private MVFollowDao mvFollowDao;

    @Override
    public Integer getFollowedMVCount(Integer user_id) {
        return mvFollowDao.getFollowedMVCount(user_id);
    }
}
