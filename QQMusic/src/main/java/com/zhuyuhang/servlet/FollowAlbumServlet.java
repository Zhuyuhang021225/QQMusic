package com.zhuyuhang.servlet;

import com.zhuyuhang.service.AlbumFollowService;
import com.zhuyuhang.service.SongSheetFollowService;
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
@WebServlet("/followAlbum")
public class FollowAlbumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = request.getParameter("user_id");
        String album_id = request.getParameter("album_id");

        AlbumFollowService albumFollowService = (AlbumFollowService) SpringBeanUtils.getSpringBean(AlbumFollowService.class);
        albumFollowService.followAlbum(Integer.valueOf(user_id), Integer.valueOf(album_id));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
