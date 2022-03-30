package com.model;

public class Berth {
    private int seatNo;
    private boolean berthStatus;
    private String Status;
    private String berthPostion;
    private int coachNo;

    public int getCoachNo() {
        return coachNo;
    }

    public void setCoachNo(int coachNo) {
        this.coachNo = coachNo;
    }

    public Berth(int coachNo , int seatNo, boolean berthStatus, String status, String berthPostion) {
        this.coachNo = coachNo;
        this.seatNo = seatNo;
        this.berthStatus = berthStatus;
        Status = status;
        this.berthPostion = berthPostion;
    }

    public int getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(int seatNo) {
        this.seatNo = seatNo;
    }

    public boolean isBerthStatus() {
        return berthStatus;
    }

    public void setBerthStatus(boolean berthStatus) {
        this.berthStatus = berthStatus;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public String getBerthPostion() {
        return berthPostion;
    }

    public void setBerthPostion(String berthPostion) {
        this.berthPostion = berthPostion;
    }
}
