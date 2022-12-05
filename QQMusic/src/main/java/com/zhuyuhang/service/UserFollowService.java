package com.zhuyuhang.service;

import com.zhuyuhang.damain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Zhuyuhang
 */
public interface UserFollowService {

    public Integer getFollowCount(Integer user_id);

    public Integer getFansCount(Integer user_id);

    public List<User> getFansList(Integer user_id);

    public List<User> getFocusUserList(Integer user_id);
}
