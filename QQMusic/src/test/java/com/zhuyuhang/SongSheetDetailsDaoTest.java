package com.zhuyuhang;

import com.zhuyuhang.dao.SongSheetDetailsDao;
import com.zhuyuhang.utils.SpringBeanUtils;
import org.junit.Test;

/**
 * @author Zhuyuhang
 */
public class SongSheetDetailsDaoTest {
    @Test
    public void testGetLikeSongCount(){
        SongSheetDetailsDao songSheetDetailsDao = (SongSheetDetailsDao) SpringBeanUtils.getSpringBean(SongSheetDetailsDao.class);
        Integer likeSongCount = songSheetDetailsDao.getLikeSongCount(10001);
        System.out.println(likeSongCount);
    }
}
