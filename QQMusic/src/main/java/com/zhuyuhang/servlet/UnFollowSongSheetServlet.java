package com.zhuyuhang.servlet;

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
@WebServlet("/unFollowSongSheet")
public class UnFollowSongSheetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = request.getParameter("user_id");
        String songSheet_id = request.getParameter("songSheet_id");

        SongSheetFollowService songSheetFollowService = (SongSheetFollowService) SpringBeanUtils.getSpringBean(SongSheetFollowService.class);
        songSheetFollowService.unFollowSongSheet(Integer.valueOf(user_id), Integer.valueOf(songSheet_id));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
