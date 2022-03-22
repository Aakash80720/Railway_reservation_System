package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CancelTickets {
    DatabaseConnection database = new DatabaseConnection();
    Connection connection;

    public boolean cancelTickets(int seatNo) throws Exception{
        try{
            connection = database.getConnection();
            String sql = "delete from public.\"passengers\" where \"serial_no\" = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1,seatNo);
            int n = statement.executeUpdate();
            if(n > 0) return true;
            else return false;

        }catch(Exception e){
            e.printStackTrace();
            return false;
        }finally {
            connection.close();
        }
    }
}
