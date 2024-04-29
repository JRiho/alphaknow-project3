package com.spring.alphaknow.controller.ppmController;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.alphaknow.dto.inventoryDTO.InventoryDTO;
import com.spring.alphaknow.dto.ppmDTO.ProductPlanManagementDTO;
import com.spring.alphaknow.service.ppmService.ProductionPlanManagementService;

@Controller
public class ProductionPlanManagementController {
	
	@Autowired
	ProductionPlanManagementService productionPlanManagementService;
	
	@RequestMapping("/ppm/select")
	public String ppmPage(Model model) {
		
		List<InventoryDTO> list = productionPlanManagementService.ppmList();

		model.addAttribute("list", list);

		return "ppm";
	}
	
	@RequestMapping("/ppm/insert")
	public String ppmInsert(
			@RequestParam ("itemCodeAdd") int itemCode,
			@RequestParam ("itemNameAdd") String itemName,
			@RequestParam ("deliveryPlaceAdd") String deliveryPlace,
			@RequestParam ("deliveryAmountAdd") int deliveryAmount,
			@RequestParam ("productionAmountAdd") int productionAmount,
			@RequestParam ("remainAmountAdd") int remainAmount,
			@RequestParam ("startdateAdd") String startDate,
			@RequestParam ("enddateAdd") String endDate
			) {
		// 날짜형 자료 변환
        Date startdate = Date.valueOf(startDate);
        Date enddate = Date.valueOf(endDate);

        // dto 에 담기
        ProductPlanManagementDTO dto = new ProductPlanManagementDTO();
        dto.setItemCode(itemCode);
        dto.setItemName(itemName);
        dto.setDeliveryPlace(deliveryPlace);
        dto.setDeliveryAmount(deliveryAmount);
        dto.setProductionAmount(productionAmount);
        dto.setRemainAmount(remainAmount);
        dto.setStartdate(startdate);
        dto.setEnddate(enddate);
        
        productionPlanManagementService.ppmInsert(dto);
        
        return "redirect:/ppm/select";
	}
	
	@RequestMapping("/ppm/update")
    public String ppmUpdate(
            @RequestParam("itemCodeUpdate") int itemCode,
            @RequestParam("itemNameUpdate") String itemName,
            @RequestParam("deliveryPlaceUpdate") String deliveryPlace,
            @RequestParam("deliveryAmountUpdate") int deliveryAmount,
            @RequestParam("productionAmountUpdate") int productionAmount,
            @RequestParam("remainAmountUpdate") int remainAmount,
            @RequestParam("startdateUpdate") String startDate,
            @RequestParam("enddateUpdate") String endDate,
            @RequestParam("chkChild") String ppc
    		) {
        // 날짜형 자료 변환
        Date startdate = Date.valueOf(startDate);
        Date enddate = Date.valueOf(endDate);

        // DTO에 담기
        ProductPlanManagementDTO dto = new ProductPlanManagementDTO();
        dto.setItemCode(itemCode);
        dto.setItemName(itemName);
        dto.setDeliveryPlace(deliveryPlace);
        dto.setDeliveryAmount(deliveryAmount);
        dto.setProductionAmount(productionAmount);
        dto.setRemainAmount(remainAmount);
        dto.setStartdate(startdate);
        dto.setPpc(ppc);

        // Update 서비스 호출
        productionPlanManagementService.ppmUpdate(dto);

        return "redirect:/ppm/select";
    }
	
	@RequestMapping("/ppm/delete")
	public String ppmDelete(
			@RequestParam("chkChild") String[] productionPlanCodes
			) {
		try {
			for (String ppc : productionPlanCodes) {
				productionPlanManagementService.ppmDelete(ppc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/ppm/select";
	}
	
}
