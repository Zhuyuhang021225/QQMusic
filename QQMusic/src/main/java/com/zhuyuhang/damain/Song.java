package com.zhuyuhang.damain;

import javax.xml.crypto.Data;
import java.util.Date;

/**
 * @author Zhuyuhang
 */
public class Song {
    private Integer id;
    private String name;
    private String time_length;
    private String lyricism;
    private String composer;
    private String arranger;
    private String introduction;
    private Date publish_time;
    private String lyrics;
    private String path;
    private Singer singer;
    private Album album;
    private Schools schools;

    public Song() {
    }

    public Song(Integer id, String name, String time_length, String lyricism, String composer, String arranger, String introduction, Date publish_time, String lyrics, String path, Singer singer, Album album, Schools schools) {
        this.id = id;
        this.name = name;
        this.time_length = time_length;
        this.lyricism = lyricism;
        this.composer = composer;
        this.arranger = arranger;
        this.introduction = introduction;
        this.publish_time = publish_time;
        this.lyrics = lyrics;
        this.path = path;
        this.singer = singer;
        this.album = album;
        this.schools = schools;
    }

    @Override
    public String toString() {
        return "Song{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", time_length='" + time_length + '\'' +
                ", lyricism='" + lyricism + '\'' +
                ", composer='" + composer + '\'' +
                ", arranger='" + arranger + '\'' +
                ", introduction='" + introduction + '\'' +
                ", publish_time=" + publish_time +
                ", lyrics='" + lyrics + '\'' +
                ", path='" + path + '\'' +
                ", singer=" + singer +
                ", album=" + album +
                ", schools=" + schools +
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

    public String getTime_length() {
        return time_length;
    }

    public void setTime_length(String time_length) {
        this.time_length = time_length;
    }

    public String getLyricism() {
        return lyricism;
    }

    public void setLyricism(String lyricism) {
        this.lyricism = lyricism;
    }

    public String getComposer() {
        return composer;
    }

    public void setComposer(String composer) {
        this.composer = composer;
    }

    public String getArranger() {
        return arranger;
    }

    public void setArranger(String arranger) {
        this.arranger = arranger;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Date getPublish_time() {
        return publish_time;
    }

    public void setPublish_time(Date publish_time) {
        this.publish_time = publish_time;
    }

    public String getLyrics() {
        return lyrics;
    }

    public void setLyrics(String lyrics) {
        this.lyrics = lyrics;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Singer getSinger() {
        return singer;
    }

    public void setSinger(Singer singer) {
        this.singer = singer;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public Schools getSchools() {
        return schools;
    }

    public void setSchools(Schools schools) {
        this.schools = schools;
    }
}
