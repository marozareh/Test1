// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.xebia.wartelist.service;

import com.xebia.wartelist.domain.OperationType;
import com.xebia.wartelist.repository.OperationTypeRepository;
import com.xebia.wartelist.service.OperationTypeServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OperationTypeServiceImpl_Roo_Service {
    
    declare @type: OperationTypeServiceImpl: @Service;
    
    declare @type: OperationTypeServiceImpl: @Transactional;
    
    @Autowired
    OperationTypeRepository OperationTypeServiceImpl.operationTypeRepository;
    
    public long OperationTypeServiceImpl.countAllOperationTypes() {
        return operationTypeRepository.count();
    }
    
    public void OperationTypeServiceImpl.deleteOperationType(OperationType operationType) {
        operationTypeRepository.delete(operationType);
    }
    
    public OperationType OperationTypeServiceImpl.findOperationType(BigInteger id) {
        return operationTypeRepository.findOne(id);
    }
    
    public List<OperationType> OperationTypeServiceImpl.findAllOperationTypes() {
        return operationTypeRepository.findAll();
    }
    
    public List<OperationType> OperationTypeServiceImpl.findOperationTypeEntries(int firstResult, int maxResults) {
        return operationTypeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void OperationTypeServiceImpl.saveOperationType(OperationType operationType) {
        operationTypeRepository.save(operationType);
    }
    
    public OperationType OperationTypeServiceImpl.updateOperationType(OperationType operationType) {
        return operationTypeRepository.save(operationType);
    }
    
}
