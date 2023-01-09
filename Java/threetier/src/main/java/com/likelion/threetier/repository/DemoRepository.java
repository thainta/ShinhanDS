package com.likelion.threetier.repository;

import org.springframework.stereotype.Repository;

@Repository
public class DemoRepository {
    public String getStr(){
        return "Hello Word!";
    }
}
