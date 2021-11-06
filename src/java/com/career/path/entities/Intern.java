/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.career.path.entities;
import java.sql.*;

/**
 *
 * @author Dikshya
 */
public class Intern {
    private int sno;
    private String name;
    private String email;
    private String password;
    private String dateTime;
   

    public Intern(int sno, String name, String email, String password, String dateTime) {
        this.sno = sno;
        this.name = name;
        this.email = email;
        this.password = password;
        this.dateTime = dateTime;
       
    }
   
    
   
    

    public Intern(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
       
    }



    public Intern() {
    }
    //getter and setter

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }
    

   
    
}
