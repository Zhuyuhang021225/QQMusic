package com.zhuyuhang.servlet;

import com.zhuyuhang.damain.SongSheet;
import com.zhuyuhang.damain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Zhuyuhang
 */
@WebServlet("/createSongSheet")
public class CreateSongSheetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf_8");
        String name = request.getParameter("name");

        User loginUser = (User) request.getSession().getAttribute("loginUser");
        SongSheet songSheet = new SongSheet();


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
