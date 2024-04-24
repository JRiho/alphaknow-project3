package com.spring.alphaknow.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/accessdenied")
public class AccessDeniedController {

	@RequestMapping(method = RequestMethod.GET)
    public String showaccessdeniedPage(Model model) {
        return "accessdenied"; 
    }
	
}
