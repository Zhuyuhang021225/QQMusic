package com.zhuyuhang.service;

import com.zhuyuhang.damain.Singer;

/**
 * @author Zhuyuhang
 */
public interface SingerService {

    public Singer getSingerById(Integer singer_id);

    public Singer findSingerByKeyWords(String keyWords);
}
