package com.spring.alphaknow.process.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.alphaknow.dto.processcodeDTO.ProcessCodeDTO;
import com.spring.alphaknow.process.service.ProcessCodeService;

@Controller
@RequestMapping("/processcode")
public class ProcessCodeController {

    @Autowired
    private ProcessCodeService processCodeService;  // 서비스 자동 주입

    @RequestMapping(method = RequestMethod.GET)
    public String listProcessCodes(Model model) {
        List<ProcessCodeDTO> processCodeList = processCodeService.getAllProcessCodes();
        model.addAttribute("processCodeList", processCodeList);
        return "processCode";  // 포워드할 JSP 페이지
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ResponseEntity<String> addProcessCode(@RequestBody ProcessCodeDTO processCode) {
        try {
            processCodeService.addProcessCode(processCode);
            return ResponseEntity.ok("프로세스 코드가 성공적으로 추가되었습니다!");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("저장 실패: " + e.getMessage());
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ResponseEntity<String> updateProcessCode(@RequestBody ProcessCodeDTO processCode) {
        try {
        	System.out.println(processCode);
            processCodeService.updateProcessCode(processCode);
            return ResponseEntity.ok("프로세스 코드 정보가 업데이트되었습니다!");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("업데이트 실패: " + e.getMessage());
        }
    }
    
    @RequestMapping(value= "/deleteProcessCode", method = RequestMethod.POST)
    public ResponseEntity<?> deleteProcessCodes(@RequestBody List<Integer> sequenceNos) {
        try {
            processCodeService.deleteProcessCodes(sequenceNos);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
    
    @RequestMapping(value = "/detail", method = RequestMethod.POST)
    @ResponseBody
    public ProcessCodeDTO getProcessCodeDetail(@RequestParam("sequenceNo") int sequenceNo) {
        return processCodeService.processCodeSelect(sequenceNo);
    }
}
