package com.servlet;

import com.service.DatabaseConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "add", value = "/add")
public class AddServlet extends HttpServlet {
    DatabaseConnection database = new DatabaseConnection();
    Connection connection;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            int coach = Integer.parseInt(request.getParameter("coach_count"));
            int cabin = Integer.parseInt(request.getParameter("cabin_count"));
            connection = database.getConnection();
            int c = 0;

            String sql = "select max(coach_no) from public.\"coach_table\"";
            PreparedStatement statement = connection.prepareStatement(sql);
            String sql1 = "insert into public.\"coach_table\"(coach_no) values(?)";
            PreparedStatement statement1 = connection.prepareStatement(sql1);
            String sql2 = "ALTER sequence coach_table_seat_no_seq restart with 1";
            PreparedStatement statement2 = connection.prepareStatement(sql2);
            ResultSet r = statement.executeQuery();
            if (r.next()) {
                c = r.getInt(1);
                System.out.println(c);
            }
            if(coach > 0) {
                for (int i = 1; i <= coach; i++) {
                    statement2.executeUpdate();
                    for (int j = 0; j < 8 * cabin; j++) {
                        statement1.setInt(1, c + i);
                        statement1.executeUpdate();
                    }
                }
            }
            else {
                String sql3 = "insert into public.\"coach_table\"(coach_no) values(?)";
                PreparedStatement statement5 = connection.prepareStatement(sql3);
                for (int i = 0; i < 8 * cabin; i++) {
                    statement5.setInt(1,c);
                    statement5.executeUpdate();
                }
            }
            connection.close();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cabin details are added')");
            out.println("location='login.jsp';");
            out.println("</script>");
        }catch (Exception e){
            e.printStackTrace();
        }


    }
}
