/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.career.path.entities;

import java.sql.*;

public class Post {
    private int pid;
    private String title;
    private String requirement;
    private String dateline;
    private String responsibilities;
    private int vacancy;
    private int cid;
    private int sno;
    private Timestamp dateTime;
    private String OrgName;
    private String OrgAbout;
    private String OrgAddress;
    private String OrgLogo;

    public Post(int pid, String title, String requirement, String dateline, String responsibilities, int vacancy, int cid, int sno, Timestamp dateTime, String OrgName, String OrgAbout, String OrgAddress, String OrgLogo) {
        this.pid = pid;
        this.title = title;
        this.requirement = requirement;
        this.dateline = dateline;
        this.responsibilities = responsibilities;
        this.vacancy = vacancy;
        this.cid = cid;
        this.sno = sno;
        this.dateTime = dateTime;
        this.OrgName = OrgName;
        this.OrgAbout = OrgAbout;
        this.OrgAddress = OrgAddress;
        this.OrgLogo = OrgLogo;
    }

    public Post(int pid, String title, String requirement, String dateline, String responsibilities, int vacancy, String OrgName, String OrgAbout, String OrgAddress, String OrgLogo) {
        this.pid = pid;
        this.title = title;
        this.requirement = requirement;
        this.dateline = dateline;
        this.responsibilities = responsibilities;
        this.vacancy = vacancy;
    
        this.OrgName = OrgName;
        this.OrgAbout = OrgAbout;
        this.OrgAddress = OrgAddress;
        this.OrgLogo = OrgLogo;
    }
    

    public Post(String title, String requirement, String dateline, String responsibilities, int vacancy, int cid, int sno, String OrgName, String OrgAbout, String OrgAddress, String OrgLogo) {
        this.title = title;
        this.requirement = requirement;
        this.dateline = dateline;
        this.responsibilities = responsibilities;
        this.vacancy = vacancy;
        this.cid = cid;
        this.sno = sno;
        this.OrgName = OrgName;
        this.OrgAbout = OrgAbout;
        this.OrgAddress = OrgAddress;
        this.OrgLogo = OrgLogo;
    }

    public Post(String title, String requirement, String dateline, String responsibilities, int vacancy, int cid, int sno, Timestamp dateTime, String OrgName, String OrgAbout, String OrgAddress, String OrgLogo) {
        this.title = title;
        this.requirement = requirement;
        this.dateline = dateline;
        this.responsibilities = responsibilities;
        this.vacancy = vacancy;
        this.cid = cid;
        this.sno = sno;
        this.dateTime = dateTime;
        this.OrgName = OrgName;
        this.OrgAbout = OrgAbout;
        this.OrgAddress = OrgAddress;
        this.OrgLogo = OrgLogo;
    }

    public Post(int pid, String title, String requirement, String dateline, String responsibilities, int vacancy, String OrgName, String OrgAddress) {
        this.pid = pid;
        this.title = title;
        this.requirement = requirement;
        this.dateline = dateline;
        this.responsibilities = responsibilities;
        this.vacancy = vacancy;
        this.OrgName = OrgName;
        this.OrgAddress = OrgAddress;
    }

    
    public Post(String title, String requirement, String dateline, String responsibilities, int vacancy, int cid, int sno) {
        this.title = title;
        this.requirement = requirement;
        this.dateline = dateline;
        this.responsibilities = responsibilities;
        this.vacancy = vacancy;
        this.cid = cid;
        this.sno = sno;
    }
    
    
    public Post() {
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public String getDateline() {
        return dateline;
    }

    public void setDateline(String dateline) {
        this.dateline = dateline;
    }

    public String getResponsibilities() {
        return responsibilities;
    }

    public void setResponsibilities(String responsibilities) {
        this.responsibilities = responsibilities;
    }

    public int getVacancy() {
        return vacancy;
    }

    public void setVacancy(int vacancy) {
        this.vacancy = vacancy;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getOrgName() {
        return OrgName;
    }

    public void setOrgName(String OrgName) {
        this.OrgName = OrgName;
    }

    public String getOrgAbout() {
        return OrgAbout;
    }

    public void setOrgAbout(String OrgAbout) {
        this.OrgAbout = OrgAbout;
    }

    public String getOrgAddress() {
        return OrgAddress;
    }

    public void setOrgAddress(String OrgAddress) {
        this.OrgAddress = OrgAddress;
    }

    public String getOrgLogo() {
        return OrgLogo;
    }

    public void setOrgLogo(String OrgLogo) {
        this.OrgLogo = OrgLogo;
    }

   

    

    
    
    
    
    
    
}
