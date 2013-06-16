// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.domain;

import com.xebia.wartelist.domain.TimeSlot;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect TimeSlot_Roo_Json {
    
    public String TimeSlot.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static TimeSlot TimeSlot.fromJsonToTimeSlot(String json) {
        return new JSONDeserializer<TimeSlot>().use(null, TimeSlot.class).deserialize(json);
    }
    
    public static String TimeSlot.toJsonArray(Collection<TimeSlot> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<TimeSlot> TimeSlot.fromJsonArrayToTimeSlots(String json) {
        return new JSONDeserializer<List<TimeSlot>>().use(null, ArrayList.class).use("values", TimeSlot.class).deserialize(json);
    }
    
}
