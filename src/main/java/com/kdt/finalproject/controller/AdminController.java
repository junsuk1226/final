package com.kdt.finalproject.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.FoodService;
import com.kdt.finalproject.service.JoinService;
import com.kdt.finalproject.service.MemService;
import com.kdt.finalproject.service.RestService;
import com.kdt.finalproject.service.ReviewService;
import com.kdt.finalproject.util.Paging;
import com.kdt.finalproject.vo.FoodVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.MonthTotalVO;
import com.kdt.finalproject.vo.OrderCntVO;
import com.kdt.finalproject.vo.RegRestVO;
import com.kdt.finalproject.vo.ReviewVO;

@Controller
public class AdminController {
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
    private ReviewService r_Service;

    @Autowired
    private RestService res_Service;

    @RequestMapping("/admin")
    public String adminTest() {
        return "/admin/index";
    }

    int seq = 700000000;

    @RequestMapping(value = "/admin/reqLogin", method = RequestMethod.POST)
    public ModelAndView adminLogin(MemVO vo) {
        ModelAndView mv = new ModelAndView();

        if (vo != null) {
            MemVO mvo = m_Service.admin_login(vo);
            if (mvo != null) {
                session.setAttribute("mvo", mvo);
                mv.setViewName("redirect:/admin/main");
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

    @PostMapping("/admin/checkid")
    @ResponseBody
    public Map<String, Object> check_id(String email) {
        boolean chk = j_Service.check_id(email);
        System.out.println(chk);
        Map<String, Object> map = new HashMap<>();
        map.put("chk", chk);

        return map;
    }

    @RequestMapping("/admin/logout")
    public String logout() {
        session.removeAttribute("mvo");
        return "/admin/index";
    }

    @RequestMapping("/admin/main")
    public ModelAndView adminMainTest() {
        ModelAndView mv = new ModelAndView("/admin/main");
        // 현재 날짜 구하기
        Calendar calendar = Calendar.getInstance();
        int currentMonth = calendar.get(Calendar.MONTH) + 1;
        int currentYear = calendar.get(Calendar.YEAR);
        mv.addObject("thisMonth", currentMonth);
        mv.addObject("thisYear", currentYear);

        Object obj = session.getAttribute("mvo");
        if (obj != null) {
            MemVO mvo = (MemVO) obj;
            String restNm = mvo.getM_name(); // 휴게소이름 받아오기

            // 프로필
            RegRestVO resvo = res_Service.getRestPic(restNm);
            mv.addObject("rest", resvo);

            // 평균 별점
            Float scoreAvg = r_Service.getScoreAvg(restNm);
            mv.addObject("scoreAvg", scoreAvg);

            // 전체 메뉴 주문 횟수
            int cnt = res_Service.getthisMonthCnt(restNm);
            mv.addObject("thisMonthCnt", cnt);

            // 많이 팔린 메뉴 하나만
            OrderCntVO[] ar = res_Service.getSameMonth_paylog(restNm);
            if (ar != null && ar.length > 0) {
                OrderCntVO ovo = ar[0];
                mv.addObject("foodOfMonth", ovo);
            }
            // 이번달 총매출
            // int cost = res_Service.getSameMonth_totalCost(restNm);
            Map<String, Long> cost = res_Service.getSameMonth_totalCost(restNm);
            if (cost.get("cnt") > 0)
                mv.addObject("thisMonthTotal", cost.get("sum_cost"));

            // 연도별 - 월별 매출
            MonthTotalVO[] mar = res_Service.getAllMonthTotal(restNm);
            // 연도를 key로 가지는 map 생성
            Map<String, List<MonthTotalVO>> map = new HashMap<>();

            for (MonthTotalVO tvo : mar) {
                String year = tvo.getYear();

                List<MonthTotalVO> yearList = map.computeIfAbsent(year, k -> new ArrayList<>());
                yearList.add(tvo);
            }
            mv.addObject("yearMonthTotal", map);

            // 최근 리뷰 5개
            ReviewVO[] r_ar = res_Service.getRecentReview(restNm);
            mv.addObject("recentReview", r_ar);
        }

        return mv;
    }

    @RequestMapping("/admin/menu")
    public ModelAndView adminMenu() {
        ModelAndView mv = new ModelAndView();

        MemVO vo = (MemVO) session.getAttribute("mvo");

        FoodVO[] foodList = f_Service.allList(vo.getM_name());
        int one = f_Service.getOne(vo.getM_name());
        int zero = f_Service.getZero(vo.getM_name());

        mv.addObject("zero", zero);
        mv.addObject("one", one);
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

    @RequestMapping("/admin/editConfirm")
    public ModelAndView editConfirm(FoodVO vo) {
        ModelAndView mv = new ModelAndView();

        System.out.println(vo.getF_idx());

        f_Service.editFood(vo);
        f_Service.editFoodLog(vo);

        mv.setViewName("redirect:/admin/menuEdit?f_idx=" + vo.getF_idx());

        return mv;
    }

    @GetMapping("/admin/menuAdd")
    public String menuAdd() {
        return "/admin/menuAdd";
    }

    @PostMapping("/admin/menuAdd")
    @Transactional
    public ModelAndView addConfirm(FoodVO vo) {
        ModelAndView mv = new ModelAndView();
        MemVO mvo = (MemVO) session.getAttribute("mvo");
        vo.setStdRestNm(mvo.getM_name());
        ++seq;
        vo.setSeq(seq);

        f_Service.addFood(vo);
        f_Service.addFoodLog(vo);

        mv.setViewName("redirect:/admin/menu");

        return mv;
    }

    // @RequestMapping("/admin/sales")
    // public String adminSalesTest() {
    // return "/admin/sales";
    // }

    @RequestMapping("/admin/review")
    @ResponseBody
    public ModelAndView adminReview(String date, String cPage) {
        MemVO mvo = (MemVO) session.getAttribute("mvo");
        ModelAndView mv = new ModelAndView();
        Map<String, String> map = new HashMap<>();
        map.put("r_restNm", mvo.getM_name());
        map.put("date", date);
        int nowPage = 1;

        int totalRecord = r_Service.adminTotalCount(map);

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        Paging page = new Paging(nowPage, totalRecord, 10, 5);
        String pageCode = page.getSb().toString();
        // -------------------------------
        map.put("begin", String.valueOf(page.getBegin()));
        map.put("end", String.valueOf(page.getEnd()));
        ReviewVO[] rvo = r_Service.adminReview(map); // JSP에서 표현할 목록 가져오기

        mv.addObject("date", date);
        mv.addObject("page", page);
        mv.addObject("pageCode", pageCode);
        mv.addObject("rvo", rvo);
        mv.addObject("totalRecord", totalRecord);// 총 게시물의 수
        mv.addObject("nowPage", nowPage);// 현재페이지 값
        mv.addObject("blockList", page.getNumPerPage());// 한페이지에 표현할 게시물 수
        mv.setViewName("admin/review");

        return mv;
    }
}
