package com.spring.alphaknow.service.ivService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alphaknow.dao.ivDAO.InventoryDAO;
import com.spring.alphaknow.dto.inventoryDTO.InventoryDTO;

@Service
public class InventoryService {
	@Autowired
	InventoryDAO inventoryDAO;
	
	public List<InventoryDTO> ivSelect() {
		return inventoryDAO.InventorySelect();
	}
	
	public List<InventoryDTO> ivNowSelect() {
		return inventoryDAO.InventoryNow();
	}
	
	public List<InventoryDTO> ivDetailAjax(InventoryDTO dto) {
		return inventoryDAO.InventoryDetailAjax(dto);
	}
}

