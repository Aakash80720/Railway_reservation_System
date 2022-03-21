package com.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

@WebFilter(filterName = "validation")
public class ValidationFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        if(!password.equals(confirmPassword)){
            ((HttpServletResponse)response).sendRedirect("register.jsp");
        }
        else {
            chain.doFilter(request, response);
        }
    }
}
