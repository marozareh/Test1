// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.repository;

import com.xebia.wartelist.domain.Doctor;
import com.xebia.wartelist.repository.DoctorRepository;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect DoctorRepository_Roo_Mongo_Repository {
    
    declare parents: DoctorRepository extends PagingAndSortingRepository<Doctor, BigInteger>;
    
    declare @type: DoctorRepository: @Repository;
    
}
