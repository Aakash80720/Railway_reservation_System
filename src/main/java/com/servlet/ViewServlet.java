package com.servlet;

import com.model.Passenger;
import com.service.GetTickets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class ViewServlet extends HttpServlet {
    GetTickets getTickets = new GetTickets();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher req = getServletContext().getRequestDispatcher("/view");
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       HttpSession session = request.getSession(true);
       String userId  =  (String) session.getAttribute("pnrNumber");
       try {
           List<String> pnr = getTickets.getPNR(userId);
           List<List<Passenger>> ticketList = new ArrayList<>();
           pnr.forEach(i->{
               List<Passenger> passenger = new ArrayList<>();
               try {
                   passenger = getTickets.getTicket(i);
               } catch (Exception e) {
                   e.printStackTrace();
               }
               ticketList.add(passenger);
           });
               session.setAttribute("ticketList",ticketList);
               response.sendRedirect("viewTickets.jsp");
       }
       catch (Exception e){
           e.printStackTrace();
       }

    }
}
