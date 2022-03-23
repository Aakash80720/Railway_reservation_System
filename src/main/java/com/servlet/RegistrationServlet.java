package com.servlet;

import com.DAO.RegisterDao;
import com.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
public class RegistrationServlet extends HttpServlet {
    User user;
    RegisterDao register = new RegisterDao();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        user = new User(request.getParameter("username")
                ,Integer.parseInt(request.getParameter("age"))
                ,request.getParameter("password")
                ,request.getParameter("phonenumber"));
        try {
            if (register.registerDao(user)){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User successfully added !!!!!!!');");
                out.println("location='login.jsp';");
                out.println("</script>");
            }
            else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Registration Unsuccessful !!!!!!!');");
                out.println("alert('Registration Unsuccessful !!!!!!!');");
                out.println("location='register.jsp';");
                out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Registration error !!!!!!!');");
            out.println("location='register.jsp';");
            out.println("</script>");
        }


    }
}
