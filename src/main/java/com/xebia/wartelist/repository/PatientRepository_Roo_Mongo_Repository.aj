// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.repository;

import com.xebia.wartelist.domain.Patient;
import com.xebia.wartelist.repository.PatientRepository;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect PatientRepository_Roo_Mongo_Repository {
    
    declare parents: PatientRepository extends PagingAndSortingRepository<Patient, BigInteger>;
    
    declare @type: PatientRepository: @Repository;
    
}
