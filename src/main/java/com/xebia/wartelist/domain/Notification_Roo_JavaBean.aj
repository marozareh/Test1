// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.domain;

import com.xebia.wartelist.domain.Notification;
import java.util.Date;

privileged aspect Notification_Roo_JavaBean {
    
    public String Notification.getTitle() {
        return this.title;
    }
    
    public void Notification.setTitle(String title) {
        this.title = title;
    }
    
    public String Notification.getMessage() {
        return this.message;
    }
    
    public void Notification.setMessage(String message) {
        this.message = message;
    }
    
    public Date Notification.getCreatedAt() {
        return this.createdAt;
    }
    
    public void Notification.setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
    public Date Notification.getUpdatedAt() {
        return this.updatedAt;
    }
    
    public void Notification.setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    public Boolean Notification.getDisplayed() {
        return this.displayed;
    }
    
    public void Notification.setDisplayed(Boolean displayed) {
        this.displayed = displayed;
    }
    
}
