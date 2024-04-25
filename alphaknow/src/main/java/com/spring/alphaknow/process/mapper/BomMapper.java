package com.spring.alphaknow.process.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.alphaknow.dto.BOMItem;

@Mapper
public interface BomMapper {

    List<BOMItem> findBOMItemsByBomId(@Param("product_seq") String product_seq);
}
