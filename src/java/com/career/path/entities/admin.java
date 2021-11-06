/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.career.path.entities;

/**
 *
 * @author user
 */
public class admin {
    private int Adminid;
    private String username;
    private String email;
    private String password;
    

    public admin(int Adminid, String email, String password, String username) {
        this.Adminid = Adminid;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public admin(String email, String password, String username) {
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public admin(int Adminid, String password) {
        this.Adminid = Adminid;
        this.password = password;
    }
    

    public admin() {
    }

    
    public int getAdminid() {
        return Adminid;
    }

    public void setAdminid(int Adminid) {
        this.Adminid = Adminid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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
    
    
    
}
