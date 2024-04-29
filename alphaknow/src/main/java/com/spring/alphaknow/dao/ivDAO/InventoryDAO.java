package com.spring.alphaknow.dao.ivDAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.alphaknow.dto.inventoryDTO.InventoryDTO;

@Mapper
public interface InventoryDAO {
	public List<InventoryDTO> InventorySelect();
	public List<InventoryDTO> InventoryNow();
	public List<InventoryDTO> InventoryDetailAjax(InventoryDTO dto);
}
