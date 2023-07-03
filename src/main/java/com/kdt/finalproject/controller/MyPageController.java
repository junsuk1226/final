package com.kdt.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.ReviewService;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ReviewVO;

@Controller
public class MyPageController {

    @Autowired
    private HttpSession session;

    @Autowired
    private ReviewService reviewService;

    @RequestMapping("/myPage")
    public ModelAndView myPage() {
        ModelAndView mv = new ModelAndView();

        Object obj = session.getAttribute("mvo");

        if (obj != null) {
            // 로그인이 된 경우
            MemVO vo = (MemVO) obj;
            String m_idx = vo.getM_idx();
            int scoreCnt = reviewService.getScoreCnt(m_idx);

            mv.addObject("scoreCnt", scoreCnt);

        }
        mv.setViewName("/myPage/myPage");
        return mv;
    }

    @RequestMapping("/cart")
    public String cart() {

        return "/myPage/cart";
    }

    @RequestMapping("/info")
    public String info() {

        return "/myPage/info";
    }

    @RequestMapping("/infopw")
    public String infopw() {

        return "/myPage/infopw";
    }

}
