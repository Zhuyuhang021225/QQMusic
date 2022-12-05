package com.zhuyuhang.service.impl;

import com.zhuyuhang.dao.AlbumFollowDao;
import com.zhuyuhang.service.AlbumFollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Zhuyuhang
 */
@Service
public class AlbumFollowServiceImpl implements AlbumFollowService {
    @Autowired
    private AlbumFollowDao albumFollowDao;

    @Override
    public Integer getFollowedAlbumCount(Integer user_id) {
        return albumFollowDao.getFollowedAlbumCount(user_id);
    }

    @Override
    public boolean isFollowed(Integer user_id, Integer album_id) {
        Integer flag = albumFollowDao.isFollowed(user_id, album_id);
        return flag == 0 ? false : true;
    }

    @Override
    public boolean followAlbum(Integer user_id, Integer album_id) {
        Integer flag = albumFollowDao.followAlbum(user_id, album_id);
        return flag == 0 ? false : true;
    }

    @Override
    public boolean unFollowAlbum(Integer user_id, Integer album_id) {
        Integer flag = albumFollowDao.unFollowAlbum(user_id, album_id);
        return flag == 0 ? false : true;
    }
}
