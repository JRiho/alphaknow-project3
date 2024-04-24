package com.spring.alphaknow.process.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.alphaknow.dto.processcodeDTO.ProcessCodeDTO;
import com.spring.alphaknow.process.mapper.ProcessCodeMapper;

@Service
public class ProcessCodeService {
    private final ProcessCodeMapper processCodeMapper;

    @Autowired
    public ProcessCodeService(ProcessCodeMapper processCodeMapper) {
        this.processCodeMapper = processCodeMapper;
    }

    public List<ProcessCodeDTO> getAllProcessCodes() {
        return processCodeMapper.getAllProcessCodes();
    }

    public ProcessCodeDTO processCodeSelect(int sequenceNo) {
        return processCodeMapper.processCodeSelect(sequenceNo);
    }

    public void addProcessCode(ProcessCodeDTO processCode) {
        processCodeMapper.addProcessCode(processCode);
    }

    public void updateProcessCode(ProcessCodeDTO processCode) {
        processCodeMapper.updateProcessCode(processCode);
    }

    public void deleteProcessCode(int sequenceNo) {
        processCodeMapper.deleteProcessCode(sequenceNo);
    }
    
    @Transactional
    public void deleteProcessCodes(List<Integer> sequenceNos) {
        processCodeMapper.deleteProcessCodes(sequenceNos);
    }
}
