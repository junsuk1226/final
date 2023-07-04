package com.kdt.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.MemService;
import com.kdt.finalproject.service.RegRestService;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class AdminTotalController {

    @Autowired
    private HttpSession session;

    @Autowired
    private MemService m_Service;

    @Autowired
    private RegRestService r_Service;

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
    public ModelAndView viewJoinList() {
        ModelAndView mv = new ModelAndView();

        MemVO[] ar = r_Service.regList();

        if (ar != null) {

            mv.addObject("ar", ar);
            mv.setViewName("adminTotal/joinList");
        }

        return mv;
    }

    @RequestMapping("adminTotal/approval")
    @ResponseBody
    public void approval(String m_id) {

        // 해당 휴게소의 m_status 값을 1로 변경
        r_Service.approval(m_id);

        // 멤버로그 테이블에 저장

        // 휴게소 정보를 api에서 불러와서 regrest table에 저장

    }

}
