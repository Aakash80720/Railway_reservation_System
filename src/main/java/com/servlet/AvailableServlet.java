package com.servlet;

import com.model.Berth;
import com.service.Available;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class AvailableServlet extends HttpServlet {
    Available available = new Available();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            List<Berth> availableBerth = available.getAvailable();
            HttpSession session = request.getSession(true);
            session.setAttribute("available",availableBerth);
            response.sendRedirect("viewAvailable.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Something Error !!!!!!!');");
            out.println("location='home.jsp';");
            out.println("</script>");
        }
    }

}
