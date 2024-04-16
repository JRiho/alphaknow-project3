package com.spring.alphaknow.dao.equipmentDAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.alphaknow.dto.equipmentDTO.Equipment;

@Mapper
public interface EquipmentMapper {
    List<Equipment> getAllEquipments();
    void insertEquipment(Equipment equipment);
    void deleteEquipment(int equipmentCode);
    void updateEquipment(Equipment equipment);
}
