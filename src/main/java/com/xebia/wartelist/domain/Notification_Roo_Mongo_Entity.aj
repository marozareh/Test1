// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.domain;

import com.xebia.wartelist.domain.Notification;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect Notification_Roo_Mongo_Entity {
    
    declare @type: Notification: @Persistent;
    
    @Id
    private BigInteger Notification.id;
    
    public BigInteger Notification.getId() {
        return this.id;
    }
    
    public void Notification.setId(BigInteger id) {
        this.id = id;
    }
    
}
