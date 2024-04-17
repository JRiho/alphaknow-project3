package com.spring.alphaknow.controller.ppmController;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.alphaknow.service.ppmService.ProductionPlanManagementService;

@Controller
public class ProductionPlanManagementController {
	
	@Autowired
	ProductionPlanManagementService productionPlanManagementService;
	
	@RequestMapping("/ppm/select")
	public String ppmPage(Model model) {
		
		List list = productionPlanManagementService.ppmList();

		model.addAttribute("list", list);

		return "ppm";

	}
}
