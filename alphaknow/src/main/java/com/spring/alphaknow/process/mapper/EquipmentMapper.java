package com.spring.alphaknow.process.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.spring.alphaknow.dto.equipmentDTO.Equipment;

@Repository
@Mapper
public interface EquipmentMapper {
    List<Equipment> getAllEquipments();
    void insertEquipment(Equipment equipment);
    void deleteEquipment(int equipmentCode);
    void updateEquipment(Equipment equipment);
}