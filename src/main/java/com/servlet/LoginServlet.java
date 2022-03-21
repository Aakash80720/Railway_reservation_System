package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import static com.DAO.LoginDao.user;

public class LoginServlet extends HttpServlet {
    HttpSession oldSession,newSession;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        oldSession = request.getSession(false);
        if (oldSession != null) {
            oldSession.invalidate();
        }
        newSession = request.getSession(true);
        newSession.setMaxInactiveInterval(5*60);
        newSession.setAttribute("username", user.getUserName());
        newSession.setAttribute("pnrNumber",user.getPnrNumber());
        newSession.setAttribute("age",user.getAge());
        newSession.setAttribute("phonenumber",user.getPhoneNumber());
        response.sendRedirect("home.jsp");

    }
}
