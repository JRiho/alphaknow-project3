package com.spring.alphaknow.service.employeeService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alphaknow.dao.employeeDAO.EmployeeDAO;
import com.spring.alphaknow.dto.employeeDTO.EmployeeDTO;

@Service
public class EmployeeService {
	
	@Autowired
	EmployeeDAO employeeDAO;
	
	public List employeeList() {
		return employeeDAO.selectEmployeeList();
	}
	
	public EmployeeDTO employeeInsert(EmployeeDTO dto) {
		return employeeDAO.insertEmployee(dto);
	}
	
	public int employeeDelete(int empno) {
		return employeeDAO.deleteEmployee(empno);
	}
	
	// Ajax 부분입니다 ----------------------------------------------------
	
	public List<EmployeeDTO> employeeDetailList(EmployeeDTO dto) {
		return employeeDAO.selectEmployeeDetail(dto);
	}
	
	public EmployeeDTO employeeUpdate(EmployeeDTO dto) {
		return employeeDAO.updateEmployeeDetail(dto);
	}
}
