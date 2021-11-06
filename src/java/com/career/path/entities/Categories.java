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
public class Categories {
    private int cid;
    private String title;
    private String description;

    public Categories(int cid, String title, String description) {
        this.cid = cid;
        this.title = title;
        this.description = description;
    }

    public Categories(String title, String description) {
        this.title = title;
        this.description = description;
    }

    public Categories() {
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}

   
