package com.spring.alphaknow.process.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/processproduct")
public class ProcessProductController {

    // 제품 관리 페이지로 이동
    @RequestMapping(method = RequestMethod.GET)
    public String processProduct(Model model) {
        // 모델에 데이터 추가 가능
        // model.addAttribute("key", value);

        return "processProduct"; // Tiles 설정에 정의된 뷰 이름
    }
}

