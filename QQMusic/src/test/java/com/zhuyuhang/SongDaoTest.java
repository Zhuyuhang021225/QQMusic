package com.zhuyuhang;

import com.zhuyuhang.damain.Song;
import com.zhuyuhang.dao.SongDao;
import com.zhuyuhang.utils.SpringBeanUtils;
import org.junit.Test;

import java.util.List;

/**
 * @author Zhuyuhang
 */
public class SongDaoTest {
    @Test
    public void test01(){
        SongDao songDao = (SongDao) SpringBeanUtils.getSpringBean(SongDao.class);
        List<Song> s1 = songDao.getSongListByKeyWords("杰");
        System.out.println(s1);
    }

    @Test
    public void test02(){
        SongDao songDao = (SongDao) SpringBeanUtils.getSpringBean(SongDao.class);
        Integer like = songDao.isLike(10001, 60001);
        System.out.println(like);
    }

    @Test
    public void test03(){
        SongDao songDao = (SongDao) SpringBeanUtils.getSpringBean(SongDao.class);
        Integer like = songDao.likeSong(10001, 60001);
        System.out.println(like);
    }

    @Test
    public void test04(){
        SongDao songDao = (SongDao) SpringBeanUtils.getSpringBean(SongDao.class);
        Integer like = songDao.unLikeSong(10001, 60001);
        System.out.println(like);
    }
}
