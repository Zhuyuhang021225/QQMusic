package com.zhuyuhang.service.impl;

import com.zhuyuhang.damain.Song;
import com.zhuyuhang.damain.SongSheet;
import com.zhuyuhang.dao.SongSheetDao;
import com.zhuyuhang.service.SongSheetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Zhuyuhang
 */
@Service
public class SongSheetServiceImpl implements SongSheetService {
    @Autowired
    private SongSheetDao songSheetDao;

    @Override
    public List<Song> getLikeSongs(Integer user_id) {
        return songSheetDao.getLikeSongs(user_id);
    }

    @Override
    public List<SongSheet> getSongSheetListByUserId(Integer user_id) {
        return songSheetDao.getSongSheetListByUserId(user_id);
    }

    @Override
    public SongSheet getSongSheetId(Integer songSheet_id) {
        return songSheetDao.getSongSheetId(songSheet_id);
    }

    @Override
    public List<SongSheet> getSongSheetListByCreator(Integer creator) {
        return songSheetDao.getSongSheetListByCreator(creator);
    }


}
