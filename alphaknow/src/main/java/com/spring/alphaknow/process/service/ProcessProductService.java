package com.spring.alphaknow.process.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alphaknow.dto.productDTO.ProductDTO;
import com.spring.alphaknow.process.mapper.ProcessProductMapper;

@Service
public class ProcessProductService {
    private final ProcessProductMapper productMapper;

    @Autowired
    public ProcessProductService(ProcessProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    // 부품 리시트
    public List<ProductDTO> getComponents() {
        return productMapper.selectComponents();
    }

    // 완품 리스트
    public List<ProductDTO> getFinishedProducts() {
        return productMapper.selectFinishedProducts();
    }
}
