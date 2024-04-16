package com.spring.alphaknow.dao.equipmentDAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.alphaknow.dto.equipmentDTO.Equipment;
import com.spring.alphaknow.dao.equipmentDAO.EquipmentMapper;

@Repository
public class EquipmentDAO {

    private final EquipmentMapper equipmentMapper;

    @Autowired
    public EquipmentDAO(EquipmentMapper equipmentMapper) {
        this.equipmentMapper = equipmentMapper;
    }

    public List<Equipment> getAllEquipments() {
        return equipmentMapper.getAllEquipments();
    }

    public void insertEquipment(Equipment equipment) {
        equipmentMapper.insertEquipment(equipment);
    }

    public void deleteEquipment(int equipmentCode) {
        equipmentMapper.deleteEquipment(equipmentCode);
    }

    public void updateEquipment(Equipment equipment) {
        equipmentMapper.updateEquipment(equipment);
    }
}
