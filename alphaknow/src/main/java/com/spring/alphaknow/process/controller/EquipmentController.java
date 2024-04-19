package com.spring.alphaknow.process.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.alphaknow.dto.equipmentDTO.Equipment;
import com.spring.alphaknow.process.service.EquipmentService;

@Controller
@RequestMapping("/equipment")
public class EquipmentController {

    @Autowired                                 
    private EquipmentService equipmentService;  // 서비스 자동으로 주입

    @RequestMapping(method = RequestMethod.GET)
    public String listEquipments(Model model) {
        List<Equipment> equipmentList = equipmentService.getAllEquipments();
        model.addAttribute("equipmentList", equipmentList);
        return "processEquipment";  // 포워드할 JSP 페이지
    }

    @RequestMapping(params = "action=add", method = RequestMethod.POST)
    public String addEquipment(@ModelAttribute Equipment equipment, RedirectAttributes redirectAttributes) {
        equipmentService.addEquipment(equipment);
        redirectAttributes.addFlashAttribute("message", "장비가 성공적으로 추가되었습니다!");
        return "redirect:/equipment";
    } 

    @RequestMapping(params = "action=delete", method = RequestMethod.POST)
    public String deleteEquipment(@RequestParam("equipment_code") int equipmentCode, RedirectAttributes redirectAttributes) {
        equipmentService.deleteEquipment(equipmentCode);
        redirectAttributes.addFlashAttribute("message", "장비가 성공적으로 삭제되었습니다!");
        return "redirect:/equipment";
    }

    @RequestMapping(params = "action=update", method = RequestMethod.POST)
    public String updateEquipment(@ModelAttribute Equipment equipment, RedirectAttributes redirectAttributes) {
        equipmentService.updateEquipment(equipment);
        redirectAttributes.addFlashAttribute("message", "장비 정보가 업데이트되었습니다!");
        return "redirect:/equipment";
    }
}
