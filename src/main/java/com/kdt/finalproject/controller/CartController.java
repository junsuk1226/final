package com.kdt.finalproject.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {

    @RequestMapping("/viewCart")
    public ModelAndView cart(String foodNm, String foodCost, String RestNm, String quantity, String totalPrice)
            throws Exception {
        ModelAndView mv = new ModelAndView();

        System.out.println(foodNm);
        System.out.println(foodCost);
        System.out.println(RestNm);
        System.out.println(quantity);
        System.out.println(totalPrice);

        String location = URLEncoder.encode(RestNm, StandardCharsets.UTF_8.toString());

        mv.setViewName("redirect:menu?RestNm=" + location);

        return mv;
    }
}
