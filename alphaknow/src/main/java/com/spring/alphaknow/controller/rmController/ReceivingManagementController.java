package com.spring.alphaknow.controller.rmController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReceivingManagementController {

	@RequestMapping("/receivingManagement/list")
	public String receivingManagementPage() {
		return "receivingManagement";
	}
	
}
