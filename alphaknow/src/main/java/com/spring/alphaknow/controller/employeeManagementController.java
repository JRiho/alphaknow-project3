package com.spring.alphaknow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class employeeManagementController {
	@RequestMapping(value = "/employee", method = RequestMethod.GET)
	public String mainPage() {
		return "employeeManagement";
	}
}
