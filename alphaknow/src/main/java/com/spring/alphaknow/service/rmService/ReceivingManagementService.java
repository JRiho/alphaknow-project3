package com.spring.alphaknow.service.rmService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alphaknow.dao.rmDAO.ReceivingManagementDAO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjax2DTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjaxDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementDTO;

@Service
public class ReceivingManagementService {
	@Autowired
	ReceivingManagementDAO receivingManagementDAO;
	
	public List<ReceivingManagementDTO> rmList() {
		return receivingManagementDAO.receivingManagementSelect();
	}
	
	public List<ReceivingManagementAjaxDTO> rmAjaxList() {
		return receivingManagementDAO.receivingManagementAjaxSelect();
	}
	
	public List<ReceivingManagementAjax2DTO> rmAjaxList2(String company_name) {
		return receivingManagementDAO.receivingManagementAjaxSelect2(company_name);
	}
}
