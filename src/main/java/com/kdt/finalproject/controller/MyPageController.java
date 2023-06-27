package com.kdt.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

    @RequestMapping("/myPage")
    public String myPage() {

        return "/myPage/myPage";
    }

    @RequestMapping("/cart")
    public String cart() {

        return "/myPage/cart";
    }

    @RequestMapping("/info")
    public String info() {

        return "/myPage/info";
    }

    @RequestMapping("/infopw")
    public String infopw() {

        return "/myPage/infopw";
    }

}
