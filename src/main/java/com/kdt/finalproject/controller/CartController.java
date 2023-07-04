package com.kdt.finalproject.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.util.Cart;
import com.kdt.finalproject.vo.ProductVO;

@Controller
public class CartController {

    @Autowired
    private HttpSession session;

    @RequestMapping("/viewCart")
    public ModelAndView cart(String foodNm, String foodCost, String RestNm, String quantity, String totalPrice)
            throws Exception {
        ModelAndView mv = new ModelAndView();

        // System.out.println(foodNm);
        // System.out.println(foodCost);
        // System.out.println(RestNm);
        // System.out.println(quantity);
        // System.out.println(totalPrice);
        // 세션에 값 저장하기

        session.setAttribute("foodNm", foodNm);
        session.setAttribute("foodCost", foodCost);
        session.setAttribute("RestNm", RestNm);
        session.setAttribute("totalPrice", totalPrice);
        session.setAttribute("quantity", quantity);

        int f_cost = 0;
        int t_price = 0;
        int q = 0;
        if (foodCost != null)
            f_cost = Integer.parseInt(foodCost);
        if (totalPrice != null)
            t_price = Integer.parseInt(totalPrice);
        if (quantity != null)
            q = Integer.parseInt(quantity);

        ProductVO pvo = new ProductVO(foodNm, RestNm, f_cost, t_price, q);

        // 카트 가져오기
        Object ob = session.getAttribute("cart");
        Cart cart = null;
        if (ob != null) {
            cart = (Cart) ob;
            cart.addProduct(pvo);
        }

        String location = URLEncoder.encode(RestNm, StandardCharsets.UTF_8.toString());

        mv.setViewName("redirect:menu?RestNm=" + location);
        return mv;
    }

    @RequestMapping("/cartout")
    public String logout() {
        session.removeAttribute("vo");
        return "/myPage/cart";
    }
}
