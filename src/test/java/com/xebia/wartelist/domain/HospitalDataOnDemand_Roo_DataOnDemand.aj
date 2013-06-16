// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.domain;

import com.xebia.wartelist.domain.Hospital;
import com.xebia.wartelist.domain.HospitalDataOnDemand;
import com.xebia.wartelist.service.HospitalService;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect HospitalDataOnDemand_Roo_DataOnDemand {
    
    declare @type: HospitalDataOnDemand: @Component;
    
    private Random HospitalDataOnDemand.rnd = new SecureRandom();
    
    private List<Hospital> HospitalDataOnDemand.data;
    
    @Autowired
    HospitalService HospitalDataOnDemand.hospitalService;
    
    public Hospital HospitalDataOnDemand.getNewTransientHospital(int index) {
        Hospital obj = new Hospital();
        setLatitude(obj, index);
        setLongitude(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void HospitalDataOnDemand.setLatitude(Hospital obj, int index) {
        double latitude = new Integer(index).doubleValue();
        obj.setLatitude(latitude);
    }
    
    public void HospitalDataOnDemand.setLongitude(Hospital obj, int index) {
        double longitude = new Integer(index).doubleValue();
        obj.setLongitude(longitude);
    }
    
    public void HospitalDataOnDemand.setName(Hospital obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public Hospital HospitalDataOnDemand.getSpecificHospital(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Hospital obj = data.get(index);
        BigInteger id = obj.getId();
        return hospitalService.findHospital(id);
    }
    
    public Hospital HospitalDataOnDemand.getRandomHospital() {
        init();
        Hospital obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return hospitalService.findHospital(id);
    }
    
    public boolean HospitalDataOnDemand.modifyHospital(Hospital obj) {
        return false;
    }
    
    public void HospitalDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = hospitalService.findHospitalEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Hospital' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Hospital>();
        for (int i = 0; i < 10; i++) {
            Hospital obj = getNewTransientHospital(i);
            try {
                hospitalService.saveHospital(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            data.add(obj);
        }
    }
    
}
