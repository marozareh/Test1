// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.domain;

import com.xebia.wartelist.domain.Hospital;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect Hospital_Roo_Mongo_Entity {
    
    declare @type: Hospital: @Persistent;
    
    @Id
    private BigInteger Hospital.id;
    
    public BigInteger Hospital.getId() {
        return this.id;
    }
    
    public void Hospital.setId(BigInteger id) {
        this.id = id;
    }
    
}
