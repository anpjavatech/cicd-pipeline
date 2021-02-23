package com.cicd.pipeline.cicdtemplate.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Home {

    @RequestMapping("/")
    public String getHealthCheck(){
        return "This Service is running successfully..";
    }
}
