package com.spring.alphaknow.controller.imController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InventoryManagementController {
	@RequestMapping("inventoryManagement/list")
	public String inventoryManagementPage() {
		return "inventoryManagement";
	}
}
