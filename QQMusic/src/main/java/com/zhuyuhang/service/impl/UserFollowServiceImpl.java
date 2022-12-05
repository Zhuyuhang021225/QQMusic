package com.zhuyuhang.service.impl;

import com.zhuyuhang.damain.User;
import com.zhuyuhang.dao.UserFollowDao;
import com.zhuyuhang.service.UserFollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Zhuyuhang
 */
@Service
public class UserFollowServiceImpl implements UserFollowService {
    @Autowired
    private UserFollowDao userFollowDao;

    @Override
    public Integer getFollowCount(Integer user_id) {
        return userFollowDao.getFollowCount(user_id);
    }

    @Override
    public Integer getFansCount(Integer user_id) {
        return userFollowDao.getFansCount(user_id);
    }

    @Override
    public List<User> getFansList(Integer user_id) {
        return userFollowDao.getFansList(user_id);
    }

    @Override
    public List<User> getFocusUserList(Integer user_id) {
        return userFollowDao.getFocusUserList(user_id);
    }
}
