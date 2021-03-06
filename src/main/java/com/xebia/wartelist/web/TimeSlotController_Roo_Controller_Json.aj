// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.web;

import com.xebia.wartelist.domain.TimeSlot;
import com.xebia.wartelist.web.TimeSlotController;
import java.math.BigInteger;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect TimeSlotController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TimeSlotController.showJson(@PathVariable("id") BigInteger id) {
        TimeSlot timeSlot = timeSlotService.findTimeSlot(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (timeSlot == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(timeSlot.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TimeSlotController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<TimeSlot> result = timeSlotService.findAllTimeSlots();
        return new ResponseEntity<String>(TimeSlot.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> TimeSlotController.createFromJson(@RequestBody String json) {
        TimeSlot timeSlot = TimeSlot.fromJsonToTimeSlot(json);
        timeSlotService.saveTimeSlot(timeSlot);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> TimeSlotController.createFromJsonArray(@RequestBody String json) {
        for (TimeSlot timeSlot: TimeSlot.fromJsonArrayToTimeSlots(json)) {
            timeSlotService.saveTimeSlot(timeSlot);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> TimeSlotController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        TimeSlot timeSlot = TimeSlot.fromJsonToTimeSlot(json);
        if (timeSlotService.updateTimeSlot(timeSlot) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> TimeSlotController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (TimeSlot timeSlot: TimeSlot.fromJsonArrayToTimeSlots(json)) {
            if (timeSlotService.updateTimeSlot(timeSlot) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> TimeSlotController.deleteFromJson(@PathVariable("id") BigInteger id) {
        TimeSlot timeSlot = timeSlotService.findTimeSlot(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (timeSlot == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        timeSlotService.deleteTimeSlot(timeSlot);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
