// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.web;

import com.xebia.wartelist.domain.TimeSlot;
import com.xebia.wartelist.service.HospitalService;
import com.xebia.wartelist.service.OperationService;
import com.xebia.wartelist.service.OperationTypeService;
import com.xebia.wartelist.service.TimeSlotService;
import com.xebia.wartelist.web.TimeSlotController;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect TimeSlotController_Roo_Controller {
    
    @Autowired
    TimeSlotService TimeSlotController.timeSlotService;
    
    @Autowired
    HospitalService TimeSlotController.hospitalService;
    
    @Autowired
    OperationService TimeSlotController.operationService;
    
    @Autowired
    OperationTypeService TimeSlotController.operationTypeService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TimeSlotController.create(@Valid TimeSlot timeSlot, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, timeSlot);
            return "timeslots/create";
        }
        uiModel.asMap().clear();
        timeSlotService.saveTimeSlot(timeSlot);
        return "redirect:/timeslots/" + encodeUrlPathSegment(timeSlot.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TimeSlotController.createForm(Model uiModel) {
        populateEditForm(uiModel, new TimeSlot());
        return "timeslots/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TimeSlotController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("timeslot", timeSlotService.findTimeSlot(id));
        uiModel.addAttribute("itemId", id);
        return "timeslots/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TimeSlotController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("timeslots", timeSlotService.findTimeSlotEntries(firstResult, sizeNo));
            float nrOfPages = (float) timeSlotService.countAllTimeSlots() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("timeslots", timeSlotService.findAllTimeSlots());
        }
        addDateTimeFormatPatterns(uiModel);
        return "timeslots/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TimeSlotController.update(@Valid TimeSlot timeSlot, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, timeSlot);
            return "timeslots/update";
        }
        uiModel.asMap().clear();
        timeSlotService.updateTimeSlot(timeSlot);
        return "redirect:/timeslots/" + encodeUrlPathSegment(timeSlot.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TimeSlotController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, timeSlotService.findTimeSlot(id));
        return "timeslots/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TimeSlotController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TimeSlot timeSlot = timeSlotService.findTimeSlot(id);
        timeSlotService.deleteTimeSlot(timeSlot);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/timeslots";
    }
    
    void TimeSlotController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("timeSlot_startd_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("timeSlot_endd_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void TimeSlotController.populateEditForm(Model uiModel, TimeSlot timeSlot) {
        uiModel.addAttribute("timeSlot", timeSlot);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("hospitals", hospitalService.findAllHospitals());
        uiModel.addAttribute("operations", operationService.findAllOperations());
        uiModel.addAttribute("operationtypes", operationTypeService.findAllOperationTypes());
    }
    
    String TimeSlotController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
