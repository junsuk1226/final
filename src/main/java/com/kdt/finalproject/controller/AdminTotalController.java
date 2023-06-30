package com.kdt.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminTotalController {
    @RequestMapping("/adminTotal")
    public String adminTest() {
        return "/adminTotal/index";
    }
}
