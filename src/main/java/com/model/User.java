package com.model;

import java.util.Random;

public class User {
    private String userName;
    private int age;
    private String  pnrNumber;
    private String password;
    private String  phoneNumber;

    public User(String userName, int age, String password, String phoneNumber) {
        this.userName = userName;
        this.age = age;
        this.pnrNumber = getPnr();
        this.password = password;
        this.phoneNumber = phoneNumber;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String  getPnrNumber() {
        return pnrNumber;
    }

    public void setPnrNumber(String pnrNumber) {
        this.pnrNumber = pnrNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String  getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public static String getPnr(){
        Random random = new Random();
        int number = random.nextInt(9999999);
        return String.format("%07d", number);
    }

}
