package com.spring.alphaknow.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.alphaknow.dto.boardDTO.BoardDTO;

@Controller
public class groupController {
	 @RequestMapping(value="/myprofile/main", method=RequestMethod.GET)
	 public String myprofile() {
		 return "profilePopup";
	 }
	 
}
