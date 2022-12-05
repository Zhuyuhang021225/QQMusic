package com.zhuyuhang.damain;

import java.util.Date;

/**
 * @author Zhuyuhang
 */
public class SongSheet {
    private Integer id;
    private String name;
    private String cover;
    private Date create_time;
    private String introduction;
    private Integer play_count;
    private User creator;

    public SongSheet() {
    }

    public SongSheet(Integer id, String name, String cover, Date create_time, String introduction, Integer play_count, User creator) {
        this.id = id;
        this.name = name;
        this.cover = cover;
        this.create_time = create_time;
        this.introduction = introduction;
        this.play_count = play_count;
        this.creator = creator;
    }

    @Override
    public String toString() {
        return "SongSheet{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", cover='" + cover + '\'' +
                ", create_time=" + create_time +
                ", introduction='" + introduction + '\'' +
                ", play_count=" + play_count +
                ", creator=" + creator +
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

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Integer getPlay_count() {
        return play_count;
    }

    public void setPlay_count(Integer play_count) {
        this.play_count = play_count;
    }
}
