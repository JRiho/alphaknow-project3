package com.spring.alphaknow.service.ppmService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alphaknow.dao.ppmDAO.ProductionPlanManagementDAOImpl;
import com.spring.alphaknow.dto.ppmDTO.ProductPlanManagementDTO;

@Service
public class ProductionPlanManagementService {
	
	@Autowired
	ProductionPlanManagementDAOImpl productionPlanManagementDAOImpl;
	
	public List ppmList() {
		return productionPlanManagementDAOImpl.ppmSelect();
	}
	
	public ProductPlanManagementDTO ppmInsert(ProductPlanManagementDTO dto) {
		return productionPlanManagementDAOImpl.ppmInsert(dto);
	}
	
	public ProductPlanManagementDTO ppmUpdate(ProductPlanManagementDTO dto) {
		return productionPlanManagementDAOImpl.ppmUpdate(dto);
	}
	
	public String ppmDelete(String ppc) {
		return productionPlanManagementDAOImpl.ppmDelete(ppc);
	}
}
