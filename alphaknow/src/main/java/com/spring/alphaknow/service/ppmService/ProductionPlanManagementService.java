package com.spring.alphaknow.service.ppmService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alphaknow.dao.ppmDAO.ProductionPlanManagementDAO;

@Service
public class ProductionPlanManagementService {
	
	@Autowired
	ProductionPlanManagementDAO productionPlanManagementDAO;
	
	public List ppmList() {
		return productionPlanManagementDAO.selectPpmList();
	}
}
