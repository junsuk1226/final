package com.kdt.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderListController {

    @RequestMapping("/order")
    public ModelAndView order(String cPage) {
        ModelAndView mv = new ModelAndView("/myPage/orderList");

        return mv;
    }
}
