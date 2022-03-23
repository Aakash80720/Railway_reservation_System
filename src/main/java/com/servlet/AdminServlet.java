package com.servlet;

import com.DAO.LoginDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "admin", value = "/admin")
public class AdminServlet extends HttpServlet {
    LoginDao login = new LoginDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("adminLogin.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String phoneNumber = request.getParameter("phonenumber");
        String password = request.getParameter("password");
        String code = request.getParameter("admin_code");
        PrintWriter out = response.getWriter();
        if(login.adminLogin(username,password,phoneNumber,code))
        {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Admin logged Successfully !!!!!!!');");
            out.println("location='admin.jsp';");
            out.println("</script>");
        }
        else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Admin not found !!!!!!!');");
            out.println("location='adminLogin.jsp';");
            out.println("</script>");
        }
    }
}
