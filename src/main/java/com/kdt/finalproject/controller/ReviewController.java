package com.kdt.finalproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.ReviewService;
import com.kdt.finalproject.util.Paging;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ReviewVO;

@Controller
public class ReviewController {

    @Autowired
    private HttpSession session;

    @Autowired
    private ReviewService reviewService;

    /*
     * @RequestMapping("/review")
     * public ModelAndView review(String cPage) {
     * ModelAndView mv = new ModelAndView("/myPage/review");
     * 
     * // System.out.println("RERERERERERERER");
     * Object obj = session.getAttribute("mvo");
     * if (obj != null) {
     * // 로그인이 된 경우
     * MemVO vo = (MemVO) obj;
     * String m_idx = vo.getM_idx();
     * Float scoreAvg = reviewService.getScoreAvg_Mem(m_idx);
     * int scoreCnt = reviewService.getScoreCnt(m_idx);
     * 
     * Map<String, Integer> score = reviewService.getStarCnt(m_idx);
     * 
     * ReviewVO[] ar = reviewService.getReviewList(m_idx);
     * mv.addObject("scoreAvg", scoreAvg);
     * mv.addObject("scoreCnt", scoreCnt);
     * mv.addObject("ar", ar);
     * mv.addObject("score", score);
     * 
     * }
     * 
     * return mv;
     * }
     */
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

    @RequestMapping("/review")
    public ModelAndView reviewlist(String cPage) {
        ModelAndView mv = new ModelAndView("/myPage/review");
        int nowPage = 1;
        Object obj = session.getAttribute("mvo");

        if (obj != null) {
            // 로그인이 된 경우
            MemVO vo = (MemVO) obj;
            String mIdx = vo.getM_idx();
            int m_idx = Integer.parseInt(mIdx);

            int totalRecord = reviewService.getTotalCount(mIdx);

            // 별점
            Float scoreAvg = reviewService.getScoreAvg_Mem(mIdx);
            int scoreCnt = reviewService.getScoreCnt(mIdx);
            Map<String, Integer> score = reviewService.getStarCnt(mIdx);

            if (cPage != null)
                nowPage = Integer.parseInt(cPage);

            Paging page = new Paging(nowPage, totalRecord, 5, 5);
            String pageCode = page.getSb().toString();
            // -------------------------------
            ReviewVO[] ar = reviewService.getReviewList(page.getBegin(), page.getEnd(), m_idx); // JSP에서 표현할 목록 가져오기

            // 별점
            mv.addObject("score", score);
            mv.addObject("scoreAvg", scoreAvg);
            mv.addObject("scoreCnt", scoreCnt);

            mv.addObject("ar", ar);
            mv.addObject("page", page);
            mv.addObject("pageCode", pageCode); // 페이징에 필요한 HTML코드
            mv.addObject("totalRecord", totalRecord);// 총 게시물의 수
            mv.addObject("nowPage", nowPage);// 현재페이지 값
            mv.addObject("blockList", page.getNumPerPage());// 한페이지에 표현할 게시물 수
        }

        return mv;
    }

}
