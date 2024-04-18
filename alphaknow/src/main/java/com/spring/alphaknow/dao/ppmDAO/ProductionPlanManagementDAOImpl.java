package com.spring.alphaknow.dao.ppmDAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.alphaknow.dto.ppmDTO.ProductPlanManagementDTO;

@Mapper
public interface ProductionPlanManagementDAOImpl {
	List ppmSelect();
	ProductPlanManagementDTO ppmInsert(ProductPlanManagementDTO dto);
	ProductPlanManagementDTO ppmUpdate(ProductPlanManagementDTO dto);
	String ppmDelete(String ppc);
}
