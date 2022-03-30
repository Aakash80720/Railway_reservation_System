package com.servlet;

import com.model.Passenger;
import com.service.GetPassengers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "passengers", value = "/passengers")
public class PassengerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GetPassengers passengers = new GetPassengers();
        List<Passenger> passengerList = new ArrayList<>();
        try {
            passengerList = passengers.getPassengers();
        } catch (Exception e) {
            e.printStackTrace();
        }
        HttpSession session = request.getSession();
        session.setAttribute("passengers",passengerList);
        response.sendRedirect("passenger.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
