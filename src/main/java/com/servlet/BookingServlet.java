package com.servlet;

import com.model.Booking;
import com.model.User;
import com.service.BookTickets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import static com.model.User.getPnr;

public class BookingServlet extends HttpServlet {
    Booking booking;
    User user;
    BookTickets book = new BookTickets();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String[] name = request.getParameterValues("passenger_name");
        String[] age = request.getParameterValues("passenger_age");
        String[] phoneNumber = request.getParameterValues("passenger_phoneNumber");
        String[] berth = request.getParameterValues("berth");
        String userId = (String) session.getAttribute("pnrNumber");
        String pnr = getPnr();
        String status = "";
        for(int i = 0;i<name.length;i++){
            booking = new Booking(
                    Integer.parseInt(age[i]),
                    name[i],
                    phoneNumber[i],
                    berth[i]
            );
            try {
                status = ""+book.bookTickets(booking,pnr,userId);
            } catch (Exception e) {
                status = "false";
                e.printStackTrace();
            }
            response.getWriter().write(status);
        }

    }
}
