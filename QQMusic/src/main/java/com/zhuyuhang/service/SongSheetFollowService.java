package com.zhuyuhang.service;

import org.apache.ibatis.annotations.Param;

/**
 * @author Zhuyuhang
 */
public interface SongSheetFollowService {

    public Integer getFollowedSongSheetCount(Integer user_id);

    public boolean isFollowed(Integer user_id, Integer songSheet_id);

    public boolean followSongSheet(Integer user_id, Integer songSheet_id);

    public boolean unFollowSongSheet(Integer user_id, Integer songSheet_id);
}
