package com.service;

import com.model.Berth;
import com.sun.jndi.ldap.Ber;
import javafx.beans.binding.When;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

public class Available {
    DatabaseConnection database = new DatabaseConnection();
    Connection connection;
    List<Berth> available;
    Berth berth;
    public List<Berth> getAvailable() throws Exception{
        available = new ArrayList<>();
        try {
            connection = database.getConnection();
            String sql = "select * from public.\"coach_table\" where berth_status = TRUE order by coach_no,seat_no asc ";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                berth = new Berth(
                        result.getInt("coach_no"),
                        result.getInt("seat_no"),
                        result.getBoolean("berth_status"),
                        result.getString("Status"),
                        result.getString("Berth_position")
                );
                available.add(berth);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            connection.close();
        }
        return available;
    }
}
