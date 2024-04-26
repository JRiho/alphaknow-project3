package com.spring.alphaknow.service.rmService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alphaknow.dao.rmDAO.ReceivingManagementDAO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjax2DTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjax3DTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjax4DTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjaxDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementInsertDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementUpdateDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingSignDTO;

@Service
public class ReceivingManagementService {
	@Autowired
	ReceivingManagementDAO receivingManagementDAO;
	
	public List<ReceivingManagementDTO> rmList() {
		return receivingManagementDAO.receivingManagementSelect();
	}
	
	public void rmInsert(ReceivingManagementInsertDTO dto) {
		receivingManagementDAO.receivingManagementInsert(dto);
	}
	
	public void rmDelete(ReceivingManagementDTO dto) {
		receivingManagementDAO.receivingManagementDelete(dto);
	}
	
	public List<ReceivingManagementAjaxDTO> rmAjaxList() {
		return receivingManagementDAO.receivingManagementAjaxSelect();
	}
	
	public List<ReceivingManagementAjax2DTO> rmAjaxList2(String company_seq) {
		return receivingManagementDAO.receivingManagementAjaxSelect2(company_seq);
	}
	
	public List<ReceivingManagementAjax3DTO> rmAjaxList3(String trade_code) {
		return receivingManagementDAO.receivingManagementAjaxSelect3(trade_code);
	}
	
	public List<ReceivingManagementAjax4DTO> rmAjaxList4(String trade_code) {
		return receivingManagementDAO.receivingManagementAjaxSelect4(trade_code);
	}
	
	public void rmUpdate(ReceivingManagementUpdateDTO dto) {
		receivingManagementDAO.receivingManagementUpdate(dto);
	}
	
	public void rmSignUpdate(ReceivingSignDTO dto) {
		receivingManagementDAO.receivingSign(dto);
	}
	
	public void rmSignUpdate2(ReceivingSignDTO dto) {
		receivingManagementDAO.receivingSign2(dto);
	}
	
	public void rmToiv(ReceivingManagementAjax3DTO dto) {
		receivingManagementDAO.receivingToInventory(dto);
		receivingManagementDAO.receivingToInventory2(dto);
	}

}
