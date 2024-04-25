package com.spring.alphaknow.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.alphaknow.login.model.Employee;
import com.spring.alphaknow.login.mapper.LoginMapper;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired

    private LoginMapper loginMapper;

    @RequestMapping(method = RequestMethod.GET)
    public String loginPage() {
        return "login";  // 로그인 페이지의 뷰 이름 반환
    }
    
    @RequestMapping(method = RequestMethod.POST)  // 변경된 부분
    public String doLogin(@RequestParam("userId") String userId,
                          @RequestParam("password") String password,
                          HttpSession session,
                          Model model) {
    	System.out.println("로그인 완료!!");
    	
        Employee employee = loginMapper.authenticate(userId, password);
        if (employee != null) {
        	session.setAttribute("userName", employee.getEmployee_name());
            session.setAttribute("department", employee.getDepartment_name());
            session.setAttribute("jobgrade", employee.getJob_grade());
            session.setAttribute("phone", employee.getEmployee_phone());
            session.setMaxInactiveInterval(60*30); // 30분 동안 세션 유지
            
            if ("관리자".equals(employee.getDepartmentName())) {
                session.setAttribute("userType", "admin");
            } else {
                session.setAttribute("userType", "user");
            }
            return "redirect:/mainPage";
        } else {
            model.addAttribute("errorMessage", "아이디와 비밀번호가 일치하지 않습니다.");
            return "login";
        } 
    }
}
