package com.spring.alphaknow.process.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/processproduce") // 클래스 레벨의 URL 경로
public class ProcessProduceController {

    @RequestMapping(method = RequestMethod.GET)
    public String showProcessProducePage(Model model) {
        return "processProduce"; // 이 뷰 이름이 올바른지 확인하세요.
    }

    // 동적 뷰를 위한 메소드
    @RequestMapping(value = "/{pageName}", method = RequestMethod.GET) // URL 중복 수정
    public String dynamicPage(@PathVariable("pageName") String pageName) {
        System.out.println(pageName);
        return "process/" + pageName; // 뷰 경로 수정
    }
    
}
