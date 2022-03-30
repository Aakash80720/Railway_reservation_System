package com.service;

import com.model.Passenger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GetTickets {
    DatabaseConnection database = new DatabaseConnection();
    Connection connection;
    List<Passenger> tickets;
    List<String> pnr;
    public List<String> getPNR(String UserId) throws Exception{
        pnr = new ArrayList<>();
        try {
            connection = database.getConnection();
            String sql = "select distinct pnr_no from public.\"passengers\" where user_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,UserId);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                pnr.add(result.getString("pnr_no"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            connection.close();
        }
        return pnr;
    }
    public List<Passenger> getTicket(String pnr) throws Exception{
        tickets = new ArrayList<>();
        try {
            connection = database.getConnection();
            String sql = "select * from public.\"passengers\" where pnr_no = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,pnr);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                System.out.println(result.getString("name"));
                Passenger passenger = new Passenger(
                        result.getInt("serial_no"),
                        result.getString("name"),
                        result.getInt("age"),
                         result.getString("phone_number"),
                        result.getInt("seat_no"),
                        result.getString("berth_position"),
                        result.getString("berth_status"),
                        result.getString("pnr_no"),
                        result.getInt("coach_no")
                );
                tickets.add(passenger);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            connection.close();
        }
        return tickets;
    }
}
