package com.zhuyuhang;

import com.zhuyuhang.damain.Song;
import com.zhuyuhang.damain.SongSheet;
import com.zhuyuhang.dao.SongSheetDao;
import com.zhuyuhang.dao.SongSheetFollowDao;
import com.zhuyuhang.utils.SpringBeanUtils;
import org.junit.Test;

import java.util.List;

/**
 * @author Zhuyuhang
 */
public class SongSheetDaoTest {
    @Test
    public void testGetLikeSongs(){
        SongSheetDao songSheetDao = (SongSheetDao) SpringBeanUtils.getSpringBean(SongSheetDao.class);
        List<Song> likeSongs = songSheetDao.getLikeSongs(10001);
        System.out.println(likeSongs);
    }

    @Test
    public void testGetSongSheetList(){
        SongSheetDao songSheetDao = (SongSheetDao) SpringBeanUtils.getSpringBean(SongSheetDao.class);
        List<SongSheet> songSheetListByUserId = songSheetDao.getSongSheetListByUserId(10001);
        System.out.println(songSheetListByUserId);
    }

    @Test
    public void testIsFollowed(){
        SongSheetFollowDao songSheetFollowDao = (SongSheetFollowDao) SpringBeanUtils.getSpringBean(SongSheetFollowDao.class);

    }
}
