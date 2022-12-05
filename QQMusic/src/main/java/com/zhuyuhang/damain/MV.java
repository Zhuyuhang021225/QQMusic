package com.zhuyuhang.damain;

/**
 * @author Zhuyuhang
 */
public class MV {
    private Integer id;
    private String name;
    private String introduction;
    private String time_length;
    private String path;
    private Song song;

    public MV() {
    }

    public MV(Integer id, String name, String introduction, String time_length, String path, Song song) {
        this.id = id;
        this.name = name;
        this.introduction = introduction;
        this.time_length = time_length;
        this.path = path;
        this.song = song;
    }

    @Override
    public String toString() {
        return "MV{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", introduction='" + introduction + '\'' +
                ", time_length='" + time_length + '\'' +
                ", path='" + path + '\'' +
                ", song=" + song +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getTime_length() {
        return time_length;
    }

    public void setTime_length(String time_length) {
        this.time_length = time_length;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Song getSong() {
        return song;
    }

    public void setSong(Song song) {
        this.song = song;
    }
}
