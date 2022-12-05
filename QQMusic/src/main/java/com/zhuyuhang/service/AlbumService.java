package com.zhuyuhang.service;

import com.zhuyuhang.damain.Album;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Zhuyuhang
 */
public interface AlbumService {

    public Album findAlbumById(Integer album_id);

    public List<Album> findAlbumListByUserId(Integer user_id);

    public List<Album> findAlbumListBySingerId(Integer singer_id);

    public List<Album> findAlbumListByKeyWords(String keyWords);

    public List<Album> findAll(Integer begin, Integer length);
}
