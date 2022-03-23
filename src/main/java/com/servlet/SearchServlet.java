package com.servlet;

import com.model.Passenger;
import com.service.SearchRequest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

public class SearchServlet extends HttpServlet {
    SearchRequest search = new SearchRequest();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Passenger> instance = search.getSearch(""+request.getParameter("search"));
            if(instance.isEmpty()){
                response.getWriter().write("false");
            }
            else{
                HttpSession session = request.getSession(true);
                session.setAttribute("passengers",instance);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
