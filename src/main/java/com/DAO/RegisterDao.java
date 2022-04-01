package com.DAO;

import com.model.User;
import com.service.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class RegisterDao {
    DatabaseConnection database = new DatabaseConnection();
    Connection connection;
    public boolean registerDao(User user) throws Exception{
        System.out.println("PNR number :"+user.getPnrNumber());
        try {
            String sql = "insert into public.\"user\"(\"pnr_no\",user_name,password,age,phone_number) values(?,?,crypt(?,gen_salt('bf')),?,?);";
            connection = database.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,user.getPnrNumber());
            statement.setString(2,user.getUserName());
            statement.setString(3,user.getPassword());
            statement.setInt(4,user.getAge());
            statement.setString(5,user.getPhoneNumber());
            int result = statement.executeUpdate();
            if(result > 0){
                return true;
            }
            else {
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            connection.close();
        }
    }

}
