package com.model;

public class Admin {
    private String adminName;
    private String password;
    private String phoneNumber;
    private String code;

    public Admin(String adminName, String password, String phoneNumber, String code) {
        this.adminName = adminName;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.code = code;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
