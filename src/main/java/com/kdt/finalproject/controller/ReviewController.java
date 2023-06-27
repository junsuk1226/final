package com.kdt.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {

    @RequestMapping("/review")
    public ModelAndView review(String cPage) {
        ModelAndView mv = new ModelAndView("/myPage/review");

        return mv;
    }

}
