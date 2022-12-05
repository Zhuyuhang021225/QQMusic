package com.zhuyuhang.service.impl;

import com.zhuyuhang.dao.SongSheetDetailsDao;
import com.zhuyuhang.service.SongSheetDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Zhuyuhang
 */
@Service
public class SongSheetDetailsServiceImpl implements SongSheetDetailsService {
    @Autowired
    private SongSheetDetailsDao songSheetDetailsDao;

    @Override
    public Integer getLikeSongCount(Integer user_id) {
        return songSheetDetailsDao.getLikeSongCount(user_id);
    }

    @Override
    public void addSongToSongSheet(Integer song_id, Integer songSheet_id) {
        songSheetDetailsDao.addSongToSongSheet(song_id, songSheet_id);
    }


}
