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
public class ReviewController {

    @Autowired
    private HttpSession session;

    @Autowired
    private ReviewService reviewService;

    @RequestMapping("/review")
    public ModelAndView review(String cPage) {
        ModelAndView mv = new ModelAndView("/myPage/review");

        Object obj = session.getAttribute("mvo");
        if (obj != null) {
            // 로그인이 된 경우
            MemVO vo = (MemVO) obj;
            String m_idx = vo.getM_idx();

            ReviewVO[] ar = reviewService.getReviewList(m_idx);

            mv.addObject("ar", ar);
        }

        return mv;
    }

    @RequestMapping("/delReview")
    public ModelAndView delReview(String r_idx) {
        ModelAndView mv = new ModelAndView();

        Object obj = session.getAttribute("mvo");
        if (obj != null) {
            // 로그인이 된 경우
            MemVO vo = (MemVO) obj;
            String m_idx = vo.getM_idx();

            reviewService.delReview(r_idx);
        }
        mv.setViewName("redirect:/review");

        return mv;
    }

}
