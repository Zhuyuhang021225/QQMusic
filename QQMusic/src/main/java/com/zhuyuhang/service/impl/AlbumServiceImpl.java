package com.zhuyuhang.service.impl;

import com.zhuyuhang.damain.Album;
import com.zhuyuhang.dao.AlbumDao;
import com.zhuyuhang.service.AlbumService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Zhuyuhang
 */
@Service
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    private AlbumDao albumDao;

    @Override
    public Album findAlbumById(Integer album_id) {
        return albumDao.findAlbumById(album_id);
    }

    @Override
    public List<Album> findAlbumListByUserId(Integer user_id) {
        return albumDao.findAlbumListByUserId(user_id);
    }

    @Override
    public List<Album> findAlbumListBySingerId(Integer singer_id) {
        return albumDao.findAlbumListBySingerId(singer_id);
    }

    @Override
    public List<Album> findAlbumListByKeyWords(String keyWords) {
        return albumDao.findAlbumListByKeyWords(keyWords);
    }

    @Override
    public List<Album> findAll(Integer begin, Integer length) {
        return albumDao.findAll(begin, length);
    }


}
