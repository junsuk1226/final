package com.kdt.finalproject.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.FoodService;
import com.kdt.finalproject.service.JoinService;
import com.kdt.finalproject.service.MemService;
import com.kdt.finalproject.service.PayService;
import com.kdt.finalproject.service.ReviewService;
import com.kdt.finalproject.util.Paging;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.PayVO;
import com.kdt.finalproject.vo.ReviewVO;

@Controller
public class SaleController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private HttpSession session;

    @Autowired
    private MemService m_Service;

    @Autowired
    private JoinService j_Service;

    @Autowired
    private FoodService f_Service;

    @Autowired
    private PayService p_Service;

    @RequestMapping("/admin/sales")
    public ModelAndView adminSales(String cPage, String date, String getMonth) {
        ModelAndView mv = new ModelAndView();

        MemVO mvo = (MemVO) session.getAttribute("mvo");
        Map<String, String> map = new HashMap<>();
        map.put("restNm", mvo.getM_name());
        map.put("date", date);
        int nowPage = 1;
        // 일별 매출내역 확인
        int totalRecord = p_Service.daySalesCnt(map);

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        PayVO[] pvo = null;

        map.put("month", getMonth);
        int totalRecord2 = p_Service.monthSalesCnt(map);

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);
        if (getMonth != null && !getMonth.isEmpty()) {
            // 월별 매출 내역 확인
            Paging page = new Paging(nowPage, totalRecord2, 10, 5);
            map.put("begin", String.valueOf(page.getBegin()));
            map.put("end", String.valueOf(page.getEnd()));

            mv.addObject("getMonth", getMonth);
            pvo = p_Service.monthSales(map);

            mv.addObject("page", page);
        } else {
            // 일별 매출 내역 확인
            Paging page = new Paging(nowPage, totalRecord, 10, 5);
            String pageCode = page.getSb().toString();
            map.put("begin", String.valueOf(page.getBegin()));
            map.put("end", String.valueOf(page.getEnd()));
            pvo = p_Service.daySales(map);

            mv.addObject("page", page);
            mv.addObject("pageCode", pageCode);
        }

        mv.addObject("date", date);
        mv.addObject("pvo", pvo);
        mv.addObject("totalRecord2", totalRecord2);// 총 게시물의 수
        mv.addObject("totalRecord", totalRecord);// 총 게시물의 수
        mv.addObject("nowPage", nowPage);// 현재페이지 값
        // mv.addObject("blockList", page.getNumPerPage());// 한페이지에 표현할 게시물 수
        mv.setViewName("/admin/sales");

        return mv;
    }

    @RequestMapping("/admin/orderlist")
    public ModelAndView adminOrder(String cPage, String date, String getMonth) {
        ModelAndView mv = new ModelAndView();

        MemVO mvo = (MemVO) session.getAttribute("mvo");
        Map<String, String> map = new HashMap<>();
        map.put("restNm", mvo.getM_name());
        map.put("date", date);
        int nowPage = 1;
        // 일별 매출내역 확인
        int totalRecord = p_Service.dayOrderCnt(map);

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        PayVO[] pvo = null;

        map.put("month", getMonth);
        int totalRecord2 = p_Service.monthOrderCnt(map);

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);
        if (getMonth != null && !getMonth.isEmpty()) {
            // 월별 매출 내역 확인
            Paging page = new Paging(nowPage, totalRecord2, 10, 5);
            map.put("begin", String.valueOf(page.getBegin()));
            map.put("end", String.valueOf(page.getEnd()));

            mv.addObject("getMonth", getMonth);
            pvo = p_Service.monthOrder(map);

            mv.addObject("page", page);
        } else {
            // 일별 매출 내역 확인
            Paging page = new Paging(nowPage, totalRecord, 10, 5);
            String pageCode = page.getSb().toString();
            map.put("begin", String.valueOf(page.getBegin()));
            map.put("end", String.valueOf(page.getEnd()));
            pvo = p_Service.dayOrder(map);

            mv.addObject("page", page);
            mv.addObject("pageCode", pageCode);
        }

        LocalDate now = LocalDate.now();

        mv.addObject("now", now);
        mv.addObject("date", date);
        mv.addObject("pvo", pvo);
        mv.addObject("totalRecord2", totalRecord2);// 총 게시물의 수
        mv.addObject("totalRecord", totalRecord);// 총 게시물의 수
        mv.addObject("nowPage", nowPage);// 현재페이지 값
        // mv.addObject("blockList", page.getNumPerPage());// 한페이지에 표현할 게시물 수
        mv.setViewName("/admin/orderlist");

        return mv;
    }
}
