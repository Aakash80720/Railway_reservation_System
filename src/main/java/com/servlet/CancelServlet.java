package com.servlet;

import com.service.CancelTickets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

public class CancelServlet extends HttpServlet {
    CancelTickets cancel = new CancelTickets();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int seatNo = Integer.parseInt(request.getParameter("CNL_serialNo"));
        PrintWriter out = response.getWriter();
        try {
            if(cancel.cancelTickets(seatNo)){
                out.println("<script type =\"javascript/text\"");
                out.println("alert('passenger has canceled')");
                out.println("</script>");
            }
            else {
                out.println("<script type =\"javascript/text\"");
                out.println("alert('passenger has not able to cancel')");
                out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/view");
    }
}
