package com.zhuyuhang.service;

import com.zhuyuhang.damain.Song;
import com.zhuyuhang.damain.SongSheet;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Zhuyuhang
 */
public interface SongSheetService {

    public List<Song> getLikeSongs(Integer user_id);

    public List<SongSheet> getSongSheetListByUserId(Integer user_id);

    public SongSheet getSongSheetId(Integer songSheet_id);

    public List<SongSheet> getSongSheetListByCreator(Integer creator);

}
