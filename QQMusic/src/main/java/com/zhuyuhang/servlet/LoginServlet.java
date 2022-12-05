package com.zhuyuhang.servlet;

import com.zhuyuhang.damain.User;
import com.zhuyuhang.service.UserService;
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
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");

        UserService userService = (UserService) SpringBeanUtils.getSpringBean(UserService.class);
        User loginUser = userService.login(account, password);
        if (loginUser == null){
            request.setAttribute("login_error","账户或密码错误！");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }else {
            request.getSession().setAttribute("loginUser", loginUser);
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
