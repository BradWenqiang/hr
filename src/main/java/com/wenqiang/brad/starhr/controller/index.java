package com.wenqiang.brad.starhr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("index")
public class index {


    @GetMapping("hello")
    @ResponseBody
    public String hello(){
        return "hello";
    }

}
