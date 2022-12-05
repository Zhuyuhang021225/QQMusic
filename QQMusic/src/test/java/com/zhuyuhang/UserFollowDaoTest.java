package com.zhuyuhang;

import com.zhuyuhang.dao.UserFollowDao;
import com.zhuyuhang.utils.SpringBeanUtils;
import org.junit.Test;

/**
 * @author Zhuyuhang
 */
public class UserFollowDaoTest {
    @Test
    public void getFollowCount(){
        UserFollowDao userFollowDao = (UserFollowDao) SpringBeanUtils.getSpringBean(UserFollowDao.class);
        Integer count = userFollowDao.getFollowCount(10001);
        System.out.println(count);
    }
}
