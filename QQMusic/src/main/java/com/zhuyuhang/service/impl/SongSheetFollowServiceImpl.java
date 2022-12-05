package com.zhuyuhang.service.impl;

import com.zhuyuhang.dao.SongSheetFollowDao;
import com.zhuyuhang.service.SongSheetDetailsService;
import com.zhuyuhang.service.SongSheetFollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Zhuyuhang
 */
@Service
public class SongSheetFollowServiceImpl implements SongSheetFollowService {
    @Autowired
    private SongSheetFollowDao songSheetFollowDao;

    @Override
    public Integer getFollowedSongSheetCount(Integer user_id) {
        return songSheetFollowDao.getFollowedSongSheetCount(user_id);
    }

    @Override
    public boolean isFollowed(Integer user_id, Integer songSheet_id) {
        Integer flag = songSheetFollowDao.isFollowed(user_id, songSheet_id);
        return (flag == 0) ? false:true;
    }

    @Override
    public boolean followSongSheet(Integer user_id, Integer songSheet_id) {
        Integer flag = songSheetFollowDao.followSongSheet(user_id, songSheet_id);
        return (flag != 0) ? true : false;
    }

    @Override
    public boolean unFollowSongSheet(Integer user_id, Integer songSheet_id) {
        Integer flag = songSheetFollowDao.unFollowSongSheet(user_id, songSheet_id);
        return (flag != 0) ? true : false;
    }
}
