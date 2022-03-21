package com.service;

import com.model.Passenger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SearchRequest {
    DatabaseConnection database = new DatabaseConnection();
    Connection connection;
    Passenger passenger;
    List<Passenger> passengers;
    public List<Passenger> getSearch(String pnrNumber) throws Exception{
        passengers = new ArrayList<>();
        try {
            connection = database.getConnection();
            String sql = "select * from public.\"passengers\" where pnr_no = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,pnrNumber);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                passenger = new Passenger(
                        result.getInt("serial_no"),
                        result.getString("name"),
                        result.getInt("age"),
                        ""+result.getInt("phone_number"),
                        result.getInt("seat_no"),
                        result.getString("berth_position"),
                        result.getString("berth_status"),
                        result.getString("pnr_no")
                );
                passengers.add(passenger);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            connection.close();
        }
        return  passengers;
    }
}
