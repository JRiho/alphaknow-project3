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

    @RequestMapping(method = RequestMethod.GET)  // 변경된 부분
    public String doLogin(@RequestParam("userId") String userId,
                          @RequestParam("password") String password,
                          HttpSession session,
                          Model model) {
        Employee employee = loginMapper.authenticate(userId, password);
        if (employee != null) {
            session.setAttribute("userName", employee.getEmployeeName());
            session.setMaxInactiveInterval(60*30); // 30분 동안 세션 유지
            if ("관리".equals(employee.getDepartmentName())) {
                session.setAttribute("userType", "admin");
            } else {
                session.setAttribute("userType", "user");
            }
            return "redirect:/main";
        } else {
            model.addAttribute("errorMessage", "아이디와 비밀번호가 일치하지 않습니다.");
            return "login";
        }
    }
}
