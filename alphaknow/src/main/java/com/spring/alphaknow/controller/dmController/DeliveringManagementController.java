package com.spring.alphaknow.controller.dmController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DeliveringManagementController {
	@RequestMapping("deliveringManagement/list")
	public String deliveringManagementPage() {
		return "deliveringManagement";
	}
}
