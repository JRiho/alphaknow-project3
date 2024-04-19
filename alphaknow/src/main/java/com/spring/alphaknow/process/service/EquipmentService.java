package com.spring.alphaknow.process.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alphaknow.dto.equipmentDTO.Equipment;
import com.spring.alphaknow.process.mapper.EquipmentMapper;

@Service
public class EquipmentService {

    @Autowired
    private EquipmentMapper equipmentMapper;  // MyBatis 매퍼 자동 주입

    public List<Equipment> getAllEquipments() {
        return equipmentMapper.getAllEquipments();
    }

    public void addEquipment(Equipment equipment) {
        equipmentMapper.insertEquipment(equipment);
    }

    public void deleteEquipment(int equipmentCode) {
        equipmentMapper.deleteEquipment(equipmentCode);
    }

    public void updateEquipment(Equipment equipment) {
        equipmentMapper.updateEquipment(equipment);
    }
}

