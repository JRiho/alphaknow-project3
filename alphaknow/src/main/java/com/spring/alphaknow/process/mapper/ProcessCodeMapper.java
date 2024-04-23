package com.spring.alphaknow.process.mapper;

import com.spring.alphaknow.dto.processcodeDTO.ProcessCodeDTO;
import java.util.List;

public interface ProcessCodeMapper {
    List<ProcessCodeDTO> getAllProcessCodes();
    ProcessCodeDTO processCodeSelect(int sequenceNo);
    void addProcessCode(ProcessCodeDTO processCode);
    void deleteProcessCode(int sequenceNo);
    void updateProcessCode(ProcessCodeDTO processCode);
}
