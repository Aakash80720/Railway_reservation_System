package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

import static com.DAO.LoginDao.admin;
import static com.DAO.LoginDao.user;

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        if(session != null){
            session.invalidate();
            user = null;
            admin = null;
        }
        out.println("<script type=\"text/javascript\">");
        out.println("alert('User Successfully logged out !!!!');");
        out.println("location='login.jsp';");
        out.println("</script>");
    }
}
