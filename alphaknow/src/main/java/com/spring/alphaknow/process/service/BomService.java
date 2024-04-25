package com.spring.alphaknow.process.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alphaknow.dto.BOMItem;
import com.spring.alphaknow.process.mapper.BomMapper;

@Service
public class BomService {

    private final BomMapper bomItemMapper;

    @Autowired
    public BomService(BomMapper bomItemMapper) {
        this.bomItemMapper = bomItemMapper;
    }

    public List<BOMItem> findBOMItemsByBomId(String product_seq) {
        return bomItemMapper.findBOMItemsByBomId(product_seq);
    }
}