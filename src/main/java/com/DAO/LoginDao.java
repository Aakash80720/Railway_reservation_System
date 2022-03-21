package com.DAO;

import com.model.User;
import com.service.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
    DatabaseConnection database = new DatabaseConnection();
    Connection connection;
    public static User user;
    public boolean loginDao(String username, String phoneNumber,String password){
        try {
            String sql = "select * from public.\"user\" " +
                    "where user_name = ? and phone_number = ? and password = ?;";
            connection = database.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,username);
            statement.setString(2,phoneNumber);
            statement.setString(3,password);
            ResultSet result = statement.executeQuery();
            if(result.next()){
                user = new User(
                        result.getString("user_name"),
                        result.getInt("age"),
                        result.getString("password"),
                        result.getString("phone_number")
                );
                user.setPnrNumber(result.getString("PNR_NO"));
                return  true;
            }
            else {
                return false;
            }
        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}