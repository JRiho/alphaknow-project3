package com.spring.alphaknow.service.ppmService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alphaknow.dao.ppmDAO.ProductionPlanManagementDAO;
import com.spring.alphaknow.dto.ppmDTO.ProductPlanManagementDTO;

@Service
public class ProductionPlanManagementService {
	
	@Autowired
	ProductionPlanManagementDAO productionPlanManagementDAO;
	
	public List ppmList() {
		return productionPlanManagementDAO.selectPpmList();
	}
	
	public ProductPlanManagementDTO ppmInsert(ProductPlanManagementDTO dto) {
		return productionPlanManagementDAO.insertProductionPlan(dto);
	}
	
	public ProductPlanManagementDTO ppmUpdate(ProductPlanManagementDTO dto) {
		return productionPlanManagementDAO.updateProductionPlan(dto);
	}
	
	public String ppmDelete(String ppc) {
		return productionPlanManagementDAO.deleteProductionPlan(ppc);
	}
}
