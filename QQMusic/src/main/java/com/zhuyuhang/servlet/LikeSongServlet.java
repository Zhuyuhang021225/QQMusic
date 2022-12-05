package com.zhuyuhang.servlet;

import com.zhuyuhang.service.SongService;
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
@WebServlet("/likeSong")
public class LikeSongServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = request.getParameter("user_id");
        String song_id = request.getParameter("song_id");

        SongService songService = (SongService) SpringBeanUtils.getSpringBean(SongService.class);
        songService.likeSong(Integer.valueOf(user_id), Integer.valueOf(song_id));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
