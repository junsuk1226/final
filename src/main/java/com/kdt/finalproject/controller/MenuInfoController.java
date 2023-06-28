package com.kdt.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuInfoController {

    @RequestMapping("/menu/info")
    public ModelAndView menuInfo(String foodCost, String foodNm, String foodMaterial, String etc, String f_image,
            String RestNm, String r_photo) {

        ModelAndView mv = new ModelAndView();

        mv.addObject("RestNm", RestNm);
        mv.addObject("foodCost", foodCost);
        mv.addObject("foodNm", foodNm);
        mv.addObject("foodMaterial", foodMaterial);
        mv.addObject("etc", etc);

        if (f_image != null)
            mv.addObject("f_image", f_image);
        if (r_photo != null)
            mv.addObject("r_photo", r_photo);

        mv.setViewName("menuInfo");

        return mv;
    }

}
