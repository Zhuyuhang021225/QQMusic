package com.zhuyuhang;

import com.zhuyuhang.damain.User;
import com.zhuyuhang.dao.UserDao;
import com.zhuyuhang.utils.SpringBeanUtils;
import org.junit.Test;

/**
 * @author Zhuyuhang
 */
public class UserDaoTest {

    @Test
    public void testLogin(){
        UserDao userDao = (UserDao)SpringBeanUtils.getSpringBean(UserDao.class);
        User zhuyuhang = userDao.login("zhuyuhang", "123456");
        System.out.println(zhuyuhang);
    }
}
