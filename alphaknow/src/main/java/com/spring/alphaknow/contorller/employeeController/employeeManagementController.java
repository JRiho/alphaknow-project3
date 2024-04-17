package com.spring.alphaknow.contorller.employeeController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.alphaknow.dto.employeeDTO.EmployeeDTO;
import com.spring.alphaknow.service.employeeService.EmployeeService;



@Controller
public class employeeManagementController {
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping("/employee")
	public String employeeManagementPage(Model model) {
		
		List list = employeeService.employeeList();
		
		model.addAttribute("list", list);
		System.out.println("list : " + list);
		
		return "employeeManagement";
	}
	
	@RequestMapping(value="/employee/insert", method=RequestMethod.POST)
	public String employeeInsert(
			@RequestParam ("employeeName") String employeeName,
			@RequestParam ("employeePhone") int employeePhone,
			@RequestParam ("employeeId") String employeeId,
			@RequestParam ("employeePw") String employeePw,
			@RequestParam ("departmentName") String departmentName
			) {

        // dto 에 담기
        EmployeeDTO dto = new EmployeeDTO();
        dto.setEmployeeName(employeeName);
        dto.setEmployeePhone(employeePhone);
        dto.setEmployeeId(employeeId);
        dto.setEmployeePw(employeePw);
        dto.setDepartmentName(departmentName);
        
        employeeService.employeeInsert(dto);
        
        return "redirect:/employee";
	}
	
//	@RequestMapping("/ppm/update")
//    public String ppmUpdate(
//            @RequestParam("itemCodeUpdate") int itemCode,
//            @RequestParam("itemNameUpdate") String itemName,
//            @RequestParam("deliveryPlaceUpdate") String deliveryPlace,
//            @RequestParam("deliveryAmountUpdate") int deliveryAmount,
//            @RequestParam("productionAmountUpdate") int productionAmount,
//            @RequestParam("remainAmountUpdate") int remainAmount,
//            @RequestParam("startdateUpdate") String startDate,
//            @RequestParam("enddateUpdate") String endDate,
//            @RequestParam("chkChild") String ppc
//    		) {
//        // 날짜형 자료 변환
//        Date startdate = Date.valueOf(startDate);
//        Date enddate = Date.valueOf(endDate);
//
//        // DTO에 담기
//        ProductPlanManagementDTO dto = new ProductPlanManagementDTO();
//        dto.setItemCode(itemCode);
//        dto.setItemName(itemName);
//        dto.setDeliveryPlace(deliveryPlace);
//        dto.setDeliveryAmount(deliveryAmount);
//        dto.setProductionAmount(productionAmount);
//        dto.setRemainAmount(remainAmount);
//        dto.setStartdate(startdate);
//        dto.setPpc(ppc);
//
//        // Update 서비스 호출
//        productionPlanManagementService.ppmUpdate(dto);
//
//        return "redirect:/ppm/select";
//    }
//	
//	@RequestMapping("/ppm/delete")
//	public String ppmDelete(
//			@RequestParam("chkChild") String[] productionPlanCodes
//			) {
//		try {
//			for (String ppc : productionPlanCodes) {
//				productionPlanManagementService.ppmDelete(ppc);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return "redirect:/ppm/select";
//	}
	
	
	// Ajax 사원번호 받아서 상세정보 표시
	@RequestMapping("/employee/ajax.do")
	@ResponseBody
	public List<EmployeeDTO> employeeAjax(
			@RequestParam("empno") int employeeKey
			) {
		
		// dto 에 담기
        EmployeeDTO dto = new EmployeeDTO();
        dto.setEmployeeKey(employeeKey);
		
		List<EmployeeDTO> list = employeeService.employeeDetailList(dto);
		return list;
	}
}
