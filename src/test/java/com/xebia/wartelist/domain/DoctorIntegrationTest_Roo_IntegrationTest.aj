// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.domain;

import com.xebia.wartelist.domain.DoctorDataOnDemand;
import com.xebia.wartelist.domain.DoctorIntegrationTest;
import com.xebia.wartelist.service.DoctorService;
import java.math.BigInteger;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

privileged aspect DoctorIntegrationTest_Roo_IntegrationTest {
    
    declare @type: DoctorIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: DoctorIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    @Autowired
    DoctorDataOnDemand DoctorIntegrationTest.dod;
    
    @Autowired
    DoctorService DoctorIntegrationTest.doctorService;
    
    @Test
    public void DoctorIntegrationTest.testCountAllDoctors() {
        Assert.assertNotNull("Data on demand for 'Doctor' failed to initialize correctly", dod.getRandomDoctor());
        long count = doctorService.countAllDoctors();
        Assert.assertTrue("Counter for 'Doctor' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void DoctorIntegrationTest.testFindDoctor() {
        Doctor obj = dod.getRandomDoctor();
        Assert.assertNotNull("Data on demand for 'Doctor' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Doctor' failed to provide an identifier", id);
        obj = doctorService.findDoctor(id);
        Assert.assertNotNull("Find method for 'Doctor' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Doctor' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void DoctorIntegrationTest.testFindAllDoctors() {
        Assert.assertNotNull("Data on demand for 'Doctor' failed to initialize correctly", dod.getRandomDoctor());
        long count = doctorService.countAllDoctors();
        Assert.assertTrue("Too expensive to perform a find all test for 'Doctor', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Doctor> result = doctorService.findAllDoctors();
        Assert.assertNotNull("Find all method for 'Doctor' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Doctor' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void DoctorIntegrationTest.testFindDoctorEntries() {
        Assert.assertNotNull("Data on demand for 'Doctor' failed to initialize correctly", dod.getRandomDoctor());
        long count = doctorService.countAllDoctors();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Doctor> result = doctorService.findDoctorEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Doctor' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Doctor' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void DoctorIntegrationTest.testSaveDoctor() {
        Assert.assertNotNull("Data on demand for 'Doctor' failed to initialize correctly", dod.getRandomDoctor());
        Doctor obj = dod.getNewTransientDoctor(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Doctor' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Doctor' identifier to be null", obj.getId());
        doctorService.saveDoctor(obj);
        Assert.assertNotNull("Expected 'Doctor' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void DoctorIntegrationTest.testDeleteDoctor() {
        Doctor obj = dod.getRandomDoctor();
        Assert.assertNotNull("Data on demand for 'Doctor' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Doctor' failed to provide an identifier", id);
        obj = doctorService.findDoctor(id);
        doctorService.deleteDoctor(obj);
        Assert.assertNull("Failed to remove 'Doctor' with identifier '" + id + "'", doctorService.findDoctor(id));
    }
    
}
