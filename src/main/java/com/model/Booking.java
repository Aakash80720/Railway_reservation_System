package com.model;

public class Booking {
    private int age;
    private String userName;
    private String phoneNumber;
    private String berthPreference;

    public Booking(int age, String userName, String phoneNumber, String berthPreference) {
        this.age = age;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.berthPreference = berthPreference;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getBerthPreference() {
        return berthPreference;
    }

    public void setBerthPreference(String berthPreference) {
        this.berthPreference = berthPreference;
    }
}
