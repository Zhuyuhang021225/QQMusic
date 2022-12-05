package com.zhuyuhang.servlet;

import com.zhuyuhang.dao.SongSheetDao;
import com.zhuyuhang.service.SongSheetDetailsService;
import com.zhuyuhang.service.SongSheetService;
import com.zhuyuhang.utils.SpringBeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Zhuyuhang
 */
@WebServlet("/addSongToSongSheet")
public class AddSongToSongSheetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String song_id = request.getParameter("song_id");
        String songSheet_id = request.getParameter("songSheet_id");

        SongSheetDetailsService songSheetDetailsService = (SongSheetDetailsService) SpringBeanUtils.getSpringBean(SongSheetDetailsService.class);
        songSheetDetailsService.addSongToSongSheet(Integer.valueOf(song_id),Integer.valueOf(songSheet_id));

        SongSheetDao songSheetDao = (SongSheetDao) SpringBeanUtils.getSpringBean(SongSheetDao.class);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
