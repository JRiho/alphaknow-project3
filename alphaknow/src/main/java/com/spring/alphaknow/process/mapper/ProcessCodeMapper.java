package com.spring.alphaknow.process.mapper;

import com.spring.alphaknow.dto.processcodeDTO.ProcessCodeDTO;
import java.util.List;

public interface ProcessCodeMapper {
    List<ProcessCodeDTO> getAllProcessCodes();
    ProcessCodeDTO processCodeSelect(int sequenceNo);
    void addProcessCode(ProcessCodeDTO processCode);
    void deleteProcessCode(int sequenceNo); // 기존 단일 삭제 메서드
    void deleteProcessCodes(List<Integer> sequenceNos); // 새로운 다중 삭제 메서드
    void updateProcessCode(ProcessCodeDTO processCode);
}
