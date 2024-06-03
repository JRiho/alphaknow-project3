package com.spring.alphaknow.controller.rmController;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjax2DTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjax3DTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjax4DTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementAjaxDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementInsertDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingManagementUpdateDTO;
import com.spring.alphaknow.dto.rmDTO.ReceivingSignDTO;
import com.spring.alphaknow.service.rmService.ReceivingManagementService;

@Controller
public class ReceivingManagementController {
	@Autowired
	ReceivingManagementService receivingManagementService;

	@RequestMapping("/receivingManagement/list")
	public String receivingManagementPage(Model model) {
		List<ReceivingManagementDTO> list = receivingManagementService.rmList();
		
		model.addAttribute("list", list);
		System.out.println("list : " + list);
		
		return "receivingManagement";
	}
	
	@RequestMapping("/receivingManagement/insert")
	public String receivingManagementInsert(
			@RequestParam("tradecode") String trade_code,
			@RequestParam("requestDate") String str_request_date,
			@RequestParam("requestPerson") String request_person,
			@RequestParam("requestAddr") String request_addr,
			@RequestParam("captseq") int[] company_and_product_temp_seq,
			@RequestParam("itemAmount") int[] request_amount,		
			@RequestParam("itemAllPrice") int[] product_all_price
			) {
		
		// 날짜형 자료 변환
		// SimpleDateFormat을 사용하여 문자열을 java.util.Date 객체로 파싱
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date utilDate = null;
        try {
            utilDate = sdf.parse(str_request_date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        // java.util.Date 객체를 java.sql.Date 객체로 변환
        java.sql.Date request_date = new java.sql.Date(utilDate.getTime());
        System.out.println("request_date : " + request_date);
        
		ReceivingManagementInsertDTO dto = new ReceivingManagementInsertDTO();
		
		for(int i=0; i<company_and_product_temp_seq.length; i++) {
			dto.setTrade_code(trade_code);
			dto.setRequest_date(request_date);
			dto.setRequest_person(request_person);
			dto.setRequest_addr(request_addr);
			dto.setCompany_and_product_temp_seq(company_and_product_temp_seq[i]);
			dto.setRequest_amount(request_amount[i]);
			dto.setProduct_all_price(product_all_price[i]);
			
			System.out.println(dto);
			
			receivingManagementService.rmInsert(dto);
		}
		
		return "redirect:/receivingManagement/list";
	}
	
	// update문
	@RequestMapping("/receivingManagement/update")
	public String receivingManagementUpdate(
			@RequestParam("productSeq") int[] product_seq,
			@RequestParam("modifyDate") String str_modify_date,
			@RequestParam("modifyPerson") String modify_request_person,
			@RequestParam("modifyAddr") String request_addr,
			@RequestParam("itemAmount") int[] request_amount,		
			@RequestParam("itemAllPrice") int[] product_all_price
			) {
		
		// 날짜형 자료 변환
		// SimpleDateFormat을 사용하여 문자열을 java.util.Date 객체로 파싱
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date utilDate = null;
        try {
            utilDate = sdf.parse(str_modify_date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        // java.util.Date 객체를 java.sql.Date 객체로 변환
        java.sql.Date modify_request_date = new java.sql.Date(utilDate.getTime());
        System.out.println("modify_date : " + modify_request_date);
        
		ReceivingManagementUpdateDTO dto = new ReceivingManagementUpdateDTO();
		
		for(int i=0; i<product_seq.length; i++) {
			dto.setProduct_seq(product_seq[i]);
			dto.setModify_request_date(modify_request_date);
			dto.setModify_request_person(modify_request_person);
			dto.setRequest_addr(request_addr);
			dto.setRequest_amount(request_amount[i]);
			dto.setProduct_all_price(product_all_price[i]);
			
			System.out.println(dto);
			
			receivingManagementService.rmUpdate(dto);
		}
		
		return "redirect:/receivingManagement/list";
	}
	
	// update 결재상태
	@RequestMapping("/receivingManagement/signUpdate")
	public String receivingManagementSignUpdate(
			@RequestParam("trade_code") String[] trade_code,
			@RequestParam("sign_person") String sign_person
			) {
		ReceivingSignDTO dto = new ReceivingSignDTO();
		
		for(int i=0; i<trade_code.length; i++) {
			dto.setTrade_code(trade_code[i]);
			dto.setSign_person(sign_person);
			
			receivingManagementService.rmSignUpdate(dto);
		}
		
		return "redirect:/receivingManagement/list";
	}
	
	// update 반려
		@RequestMapping("/receivingManagement/signUpdate2")
		public String receivingManagementSignUpdate2(
				@RequestParam("trade_code") String[] trade_code
				) {
			ReceivingSignDTO dto = new ReceivingSignDTO();
			
			for(int i=0; i<trade_code.length; i++) {
				dto.setTrade_code(trade_code[i]);
				
				receivingManagementService.rmSignUpdate2(dto);
			}
			
			return "redirect:/receivingManagement/list";
		}
	
	// delete문
	@RequestMapping("/receivingManagement/delete")
	public String receivingManagementDelete (
			@RequestParam("trade_code_chk") String[] trade_code
			) {
		System.out.println("---------------" + trade_code[0]);
		
		ReceivingManagementDTO dto = new ReceivingManagementDTO();
		
		for(int i=0; i<trade_code.length; i++) {
			dto.setTrade_code(trade_code[i]);
			
			receivingManagementService.rmDelete(dto);
		}
		
		return "redirect:/receivingManagement/list";
	}
	
	// Ajax 입고신청 클릭이벤트
	@RequestMapping("/receivingManagement/ajax.doSelect")
	@ResponseBody
	public List<ReceivingManagementAjaxDTO> receivingManagementAjaxSelect() {
		return receivingManagementService.rmAjaxList();
	}
	
	// Ajax 입고신청서 작성 클릭이벤트
	@RequestMapping("/receivingManagement/ajax.doSelect2")
	@ResponseBody
	public List<ReceivingManagementAjax2DTO> receivingManagementAjaxSelect2(
			@RequestParam("company_seq") String company_seq
			) {
		return receivingManagementService.rmAjaxList2(company_seq);
	}
	
	// Ajax 상세보기
	@RequestMapping("/receivingManagement/ajax.doSelect3")
	@ResponseBody
	public List<ReceivingManagementAjax3DTO> receivingManagementAjaxSelect3(
			@RequestParam("trade_code") String trade_code
			) {
		return receivingManagementService.rmAjaxList3(trade_code);
	}
	
	// Ajax 수정하기버튼 누르면 나오는 수정창에 들어갈 정보
	@RequestMapping("/receivingManagement/ajax.doSelect4")
	@ResponseBody
	public List<ReceivingManagementAjax4DTO> receivingManagementAjaxSelect4(
			@RequestParam("trade_code") String trade_code
			) {
		return receivingManagementService.rmAjaxList4(trade_code);
	}
	
	@RequestMapping("/receivingManagement/insert/toInventory")
	public String receivingManagementToInventory(
			@RequestParam("trade_code") String[] trade_code,
			@RequestParam("product_seq") int[] product_seq,
			@RequestParam("lot") String[] lot,
			@RequestParam("product_amount") int[] product_amount
			) {
		
		ReceivingManagementAjax3DTO dto = new ReceivingManagementAjax3DTO();
		
		
		
		for(int i=0; i<product_seq.length; i++) {
			dto.setTradeCode(trade_code[0]);
			dto.setProductSeq(product_seq[i]);
			dto.setLot(lot[i]);
			dto.setRequestAmount(product_amount[i]);			
			receivingManagementService.rmToiv(dto);
		}
		
		
		return "redirect:/receivingManagement/list";
	}
	
}
