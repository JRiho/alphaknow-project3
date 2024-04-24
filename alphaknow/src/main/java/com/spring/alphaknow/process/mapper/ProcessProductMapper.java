package com.spring.alphaknow.process.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.alphaknow.dto.productDTO.ProductDTO;

@Mapper
public interface ProcessProductMapper {
	 List<ProductDTO> selectComponents();
	 List<ProductDTO> selectFinishedProducts();
}
