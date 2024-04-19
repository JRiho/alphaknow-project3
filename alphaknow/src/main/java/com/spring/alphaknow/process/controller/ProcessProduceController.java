package com.spring.alphaknow.process.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/processproduce")
public class ProcessProduceController {

    // 'GET' 요청을 '/processproduce'에 매핑하여 공정도 관리 페이지를 렌더링
    @RequestMapping(method = RequestMethod.GET)
    public String showProcessProducePage(Model model) {
        // 필요한 모델 데이터를 추가할 수 있습니다. 예를 들면,
        // model.addAttribute("data", service.getData());

        // Tiles 설정에 따라 'processProduce' 뷰를 반환
        return "processProduce";
    }
}
