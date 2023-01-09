package com.likelion.threetier.service.impl;

import com.likelion.threetier.repository.DemoRepository;
import com.likelion.threetier.service.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DemoServiceImpl implements DemoService {
    @Autowired
    DemoRepository demoRepository;

    public String getDemoStr(){
        return demoRepository.getStr();
    }
}
