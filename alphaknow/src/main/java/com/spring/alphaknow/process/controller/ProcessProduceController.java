package com.spring.alphaknow.process.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/processproduce")
public class ProcessProduceController {

    @RequestMapping(method = RequestMethod.GET)
    public String showProcessProducePage(Model model) {
        return "processProduce";
    }

    // 동적 뷰fmf 위한 메소드 추가
    @RequestMapping(value = "/processproduce/{pageName}", method = RequestMethod.GET)
    public String dynamicPage(@PathVariable("pageName") String pageName) {
        System.out.println(pageName);
        return "processproduce/" + pageName;
    }

}