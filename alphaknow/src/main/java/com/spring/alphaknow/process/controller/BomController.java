package com.spring.alphaknow.process.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.spring.alphaknow.dto.BOMItem;
import com.spring.alphaknow.process.service.BomService;
import com.spring.alphaknow.process.service.QRCodeService;

import java.util.List;

@Controller
@RequestMapping("/bom")
public class BomController {
    private final BomService bomService;
    private final QRCodeService qrCodeService;

    @Autowired
    public BomController(BomService bomService, QRCodeService qrCodeService) {
        this.bomService = bomService;
        this.qrCodeService = qrCodeService;
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public String getBomDetailsAsHtmlTable(@RequestParam String product_seq, Model model) {
        List<BOMItem> bomItems = bomService.findBOMItemsByBomId(product_seq);
        model.addAttribute("bomItems", bomItems);

        String qrCodeUrl = qrCodeService.generateQRCode(product_seq);
        model.addAttribute("qrCodeUrl", qrCodeUrl);

        return "bomDetails";
    }
}
