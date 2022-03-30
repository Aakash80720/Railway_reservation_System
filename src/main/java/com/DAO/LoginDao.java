package com.DAO;

import com.model.Admin;
import com.model.User;
import com.service.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
    DatabaseConnection database = new DatabaseConnection();
    Connection connection;
    public static User user;
    public static Admin admin;
    public String loginDao(String username, String phoneNumber,String password){
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
                if(!result.getBoolean("isadmin")) {
                    user = new User(
                            result.getString("user_name"),
                            result.getInt("age"),
                            result.getString("password"),
                            result.getString("phone_number")
                    );
                    user.setPnrNumber(result.getString("PNR_NO"));
                    return "User";
                }
                else {
                    admin = new Admin(
                            result.getString("user_name"),
                            result.getString("password"),
                            result.getString("phone_number"),
                            result.getString("PNR_NO")
                    );
                    return "Admin";
                }

            }
            else {
                return "false";
            }
        }
        catch (Exception e){
            e.printStackTrace();
            return "false";
        }
    }
    public boolean adminLogin(String username,String password,String phoneNumber,String code){
        try {
            String sql = "select * from public.\"admin\" " +
                    "where name = ? and admin_phNo. = ? and password = ? and \"Admin_code\" = ?;";
            connection = database.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,username);
            statement.setString(2,phoneNumber);
            statement.setString(3,password);
            statement.setString(4,code);
            ResultSet result = statement.executeQuery();
            if(result.next()){
                admin = new Admin(
                        result.getString("name"),
                        result.getString("password"),
                        result.getString("admin_phNo."),
                        result.getString("Admin_code")
                );
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
