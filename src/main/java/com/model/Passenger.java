package com.model;

public class Passenger {
    private int serialNumber;
    private String name;
    private int age;
    private String phoneNumber;
    private int seatNumber;
    private String berthPosition;
    private String berth_status;
    private String pnr_no;
    private int coach_no;

    public int getCoach_no() {
        return coach_no;
    }

    public void setCoach_no(int coach_no) {
        this.coach_no = coach_no;
    }

    public Passenger(int serialNumber, String name, int age, String phoneNumber, int seatNumber, String berthPosition, String berth_status, String pnr_no, int coach_no) {
        this.serialNumber = serialNumber;
        this.name = name;
        this.age = age;
        this.phoneNumber = phoneNumber;
        this.seatNumber = seatNumber;
        this.berthPosition = berthPosition;
        this.berth_status = berth_status;
        this.pnr_no = pnr_no;
        this.coach_no = coach_no;
    }

    public int getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(int serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public String getBerthPosition() {
        return berthPosition;
    }

    public void setBerthPosition(String berthPosition) {
        this.berthPosition = berthPosition;
    }

    public String getBerth_status() {
        return berth_status;
    }

    public void setBerth_status(String berth_status) {
        this.berth_status = berth_status;
    }

    public String getPnr_no() {
        return pnr_no;
    }

    public void setPnr_no(String pnr_no) {
        this.pnr_no = pnr_no;
    }
}
