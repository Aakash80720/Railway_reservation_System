package com.service;

public class FindBerth {
    public String findBerth(int seatNumber){
        String temp = "SU,LB,MB,UP,LB,MB,UP,SL";
        String[] position  = temp.split(",");
        System.out.println(position[seatNumber%8]);
        return position[seatNumber%8];
    }

}
