package com.spring.alphaknow.dao.rmDAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjax2DTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjax3DTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjax4DTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjaxDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementInsertDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementUpdateDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingSignDTO;

@Mapper
public interface ReceivingManagementDAO {
	List<ReceivingManagementDTO> receivingManagementSelect();
	List<ReceivingManagementAjaxDTO> receivingManagementAjaxSelect();
	List<ReceivingManagementAjax2DTO> receivingManagementAjaxSelect2(String company_seq);
	void receivingManagementInsert(ReceivingManagementInsertDTO dto);
	void receivingManagementDelete(ReceivingManagementDTO dto);
	List<ReceivingManagementAjax3DTO> receivingManagementAjaxSelect3(String trade_code);
	List<ReceivingManagementAjax4DTO> receivingManagementAjaxSelect4(String trade_code);
    void receivingManagementUpdate(ReceivingManagementUpdateDTO dto);
    void receivingSign(ReceivingSignDTO dto);
    void receivingSign2(ReceivingSignDTO dto);
    void receivingToInventory(ReceivingManagementAjax3DTO dto);
    void receivingToInventory2(ReceivingManagementAjax3DTO dto);
}
