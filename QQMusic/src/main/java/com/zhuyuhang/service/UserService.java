package com.zhuyuhang.service;

import com.zhuyuhang.damain.User;

/**
 * @author Zhuyuhang
 */
public interface UserService {

    public User login(String account, String password);
}
