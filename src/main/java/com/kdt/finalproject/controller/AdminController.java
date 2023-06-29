package com.kdt.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping("/admin")
    public String adminTest() {
        return "/admin/index";
    }

    @RequestMapping("/admin/join")
    public String adminJoinTest(){
        return "/admin/join";
    }

    @RequestMapping("/admin/main")
    public String adminMainTest(){
        return "/admin/main";
    }
}
