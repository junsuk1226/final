package com.kdt.finalproject.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.FoodService;
import com.kdt.finalproject.service.JoinService;
import com.kdt.finalproject.service.MemService;
import com.kdt.finalproject.vo.FoodVO;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class AdminController {

    @Autowired
    private HttpSession session;

    @Autowired
    private MemService m_Service;

    @Autowired
    private JoinService j_Service;

    @Autowired
    private FoodService f_Service;

    @RequestMapping("/admin")
    public String adminTest() {
        return "/admin/index";
    }

    @RequestMapping(value = "/admin/reqLogin", method = RequestMethod.POST)
    public ModelAndView adminLogin(MemVO vo) {
        ModelAndView mv = new ModelAndView();

        if (vo != null) {
            MemVO mvo = m_Service.admin_login(vo);
            if (mvo != null) {
                session.setAttribute("mvo", mvo);
                mv.setViewName("/admin/main");
            } else {
                mv.setViewName("/admin/index");
                mv.addObject("alat", "alat");
            }
        } else {
            mv.setViewName("/admin/index");
            mv.addObject("alat", "alat");
        }
        return mv;
    }

    @GetMapping("/admin/join")
    public String AdminJoin() {
        return "/admin/join";
    }

    @RequestMapping("/admin/join")
    @ResponseBody
    public Map<String, String> adminJoin(String j_email, String j_password, String j_nickname,
            String j_confirmpassword,
            String m_phone) {
        // ModelAndView mv = new ModelAndView();
        Map<String, String> map = new HashMap<>();

        String email = j_email;
        String password = j_password;
        String name = j_nickname;

        MemVO vo = new MemVO();
        vo.setM_id(email);
        vo.setM_pw(password);
        vo.setM_name(name);
        vo.setM_phone(m_phone);

        Boolean chk = j_Service.check_email(vo);
        if (chk == true) {
            j_Service.addAdmin(vo);
            j_Service.addAdminLog(vo);
            // mv.setViewName("redirect:/login");
            map.put("adminjoin_fail", "0");
        } else {
            // session.setAttribute("commjoin_fail", "commjoin_fail");
            // mv.setViewName("redirect:/join");
            map.put("adminjoin_fail", "1");
        }

        return map;
    }

    @PostMapping("/amdin/checkid")
    @ResponseBody
    public Map<String, Object> check_id(String email) {
        boolean chk = j_Service.check_id(email);
        System.out.println(chk);
        Map<String, Object> map = new HashMap<>();
        map.put("chk", chk);

        return map;
    }

    @RequestMapping("/admin/main")
    public String adminMainTest() {
        return "/admin/main";
    }

    // @RequestMapping("/admin/menu")
    // public String adminMenuTest() {
    // return "/admin/menu";
    // }

    @RequestMapping("/admin/menu")
    public ModelAndView adminMenu() {
        ModelAndView mv = new ModelAndView();

        MemVO vo = (MemVO) session.getAttribute("mvo");

        FoodVO[] foodList = f_Service.all(vo.getM_name());

        mv.addObject("fvo", foodList);
        mv.setViewName("/admin/menu");

        return mv;
    }

    @RequestMapping("/admin/menuEdit")
    public ModelAndView adminMenuEdit(String f_idx) {
        ModelAndView mv = new ModelAndView();

        FoodVO food = f_Service.getOneFood(f_idx);

        mv.addObject("fvo", food);
        mv.setViewName("/admin/menuEdit");

        return mv;
    }

    @RequestMapping("/admin/sales")
    public String adminSalesTest() {
        return "/admin/sales";
    }

}
