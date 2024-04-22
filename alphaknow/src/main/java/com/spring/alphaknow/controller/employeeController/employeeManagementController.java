package com.spring.alphaknow.controller.employeeController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.alphaknow.dto.employeeDTO.EmployeeDTO;
import com.spring.alphaknow.service.employeeService.EmployeeService;



@Controller
public class employeeManagementController {
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping("/employee")
	public String employeeManagementPage(Model model) {
		
		List list = employeeService.employeeList();
		
		model.addAttribute("list", list);
		System.out.println("list : " + list);
		
		return "employeeManagement";
	}
	
	@RequestMapping(value="/employee/insert", method=RequestMethod.POST)
	public String employeeInsert(
			@RequestParam ("employeeName") String employeeName,
			@RequestParam ("employeePhone") String employeePhone,
			@RequestParam ("employeeId") String employeeId,
			@RequestParam ("employeePw") String employeePw,
			@RequestParam ("departmentName") String departmentName
			) {

        // dto 에 담기
        EmployeeDTO dto = new EmployeeDTO();
        dto.setEmployeeName(employeeName);
        dto.setEmployeePhone(employeePhone);
        dto.setEmployeeId(employeeId);
        dto.setEmployeePw(employeePw);
        dto.setDepartmentName(departmentName);
        
        employeeService.employeeInsert(dto);
        
        return "redirect:/employee";
	}

	@RequestMapping("/employee/delete")
	public String employeeDelete(
			@RequestParam("employeeKey") int employeeKey
			) {
		employeeService.employeeDelete(employeeKey);
		
		return "redirect:/employee";
	}
	
	
	// Ajax 사원번호 받아서 상세정보 표시
	@RequestMapping("/employee/ajax.doSelect")
	@ResponseBody
	public List<EmployeeDTO> employeeAjax(
			@RequestParam("empno") int employeeKey
			) {
		
		// dto 에 담기
        EmployeeDTO dto = new EmployeeDTO();
        dto.setEmployeeKey(employeeKey);
		
		List<EmployeeDTO> list = employeeService.employeeDetailList(dto);
		return list;
	}
	
	// Ajax 사원번호 받아서 해당 사원 정보 수정
	@RequestMapping("/employee/ajax.doUpdate")
	@ResponseBody
	public EmployeeDTO employeeAjaxUpdate(
			@RequestParam("employeeKey") int employeeKey,
            @RequestParam("employeeName") String employeeName,
            @RequestParam("employeePhone") String employeePhone,
            @RequestParam("employeeId") String employeeId,
            @RequestParam("employeePw") String employeePw,
            @RequestParam("departmentName") String departmentName,
            @RequestParam("employeeStatus") String employeeStatus,
            @RequestParam("jobGrade") String jobGrade            
			) {
		
		// dto 에 담기
        EmployeeDTO dto = new EmployeeDTO();
        dto.setEmployeeKey(employeeKey);
        dto.setEmployeeName(employeeName);
        dto.setEmployeePhone(employeePhone);
        dto.setEmployeeId(employeeId);
        dto.setEmployeePw(employeePw);
        dto.setDepartmentName(departmentName);
        dto.setEmployeeStatus(employeeStatus);
        dto.setJobGrade(jobGrade);
		
		employeeService.employeeUpdate(dto);
		return dto;
	}
	
}
