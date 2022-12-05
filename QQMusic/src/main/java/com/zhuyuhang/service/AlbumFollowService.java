package com.zhuyuhang.service;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @author Zhuyuhang
 */
public interface AlbumFollowService {

    public Integer getFollowedAlbumCount(Integer user_id);

    public boolean isFollowed(Integer user_id, Integer album_id);

    public boolean followAlbum(Integer user_id, Integer album_id);

    public boolean unFollowAlbum(Integer user_id, Integer album_id);
}
