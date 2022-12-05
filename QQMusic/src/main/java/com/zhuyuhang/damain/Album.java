package com.zhuyuhang.damain;

import java.util.Date;

/**
 * @author Zhuyuhang
 */
public class Album {
    private Integer id;
    private String name;
    private String cover;
    private Date publish_time;
    private String company;
    private String introduction;
    private Singer singer;

    public Album() {
    }

    public Album(Integer id, String name, String cover, Date publish_time, String company, String introduction, Singer singer) {
        this.id = id;
        this.name = name;
        this.cover = cover;
        this.publish_time = publish_time;
        this.company = company;
        this.introduction = introduction;
        this.singer = singer;
    }

    @Override
    public String toString() {
        return "Album{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", cover='" + cover + '\'' +
                ", publish_time=" + publish_time +
                ", company='" + company + '\'' +
                ", introduction='" + introduction + '\'' +
                ", singer=" + singer +
                '}';
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
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

    public Date getPublish_time() {
        return publish_time;
    }

    public void setPublish_time(Date publish_time) {
        this.publish_time = publish_time;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Singer getSinger() {
        return singer;
    }

    public void setSinger(Singer singer) {
        this.singer = singer;
    }
}
