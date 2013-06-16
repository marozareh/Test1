// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.service;

import com.xebia.wartelist.domain.Patient;
import com.xebia.wartelist.repository.PatientRepository;
import com.xebia.wartelist.service.PatientServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PatientServiceImpl_Roo_Service {
    
    declare @type: PatientServiceImpl: @Service;
    
    declare @type: PatientServiceImpl: @Transactional;
    
    @Autowired
    PatientRepository PatientServiceImpl.patientRepository;
    
    public long PatientServiceImpl.countAllPatients() {
        return patientRepository.count();
    }
    
    public void PatientServiceImpl.deletePatient(Patient patient) {
        patientRepository.delete(patient);
    }
    
    public Patient PatientServiceImpl.findPatient(BigInteger id) {
        return patientRepository.findOne(id);
    }
    
    public List<Patient> PatientServiceImpl.findAllPatients() {
        return patientRepository.findAll();
    }
    
    public List<Patient> PatientServiceImpl.findPatientEntries(int firstResult, int maxResults) {
        return patientRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void PatientServiceImpl.savePatient(Patient patient) {
        patientRepository.save(patient);
    }
    
    public Patient PatientServiceImpl.updatePatient(Patient patient) {
        return patientRepository.save(patient);
    }
    
}
