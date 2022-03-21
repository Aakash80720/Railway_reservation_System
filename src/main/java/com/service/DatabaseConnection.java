package com.service;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    private String jdbcUrl = "jdbc:postgresql://localhost:5432/Railway_Reservation";
    private String username = "postgres";
    private String password = "aakash26";
    public Connection getConnection() throws  Exception{
        Class.forName("org.postgresql.Driver");
        return  DriverManager.getConnection(jdbcUrl,username,password);
    }
}
