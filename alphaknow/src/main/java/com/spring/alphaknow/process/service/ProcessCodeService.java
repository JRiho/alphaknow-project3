package com.spring.alphaknow.process.service;

import com.spring.alphaknow.dto.processcodeDTO.ProcessCodeDTO;
import com.spring.alphaknow.process.mapper.ProcessCodeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

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

    public void addProcessCode(ProcessCodeDTO processCode) {
        processCodeMapper.insertProcessCode(processCode);
    }

    public void updateProcessCode(ProcessCodeDTO processCode) {
        processCodeMapper.updateProcessCode(processCode);
    }

    public void deleteProcessCode(int sequenceNo) {
        processCodeMapper.deleteProcessCode(sequenceNo);
    }
}
