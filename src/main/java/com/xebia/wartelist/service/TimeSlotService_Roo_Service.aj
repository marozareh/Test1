// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.service;

import com.xebia.wartelist.domain.TimeSlot;
import com.xebia.wartelist.service.TimeSlotService;
import java.math.BigInteger;
import java.util.List;

privileged aspect TimeSlotService_Roo_Service {
    
    public abstract long TimeSlotService.countAllTimeSlots();    
    public abstract void TimeSlotService.deleteTimeSlot(TimeSlot timeSlot);    
    public abstract TimeSlot TimeSlotService.findTimeSlot(BigInteger id);    
    public abstract List<TimeSlot> TimeSlotService.findAllTimeSlots();    
    public abstract List<TimeSlot> TimeSlotService.findTimeSlotEntries(int firstResult, int maxResults);    
    public abstract void TimeSlotService.saveTimeSlot(TimeSlot timeSlot);    
    public abstract TimeSlot TimeSlotService.updateTimeSlot(TimeSlot timeSlot);    
}
