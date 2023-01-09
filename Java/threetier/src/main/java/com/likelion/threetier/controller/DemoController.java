package com.likelion.threetier.controller;

import com.likelion.threetier.service.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {
    @Autowired
    private DemoService demoService;
    @GetMapping(value = "/")
    public String getDemo(){
        return demoService.getDemoStr();
    }
}
