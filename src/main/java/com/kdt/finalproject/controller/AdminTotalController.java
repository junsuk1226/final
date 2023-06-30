package com.kdt.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.util.Cart;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class AdminTotalController {

    @RequestMapping("/adminTotal")
    public String adminTest() {
        return "/adminTotal/index";
    }

}
