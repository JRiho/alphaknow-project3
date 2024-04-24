package com.spring.alphaknow.process.controller;

import com.spring.alphaknow.dto.productDTO.ProductDTO;
import com.spring.alphaknow.process.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.List;

@Controller
@RequestMapping("/processproduct")
public class ProcessProductController {

    @Autowired
    private ProcessProductService productService;

    // 제품 관리 페이지로 이동
    @RequestMapping(method = RequestMethod.GET)
    public String processProduct(Model model) {
        List<ProductDTO> components = productService.getComponents();
        List<ProductDTO> finishedProducts = productService.getFinishedProducts();

        model.addAttribute("components", components);
        model.addAttribute("finishedProducts", finishedProducts);

        return "processProduct"; // Tiles 설정에 정의된 뷰 이름
    }
}
