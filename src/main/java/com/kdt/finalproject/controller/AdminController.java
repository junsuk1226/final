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
public class AdminController {

    @Autowired
    private HttpSession session;

    @Autowired
    private MemService m_Service;

    @RequestMapping("/admin")
    public String adminTest() {
        return "/admin/index";
    }

    @RequestMapping(value = "/admin/reqLogin", method = RequestMethod.POST)
    public ModelAndView view(MemVO vo) {
        ModelAndView mv = new ModelAndView();

        if (vo != null) {
            MemVO mvo = m_Service.ml_login(vo);
            if (mvo != null) {
                session.setAttribute("mvo", mvo);
            }
            mv.setViewName("/admin/main");
        } else {
            mv.setViewName("/admin");
            mv.addObject("alat", "alat");
        }
        return mv;
    }

    @RequestMapping("/admin/join")
    public String adminJoinTest() {
        return "/admin/join";
    }

    @RequestMapping("/admin/main")
    public String adminMainTest() {
        return "/admin/main";
    }

    @RequestMapping("/admin/menu")
    public String adminMenuTest() {
        return "/admin/menu";
    }

    @RequestMapping("/admin/sales")
    public String adminSalesTest() {
        return "/admin/sales";
    }

}
