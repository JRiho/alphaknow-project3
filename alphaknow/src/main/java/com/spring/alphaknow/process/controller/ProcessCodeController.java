package com.spring.alphaknow.process.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

    @RequestMapping(params = "action=add", method = RequestMethod.POST)
    public String addProcessCode(@ModelAttribute ProcessCodeDTO processCode, RedirectAttributes redirectAttributes) {
        processCodeService.addProcessCode(processCode);
        redirectAttributes.addFlashAttribute("message", "프로세스 코드가 성공적으로 추가되었습니다!");
        return "redirect:/processcode";
    }

    @RequestMapping(params = "action=delete", method = RequestMethod.POST)
    public String deleteProcessCode(@RequestParam("id") int sequenceNo, RedirectAttributes redirectAttributes) {
        processCodeService.deleteProcessCode(sequenceNo);
        redirectAttributes.addFlashAttribute("message", "프로세스 코드가 성공적으로 삭제되었습니다!");
        return "redirect:/processcode";
    }

    @RequestMapping(params = "action=update", method = RequestMethod.POST)
    public String updateProcessCode(@ModelAttribute ProcessCodeDTO processCode, RedirectAttributes redirectAttributes) {
        processCodeService.updateProcessCode(processCode);
        redirectAttributes.addFlashAttribute("message", "프로세스 코드 정보가 업데이트되었습니다!");
        return "redirect:/processcode";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public ResponseEntity<?> deleteProcessCodeAjax(@PathVariable("id") int sequenceNo) {
        try {
            processCodeService.deleteProcessCode(sequenceNo);
            return ResponseEntity.ok().body("프로세스 코드가 성공적으로 삭제되었습니다!");
        } catch (DataAccessException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 오류: " + e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("삭제 실패: " + e.getMessage());
        }
    }
}
