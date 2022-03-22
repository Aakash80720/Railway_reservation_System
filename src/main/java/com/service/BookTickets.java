package com.service;

import com.model.Booking;
import com.model.Passenger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BookTickets {
    DatabaseConnection database = new DatabaseConnection();
    Connection connection;
    PreparedStatement statement;
    FindBerth findBerth = new FindBerth();
    Passenger passenger;
    public boolean bookTickets(Booking booking,String pnrNumber,String userId) throws Exception{

        if(booking.getBerthPreference().equals("any")){
            try {
                return bookAny(booking, pnrNumber, userId);
            }
            catch (Exception e){
                e.printStackTrace();
                return false;
            }
            finally {
                connection.close();
            }
        }
        else {
            return bookPreference(booking, pnrNumber, userId);
        }
    }
    public boolean bookAny(Booking booking,String pnrNumber,String userId) throws Exception{
        try {
            connection = database.getConnection();
            String sql = "select seat_no from public.\"coach_table\" where berth_status = TRUE order by \"Max_count\" asc limit 1";
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            int seat_no;
            String status;
            if(result.next()){
                seat_no = result.getInt("seat_no");
                System.out.println(seat_no);
                String berth =  findBerth.findBerth(seat_no);
                if(!berth.equals("RAC")) status = "CNF";
                else status = "RAC";
                passenger = new Passenger(
                        1,booking.getUserName(), booking.getAge(),
                        ""+booking.getPhoneNumber(),seat_no,berth,status,pnrNumber
                );
                setTicket(passenger,userId);
                ToggleStatus(seat_no);
                return true;
            }
            else {
                return false;
            }

        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }
        finally {
            connection.close();
        }
    }
    public boolean bookPreference(Booking booking,String pnrNumber, String userId)throws Exception{
        try {
            connection = database.getConnection();
            String sql = "select * from public.\"coach_table\" where berth_status = TRUE and \"Berth_position\" = ? order by \"Max_count\" asc limit 1";
            PreparedStatement statement = connection.prepareStatement(sql);
            System.out.println(booking.getBerthPreference());
            statement.setString(1,booking.getBerthPreference());
            ResultSet result = statement.executeQuery();
            int seat_no;
            String status,berthPosition;
            if(result.next()){
                System.out.println(result.getInt("seat_no"));
                seat_no = result.getInt("seat_no");
                status = result.getString("Status");
                berthPosition = result.getString("Berth_position");
                passenger = new Passenger(
                        1,booking.getUserName(), booking.getAge(),
                        booking.getPhoneNumber(),seat_no,berthPosition,status,pnrNumber
                );
                setTicket(passenger,userId);
                ToggleStatus(seat_no);
                return true;
            }
            else{
                return bookAny(booking, pnrNumber, userId);
            }


        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        finally {
            connection.close();
        }
    }
    public void setTicket(Passenger passenger,String userId) throws Exception{
        try{
            connection = database.getConnection();
            String sql = "INSERT into public.\"passengers\"(name,age,phone_number,seat_no,berth_position,berth_status,pnr_no,user_id)" +
                    "values(?,?,?,?,?,?,?,?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1,passenger.getName());
            statement.setInt(2,passenger.getAge());
            statement.setString(3,passenger.getPhoneNumber());
            statement.setInt(4,passenger.getSeatNumber());
            statement.setString(5, passenger.getBerthPosition());
            statement.setString(6, passenger.getBerth_status());
            statement.setString(7, passenger.getPnr_no());
            statement.setString(8,userId);
            int row = statement.executeUpdate();
            if(row > 0){
                System.out.println("passenger Inserted");
            }
            else{
                System.out.println("not inserted");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            connection.close();
        }
    }
    public void ToggleStatus(int seatNo) throws Exception {
        try{
            connection = database.getConnection();
            String sql1 = "update public.\"coach_table\" set \"Max_count\" = \"Max_count\"-1 where \"Max_count\" >= 1 and seat_no  = ?;";
            String sql2 = "update public.\"coach_table\" set berth_status = false where seat_no = ? and \"Max_count\" = 0;";
            connection.setAutoCommit(false);
            PreparedStatement Q1 = connection.prepareStatement(sql1);
            PreparedStatement Q2 = connection.prepareStatement(sql2);
            Q1.setInt(1,seatNo);
            Q1.executeUpdate();
            Q2.setInt(1,seatNo);
            Q2.executeUpdate();
            connection.commit();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            connection.close();
        }
    }
}
