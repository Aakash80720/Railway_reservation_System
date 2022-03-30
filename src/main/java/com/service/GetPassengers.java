package com.service;

import com.model.Passenger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GetPassengers {
    DatabaseConnection database = new DatabaseConnection();
    Connection connection;
    Passenger pas;
    List<Passenger> passenger;
    public List<Passenger> getPassengers() throws Exception{
        passenger = new ArrayList<>();
        try {
            connection = database.getConnection();
            String sql = "select * from public.\"passengers\"";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                System.out.println(result.getString("name"));
                pas = new Passenger(
                        result.getInt("serial_no"),
                        result.getString("name"),
                        result.getInt("age"),
                        result.getString("phone_number"),
                        result.getInt("seat_no"),
                        result.getString("berth_position"),
                        result.getString("berth_status"),
                        result.getString("pnr_no"),
                        result.getInt("coach_no"));
                passenger.add(pas);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            connection.close();
        }
        return passenger;
    }
}
