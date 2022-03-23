package com.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "AdminFilter")
public class AdminFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(true);
        String user = ""+(String) session.getAttribute("username");
        PrintWriter out = response.getWriter();
        if(user.equals("null"))
            chain.doFilter(request, response);
        else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Illegal request user to Admin !!!!!!!');");
            out.println("location='login.jsp';");
            out.println("</script>");
        }
    }
}
