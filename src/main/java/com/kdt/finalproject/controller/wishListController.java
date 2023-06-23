package com.kdt.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class wishListController {

    @RequestMapping("/wish")
    public String login() {

        return "/cart";
    }
}
