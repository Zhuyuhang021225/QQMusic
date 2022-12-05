package com.zhuyuhang.service;

import com.zhuyuhang.damain.Song;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author Zhuyuhang
 */
public interface SongService {

    public Song getSongById(Integer song_id);

    public List<Song> getSongListById(Integer song_id);

    public Integer getSongCountBySingerId(Integer singer_id);

    public Integer getAlbumCountBySingerId(Integer singer_id);

    public List<Song> getSongListBySingerId(Integer singer_id);

    public List<Song> getSongListByAlbumId(Integer album_id);

    public List<Song> getSongListBySongSheetId(Integer song_sheet_id);

    public List<Song> getSongListByKeyWords(String keyWords);

    public boolean isLike(Integer user_id, Integer song_id);

    public boolean likeSong(Integer user_id, Integer song_id);

    public boolean unLikeSong(Integer user_id, Integer song_id);
}
