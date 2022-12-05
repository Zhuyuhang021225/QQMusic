package com.zhuyuhang.service;

import org.apache.ibatis.annotations.Param;

/**
 * @author Zhuyuhang
 */
public interface SongSheetDetailsService {

    public Integer getLikeSongCount(Integer user_id);

    public void addSongToSongSheet(Integer song_id, Integer songSheet_id);
}
