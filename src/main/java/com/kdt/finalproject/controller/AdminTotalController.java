package com.kdt.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.MemService;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class AdminTotalController {

    @Autowired
    private HttpSession session;

    @Autowired
    private MemService m_Service;

    @RequestMapping("/adminTotal")
    public String adminTest() {
        return "/adminTotal/index";
    }

    @RequestMapping(value = "/adminTotal/reqLogin", method = RequestMethod.POST)
    public ModelAndView adminTotalLogin(MemVO vo) {
        ModelAndView mv = new ModelAndView();

        if (vo != null) {
            MemVO mvo = m_Service.adminTotal_login(vo);
            if (mvo != null) {
                session.setAttribute("mvo", mvo);
                mv.setViewName("/adminTotal/main");
            } else {
                mv.setViewName("/adminTotal/index");
                mv.addObject("alat", "alat");
            }
        } else {
            mv.setViewName("/adminTotal/index");
            mv.addObject("alat", "alat");
        }
        return mv;
    }

    @RequestMapping("/adminTotal/main")
    public String adminTotalMainTest() {
        return "/adminTotal/main";
    }

    @RequestMapping("/adminTotal/joinList")
    public String adminTotalJoinListTest() {
        return "/adminTotal/joinList";
    }

}
