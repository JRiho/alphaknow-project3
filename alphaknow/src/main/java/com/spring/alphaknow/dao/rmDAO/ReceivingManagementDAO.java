package com.spring.alphaknow.dao.rmDAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjax2DTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjaxDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementInsertDTO;

@Mapper
public interface ReceivingManagementDAO {
	List<ReceivingManagementDTO> receivingManagementSelect();
	List<ReceivingManagementAjaxDTO> receivingManagementAjaxSelect();
	List<ReceivingManagementAjax2DTO> receivingManagementAjaxSelect2(String company_seq);
	void receivingManagementInsert(ReceivingManagementInsertDTO dto);
	void receivingManagementDelete(ReceivingManagementDTO dto);
}
