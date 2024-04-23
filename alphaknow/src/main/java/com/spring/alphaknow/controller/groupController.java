package com.spring.alphaknow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class groupController {
	 @RequestMapping(value="/myprofile/calendar", method=RequestMethod.GET)
	 public String myprofile1() {
		 return "profilePopup1";
	 }
	 
	 @RequestMapping(value="/myprofile/attendance", method=RequestMethod.GET)
	 public String myprofile2() {
		 return "profilePopup2";
	 }
	 
	 @RequestMapping(value="/myprofile/EDSM", method=RequestMethod.GET)
	 public String myprofile3() {
		 return "profilePopup3";
	 }

	 @RequestMapping(value="/myprofile/docBox", method=RequestMethod.GET)
	 public String myprofile4() {
		 return "profilePopup4";
	 }
	 
}
