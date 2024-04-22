package com.spring.alphaknow.controller.rmController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjax2DTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjaxDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementDTO;
import com.spring.alphaknow.service.rmService.ReceivingManagementService;

@Controller
public class ReceivingManagementController {
	@Autowired
	ReceivingManagementService receivingManagementService;

	@RequestMapping("/receivingManagement/list")
	public String receivingManagementPage(Model model) {
		List<ReceivingManagementDTO> list = receivingManagementService.rmList();
		
		model.addAttribute("list", list);
		System.out.println("list : " + list);
		
		return "receivingManagement";
	}
	
	// Ajax 입고신청 클릭이벤트
	@RequestMapping("/receivingManagement/ajax.doSelect")
	@ResponseBody
	public List<ReceivingManagementAjaxDTO> receivingManagementAjaxSelect() {
		return receivingManagementService.rmAjaxList();
	}
	
	// Ajax 입고신청서 작성 클릭이벤트
	@RequestMapping("/receivingManagement/ajax.doSelect2")
	@ResponseBody
	public List<ReceivingManagementAjax2DTO> receivingManagementAjaxSelect2(
			@RequestParam("company_name") String company_name
			) {
		return receivingManagementService.rmAjaxList2(company_name);
	}
	
}
