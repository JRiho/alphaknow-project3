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
		return productionPlanManagementDAO.ppmSelect();
	}
	
	public void ppmInsert(ProductPlanManagementDTO dto) {
		productionPlanManagementDAO.ppmInsert(dto);
	}
	
	public void ppmUpdate(ProductPlanManagementDTO dto) {
		productionPlanManagementDAO.ppmUpdate(dto);
	}
	
	public void ppmDelete(String ppc) {
		productionPlanManagementDAO.ppmDelete(ppc);
	}
}
