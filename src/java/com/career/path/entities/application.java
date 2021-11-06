/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.career.path.entities;

import java.sql.Timestamp;

/**
 *
 * @author user
 */
public class application {
    private int applicantId;
    private int sno;
    private String username;
    private String email;
    private String cv;
    private Timestamp applydate;
    private int pid;
    private String orgName;
    private String ptitle;

    public application(int sno, String username, String email, String cv, Timestamp applydate, int pid, String orgName, String ptitle) {
        this.sno = sno;
        this.username = username;
        this.email = email;
        this.cv = cv;
        this.applydate = applydate;
        this.pid = pid;
        this.orgName = orgName;
        this.ptitle = ptitle;
    }

    public application(int applicantId, int sno, String username, String email, String cv, Timestamp applydate, int pid, String orgName, String ptitle) {
        this.applicantId = applicantId;
        this.sno = sno;
        this.username = username;
        this.email = email;
        this.cv = cv;
        this.applydate = applydate;
        this.pid = pid;
        this.orgName = orgName;
        this.ptitle = ptitle;
    }

    public application(int sno, String username, String email, String cv, int pid, String orgName, String ptitle) {
        this.sno = sno;
        this.username = username;
        this.email = email;
        this.cv = cv;
        this.pid = pid;
        this.orgName = orgName;
        this.ptitle = ptitle;
    }

    public application(int sno, int pid) {
        this.sno = sno;
        this.pid = pid;
    }
    
    

    public application() {
    }

    public int getApplicantId() {
        return applicantId;
    }

    public int getSno() {
        return sno;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getCv() {
        return cv;
    }

    public Timestamp getApplydate() {
        return applydate;
    }

    public int getPid() {
        return pid;
    }

    public String getOrgName() {
        return orgName;
    }

    public String getPtitle() {
        return ptitle;
    }
    

    public void setApplicantId(int applicantId) {
        this.applicantId = applicantId;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setCv(String cv) {
        this.cv = cv;
    }

    public void setApplydate(Timestamp applydate) {
        this.applydate = applydate;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }
    
    

}