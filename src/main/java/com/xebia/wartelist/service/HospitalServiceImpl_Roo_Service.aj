// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.service;

import com.xebia.wartelist.domain.Hospital;
import com.xebia.wartelist.repository.HospitalRepository;
import com.xebia.wartelist.service.HospitalServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect HospitalServiceImpl_Roo_Service {
    
    declare @type: HospitalServiceImpl: @Service;
    
    declare @type: HospitalServiceImpl: @Transactional;
    
    @Autowired
    HospitalRepository HospitalServiceImpl.hospitalRepository;
    
    public long HospitalServiceImpl.countAllHospitals() {
        return hospitalRepository.count();
    }
    
    public void HospitalServiceImpl.deleteHospital(Hospital hospital) {
        hospitalRepository.delete(hospital);
    }
    
    public Hospital HospitalServiceImpl.findHospital(BigInteger id) {
        return hospitalRepository.findOne(id);
    }
    
    public List<Hospital> HospitalServiceImpl.findAllHospitals() {
        return hospitalRepository.findAll();
    }
    
    public List<Hospital> HospitalServiceImpl.findHospitalEntries(int firstResult, int maxResults) {
        return hospitalRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void HospitalServiceImpl.saveHospital(Hospital hospital) {
        hospitalRepository.save(hospital);
    }
    
    public Hospital HospitalServiceImpl.updateHospital(Hospital hospital) {
        return hospitalRepository.save(hospital);
    }
    
}
