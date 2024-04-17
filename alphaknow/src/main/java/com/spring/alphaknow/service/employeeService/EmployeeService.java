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
	
//	public ProductPlanManagementDTO ppmUpdate(ProductPlanManagementDTO dto) {
//		return productionPlanManagementDAO.updateProductionPlan(dto);
//	}
//	
//	public String ppmDelete(String ppc) {
//		return productionPlanManagementDAO.deleteProductionPlan(ppc);
//	}
}
