package com.filter;

import com.DAO.LoginDao;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class AuthenticationFilter implements Filter {
    LoginDao login = new LoginDao();
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        String username = request.getParameter("username");
        String phoneNumber = request.getParameter("phonenumber");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();

        if(login.loginDao(username,phoneNumber,password).equals("Admin")){
            chain.doFilter(request, response);
        }
        else if(login.loginDao(username,phoneNumber,password).equals("User")){
            chain.doFilter(request, response);
     }
        else{
            ((HttpServletResponse)response).sendRedirect("login.jsp");
        }

    }
}
