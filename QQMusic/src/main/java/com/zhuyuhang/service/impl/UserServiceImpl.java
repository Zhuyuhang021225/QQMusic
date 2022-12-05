package com.zhuyuhang.service.impl;

import com.zhuyuhang.damain.User;
import com.zhuyuhang.dao.UserDao;
import com.zhuyuhang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Zhuyuhang
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User login(String account, String password) {
        return userDao.login(account, password);
    }
}
