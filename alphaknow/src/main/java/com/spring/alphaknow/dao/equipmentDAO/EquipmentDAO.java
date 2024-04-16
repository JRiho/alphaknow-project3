package com.spring.alphaknow.dao.equipmentDAO;

import java.util.List;

import com.spring.alphaknow.dto.equipmentDTO.Equipment;

public interface EquipmentDAO {
    List<Equipment> getAllEquipments() throws Exception;
    void addEquipment(Equipment equipment) throws Exception;
    void deleteEquipment(int equipmentCode) throws Exception;
//	void updateEquipment(Equipment equipment) throws Exception;
	void updateEquipment(Equipment equipment) throws Exception;
}

