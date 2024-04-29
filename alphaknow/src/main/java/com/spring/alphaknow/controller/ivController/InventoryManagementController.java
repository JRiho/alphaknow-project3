package com.spring.alphaknow.controller.ivController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.alphaknow.dto.inventoryDTO.InventoryDTO;
import com.spring.alphaknow.service.ivService.InventoryService;

@Controller
public class InventoryManagementController {
	@Autowired
	InventoryService inventoryService;
	
	@RequestMapping("/inventoryManagement/list")
	public String inventoryManagementPage(Model model) {
		
		// 전체리스트
		List<InventoryDTO> list = inventoryService.ivSelect();
		// 품목현황
		List<InventoryDTO> list2 = inventoryService.ivNowSelect();
		
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		System.out.println("list----------------" + list);
		System.out.println("list2---------------" + list2);
		
		return "inventoryManagement";
	}
	
	// td클릭시 상세보기
	@RequestMapping("/inventoryManagement/ajax.doDetail")
	@ResponseBody
	public List<InventoryDTO> inventoryManagementPage(
			@RequestParam("pdseq") int product_seq
			) {
		
		InventoryDTO dto = new InventoryDTO();
		dto.setProduct_seq(product_seq);
		
		List<InventoryDTO> list = inventoryService.ivDetailAjax(dto);
		
		return list;
	}
}
