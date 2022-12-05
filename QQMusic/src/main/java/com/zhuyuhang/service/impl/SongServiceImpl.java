package com.zhuyuhang.service.impl;

import com.zhuyuhang.damain.Song;
import com.zhuyuhang.dao.SongDao;
import com.zhuyuhang.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Zhuyuhang
 */
@Service
public class SongServiceImpl implements SongService {
    @Autowired
    private SongDao songDao;

    @Override
    public Song getSongById(Integer song_id) {
        return songDao.getSongById(song_id);
    }

    @Override
    public List<Song> getSongListById(Integer song_id) {
        return songDao.getSongListById(song_id);
    }

    @Override
    public Integer getSongCountBySingerId(Integer singer_id) {
        return songDao.getSongCountBySingerId(singer_id);
    }

    @Override
    public Integer getAlbumCountBySingerId(Integer singer_id) {
        return songDao.getAlbumCountBySingerId(singer_id);
    }

    @Override
    public List<Song> getSongListBySingerId(Integer singer_id) {
        return songDao.getSongListBySingerId(singer_id);
    }

    @Override
    public List<Song> getSongListByAlbumId(Integer album_id) {
        return songDao.getSongListByAlbumId(album_id);
    }

    @Override
    public List<Song> getSongListBySongSheetId(Integer song_sheet_id) {
        return songDao.getSongListBySongSheetId(song_sheet_id);
    }

    @Override
    public List<Song> getSongListByKeyWords(String keyWords) {
        return songDao.getSongListByKeyWords(keyWords);
    }

    @Override
    public boolean isLike(Integer user_id, Integer song_id) {
        Integer flag = songDao.isLike(user_id, song_id);
        return flag == 0 ? false : true;
    }

    @Override
    public boolean likeSong(Integer user_id, Integer song_id) {
        Integer flag = songDao.likeSong(user_id, song_id);
        return flag == 0 ? false : true;
    }

    @Override
    public boolean unLikeSong(Integer user_id, Integer song_id) {
        Integer flag = songDao.unLikeSong(user_id, song_id);
        return flag == 0 ? false : true;
    }
}
