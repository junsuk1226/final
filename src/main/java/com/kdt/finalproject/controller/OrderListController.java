package com.kdt.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.vo.PayVO;

@Controller
public class OrderListController {

    @RequestMapping("/order")
    public ModelAndView order(String cPage) {
        ModelAndView mv = new ModelAndView("/myPage/orderList");

        return mv;
    }

    @RequestMapping("/orderDetail")
    public ModelAndView orderDetail(String cPage, String p_idx) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("/myPage/orderDetail");
        return mv;
    }

}
