package com.spring.alphaknow.dao.ppmDAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.alphaknow.dto.ppmDTO.ProductPlanManagementDTO;

@Mapper
public interface ProductionPlanManagementDAO {
	List ppmSelect();
	void ppmInsert(ProductPlanManagementDTO dto);
	void ppmUpdate(ProductPlanManagementDTO dto);
	void ppmDelete(String ppc);
}
