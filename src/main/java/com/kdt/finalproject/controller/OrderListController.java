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

    @RequestMapping("/orderdetail")
    public ModelAndView orderdetail(String cPage, String o_idx) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("/myPage/orderDetail");
        return mv;
    }

}
