package com.kdt.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.FoodService;
import com.kdt.finalproject.service.PayService;
import com.kdt.finalproject.vo.FoodVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.PayVO;

@Controller
public class OrderListController {

    @Autowired
    private PayService p_service;

    @Autowired
    private FoodService f_service;

    @Autowired
    private HttpSession session;

    @RequestMapping("/order")
    public ModelAndView order(String cPage) {
        ModelAndView mv = new ModelAndView("/myPage/orderList");

        Object obj = session.getAttribute("mvo");
        if (obj != null) {
            MemVO mvo = (MemVO) obj;

            String m_idx = mvo.getM_idx();

            PayVO[] ar = p_service.order_list(m_idx);

            for (PayVO pvo : ar) {
                String[] name_ar = pvo.getFoodNm().split("/");

                FoodVO fvo = f_service.getFoodImg(name_ar[0]);
                if (fvo != null)
                    pvo.setF_image(fvo.getF_image());

            }

            mv.addObject("ar", ar);
        }

        return mv;
    }

    @RequestMapping("/orderDetail")
    public ModelAndView orderDetail(String cPage, String p_idx) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("/myPage/orderDetail");
        return mv;
    }

}
