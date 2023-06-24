package com.kdt.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuListController {

    @RequestMapping("/menu")
    public String menuView() {
        return "/menuList";
    }

    @RequestMapping("/menu/info")
    public String menuInfo(){
        return "/menuInfo";
    }
}
