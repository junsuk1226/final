package com.kdt.finalproject.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {

    @RequestMapping("/viewCart")
    public ModelAndView cart(String foodNm, String foodCost, String RestNm) throws Exception {
        ModelAndView mv = new ModelAndView();

        System.out.println(foodNm);
        System.out.println(foodCost);
        System.out.println(RestNm);
        String location = URLEncoder.encode(RestNm, StandardCharsets.UTF_8.toString());

        mv.setViewName("redirect:menu?RestNm=" + location);

        return mv;
    }
}
