package com.kdt.finalproject.controller;

import java.io.File;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.kdt.finalproject.service.FoodService;
import com.kdt.finalproject.service.MemService;
import com.kdt.finalproject.service.RegRestService;
import com.kdt.finalproject.service.ReviewService;
import com.kdt.finalproject.util.FileRenameUtil;
import com.kdt.finalproject.util.MonthlyJoinStats;
import com.kdt.finalproject.util.Paging;
import com.kdt.finalproject.vo.FoodVO;
import com.kdt.finalproject.vo.ImageData;
import com.kdt.finalproject.vo.MemLogVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.RestVO;
import com.kdt.finalproject.vo.ReviewVO;

@Controller
public class AdminTotalController {

    @Autowired
    private HttpSession session;

    @Autowired
    private MemService m_Service;

    @Autowired
    private RegRestService r_Service;

    @Autowired
    private FoodService f_Service;

    @Autowired
    private ReviewService re_Service;

    @Autowired
    private ServletContext application;

    @Autowired
    private HttpServletRequest request;

    private String img_path = "/images";

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
    public ModelAndView adminTotalMain() throws Exception {

        ModelAndView mv = new ModelAndView();

        String key = "2077960536"; // 인증키
        String type = "xml";
        String svarGsstClssCd = "0"; // 0: 휴게소 1: 주유소

        StringBuffer sb = new StringBuffer();
        sb.append("http://data.ex.co.kr/openapi/restinfo/hiwaySvarInfoList?"); // 호출 경로
        sb.append("key=");
        sb.append(key);
        sb.append("&type=");
        sb.append(type);
        sb.append("&svarGsstClssCd=");
        sb.append(svarGsstClssCd);

        URL url = new URL(sb.toString());

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.connect();

        SAXBuilder builder = new SAXBuilder();

        Document doc = builder.build(conn.getInputStream());

        Element root = doc.getRootElement();

        int all = Integer.parseInt(root.getChildText("count"));

        int reg_cnt = r_Service.getRegRestCnt();

        int wait_cnt = r_Service.waitRegRestCnt();

        List<MonthlyJoinStats> monthly = m_Service.geMonthlyJoinStats();

        mv.addObject("monthly", monthly);
        mv.addObject("all", all);
        mv.addObject("reg_cnt", reg_cnt);
        mv.addObject("wait_cnt", wait_cnt);

        mv.setViewName("/adminTotal/main");

        return mv;
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

    @PostMapping("/adminTotal/approval")
    @ResponseBody
    public String approval(String m_id) {

        try {

            // 해당 아이디와 일치하는 휴게소 멤버 정보 가져오기
            MemVO mvo = r_Service.getRestInfo(m_id);

            System.out.println(mvo.getM_name());

            String key = "2077960536"; // 인증키
            String type = "xml";
            String svarGsstClssCd = "0"; // 0: 휴게소 1: 주유소

            StringBuffer sb = new StringBuffer();
            sb.append("http://data.ex.co.kr/openapi/restinfo/hiwaySvarInfoList?"); // 호출 경로
            sb.append("key=");
            sb.append(key);
            sb.append("&type=");
            sb.append(type);
            // sb.append("&routeCd=");
            sb.append("&svarNm=");
            sb.append(URLEncoder.encode(mvo.getM_name(), "utf-8"));
            sb.append("&svarGsstClssCd=");
            sb.append(svarGsstClssCd);

            URL url = new URL(sb.toString());

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.connect();

            SAXBuilder builder = new SAXBuilder();

            Document doc = builder.build(conn.getInputStream());

            Element root = doc.getRootElement();

            Element el = root.getChild("list");

            RestVO rvo = null;

            if (el != null) {
                String svarCd = el.getChildText("svarCd");
                String svarNm = el.getChildText("svarNm");
                String routeCd = el.getChildText("routeCd");
                String routeNm = el.getChildText("routeNm");
                String hdqrCd = el.getChildText("hdqrCd");
                String hdqrNm = el.getChildText("hdqrNm");
                String mtnofCd = el.getChildText("mtnofCd");
                String mtnofNm = el.getChildText("mtnofNm");
                String gudClssCd = el.getChildText("gudClssCd");
                String gudClssNm = el.getChildText("gudClssNm");
                String svarAddr = el.getChildText("svarAddr");
                String rprsTelNo = el.getChildText("rprsTelNo");
                String dspnPrkgTrcn = el.getChildText("dspnPrkgTrcn");
                String cocrPrkgTrcn = el.getChildText("cocrPrkgTrcn");
                String fscarPrkgTrcn = el.getChildText("fscarPrkgTrcn");

                rvo = new RestVO(svarCd, svarNm, routeCd, routeNm, hdqrCd, hdqrNm,
                        mtnofCd, mtnofNm, gudClssCd, gudClssNm, svarAddr, rprsTelNo,
                        dspnPrkgTrcn, cocrPrkgTrcn, fscarPrkgTrcn);
            }

            // ---------------------------------

            // 휴게소 메뉴 정보
            String RestName = URLEncoder.encode(mvo.getM_name(), "UTF-8");

            StringBuffer sb2 = new StringBuffer();
            sb2.append("http://data.ex.co.kr/openapi/restinfo/restBestfoodList"); // 휴게소 위치 정보 API
            sb2.append("?key=");
            sb2.append(key);
            sb2.append("&type=xml");
            sb2.append("&numOfRows=1000");
            sb2.append("&pageNo=1");
            sb2.append("&stdRestNm=");
            sb2.append(RestName);

            URL url2 = new URL(sb2.toString());

            HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
            conn2.connect();

            SAXBuilder builder2 = new SAXBuilder();
            Document doc2 = builder2.build(conn2.getInputStream());

            Element root2 = doc2.getRootElement();

            List<Element> list2 = root2.getChildren("list");

            List<FoodVO> f_list = new ArrayList<FoodVO>();

            for (Element item : list2) {
                String f_idx = null;
                String foodCost = item.getChildText("foodCost");
                String foodNm = item.getChildText("foodNm");
                String foodMaterial = item.getChildText("foodMaterial");
                String etc = item.getChildText("etc");
                String stdRestNm = item.getChildText("stdRestNm");
                String bestfoodyn = item.getChildText("bestfoodyn");
                String premiumyn = item.getChildText("premiumyn");
                String recommendyn = item.getChildText("recommendyn");
                String seasonMenu = item.getChildText("seasonMenu");
                int seq = Integer.parseInt(item.getChildText("seq"));
                String f_image = item.getChildText("f_image");
                String f_status = item.getChildText("f_status");

                FoodVO fvo = new FoodVO(f_idx, foodCost, foodNm, foodMaterial, etc, stdRestNm, bestfoodyn, premiumyn,
                        recommendyn, seasonMenu, f_image, f_status, seq);

                f_list.add(fvo);
            }

            // ---------------------------------------------

            Map<String, String> map = new HashMap<>();

            map.put("m_id", mvo.getM_id());
            map.put("m_pw", mvo.getM_pw());
            map.put("m_name", mvo.getM_name());
            map.put("m_joinDate", mvo.getM_joinDate());
            map.put("m_status", "1");
            map.put("m_phone", mvo.getM_phone());
            map.put("restCd", rvo.getSvarCd());
            map.put("m_idx", mvo.getM_idx());

            Map<String, String> map2 = new HashMap<>();
            map2.put("reg_restNm", mvo.getM_name());
            map2.put("reg_restCd", rvo.getSvarCd());
            map2.put("reg_addr", rvo.getSvarAddr());
            map2.put("reg_phone", rvo.getRprsTelNo());
            map2.put("reg_ownerPhone", mvo.getM_phone());
            map2.put("reg_ownerEmail", mvo.getM_id());
            map2.put("m_idx", mvo.getM_idx());

            // 해당 휴게소의 m_status 값을 1로 변경 & log 추가 & regrest테이블에 저장
            r_Service.approval(m_id, map, map2, f_list);

            return "승인이 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();
            return "승인 과정에서 오류가 발생했습니다.";
        }

    }

    @PostMapping("/adminTotal/refuse")
    @ResponseBody
    public void refuse(String m_id) {

        // 해당 아이디와 일치하는 휴게소 멤버 정보 가져오기
        MemVO mvo = r_Service.getRestInfo(m_id);

        Map<String, String> map = new HashMap<>();

        map.put("m_id", mvo.getM_id());
        map.put("m_pw", mvo.getM_pw());
        map.put("m_name", mvo.getM_name());
        map.put("m_joinDate", mvo.getM_joinDate());
        map.put("m_status", "5");
        map.put("m_phone", mvo.getM_phone());
        map.put("restCd", mvo.getRestCd());
        map.put("m_idx", mvo.getM_idx());

        // 해당 휴게소의 m_status 값을 5로 변경 & log 추가
        r_Service.refuse(m_id, map);
    }

    // 어드민 정보수정 로그
    @RequestMapping("/adminTotal/adminEditLog")
    public ModelAndView viewRegStatus(String searchType, String searchValue, String cPage) {
        ModelAndView mv = new ModelAndView();
        int nowPage = 1;

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        int totalRecord = r_Service.totalCount(searchType, searchValue);

        Paging page = new Paging(nowPage, totalRecord, 10, 5);

        MemVO[] ar = r_Service.regLogList(page.getBegin(), page.getEnd(), searchType, searchValue);

        if (ar != null) {

            mv.addObject("ar", ar);
            mv.addObject("page", page);
            mv.addObject("totalRecord", totalRecord);// 총 게시물의 수
            mv.addObject("nowPage", nowPage);// 현재페이지 값
            mv.addObject("blockList", page.getNumPerPage());// 한페이지에 표현할 게시물 수
            if (searchType != null)
                mv.addObject("searchType", searchType);
            if (searchValue != null)
                mv.addObject("searchValue", searchValue);

            mv.setViewName("/adminTotal/adminEditLog");
        }

        return mv;
    }

    // 회원정보 수정(고객)
    @RequestMapping("/adminTotal/editMem")
    public ModelAndView getMemView(String searchType, String searchValue, String cPage) {

        ModelAndView mv = new ModelAndView();
        int nowPage = 1;

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        int totalRecord = m_Service.totalCount(searchType, searchValue, "0");

        Paging page = new Paging(nowPage, totalRecord, 10, 5);

        MemVO[] ar = m_Service.allMem(page.getBegin(), page.getEnd(), searchType, searchValue, "0");

        if (ar != null) {
            mv.addObject("ar", ar);
            mv.addObject("page", page);
            mv.addObject("totalRecord", totalRecord);// 총 게시물의 수
            mv.addObject("nowPage", nowPage);// 현재페이지 값
            mv.addObject("blockList", page.getNumPerPage());// 한페이지에 표현할 게시물 수
            if (searchType != null)
                mv.addObject("searchType", searchType);
            if (searchValue != null)
                mv.addObject("searchValue", searchValue);

            mv.setViewName("/adminTotal/editMem");
        }
        return mv;
    }

    @PostMapping("/adminTotal/editMemSave")
    @ResponseBody
    public String editMemSave(String m_idx, String value, String type) {

        MemVO mvo = m_Service.searchMem(m_idx);

        // System.out.println("m_idx|||||||||" + mvo.getM_idx());
        // System.out.println("m_id|||||||||" + mvo.getM_id());
        // System.out.println("m_idx|||||||||" + m_idx);
        // System.out.println("value|||||||||" + value);
        // System.out.println("type|||||||||" + type);

        if (type.equals("name")) {
            mvo.setM_name(value);
        } else if (type.equals("phone")) {
            mvo.setM_phone(value);
        } else if (type.equals("del")) {
            mvo.setM_status("4");
        }

        int result = m_Service.updateMem(mvo);

        if (result == 0) {
            return "false";
        }

        result = m_Service.updateMemLog(mvo);

        return "true";

    }

    @RequestMapping("/adminTotal/editMemLog")
    public ModelAndView editMemLogView(String searchType, String searchValue, String cPage) {
        ModelAndView mv = new ModelAndView();
        int nowPage = 1;

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        int totalRecord = m_Service.logTotalCount(searchType, searchValue, "4");

        Paging page = new Paging(nowPage, totalRecord, 10, 5);

        MemLogVO[] ar = m_Service.allMemLog(page.getBegin(), page.getEnd(), searchType, searchValue, "4");

        if (ar != null) {

            mv.addObject("ar", ar);
            mv.addObject("page", page);
            mv.addObject("totalRecord", totalRecord);// 총 게시물의 수
            mv.addObject("nowPage", nowPage);// 현재페이지 값
            mv.addObject("blockList", page.getNumPerPage());// 한페이지에 표현할 게시물 수

            mv.setViewName("/adminTotal/editMemLog");
        }

        return mv;
    }

    @RequestMapping("/adminTotal/menuList")
    public ModelAndView menuListTest(String searchType, String searchValue, String cPage) {
        ModelAndView mv = new ModelAndView();
        int nowPage = 1;

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        int totalRecord = f_Service.getMenuTotalCount(searchType, searchValue);

        Paging page = new Paging(nowPage, totalRecord, 10, 5);
        FoodVO[] ar = f_Service.getMenuList(page.getBegin(), page.getEnd(), searchType, searchValue);

        if (ar != null) {

            mv.addObject("ar", ar);
            mv.addObject("page", page);
            mv.addObject("totalRecord", totalRecord);// 총 게시물의 수
            mv.addObject("nowPage", nowPage);// 현재페이지 값
            mv.addObject("blockList", page.getNumPerPage());// 한페이지에 표현할 게시물 수

            mv.setViewName("/adminTotal/menuList");
        }

        return mv;
    }

    @RequestMapping("/adminTotal/viewMenu")
    public ModelAndView viewMenu(String searchType, String searchValue, String cPage, String f_idx) {
        ModelAndView mv = new ModelAndView();

        FoodVO fvo = f_Service.getOneFood(f_idx);

        mv.addObject("fvo", fvo);
        mv.addObject("nowPage", cPage);// 현재페이지 값
        mv.addObject("searchType", searchType);// 현재페이지 값
        mv.addObject("searchValue", searchValue);// 현재페이지 값

        mv.setViewName("/adminTotal/viewMenu");

        return mv;
    }

    @RequestMapping("/adminTotal/editMenu")
    public ModelAndView editMenu(FoodVO fvo, String searchType, String searchValue, String cPage) {

        /*
         * System.out.println("f_idx:" + fvo.getF_idx());
         * System.out.println("f_image:" + fvo.getF_image());
         * System.out.println("foodCost:" + fvo.getFoodCost());
         * System.out.println("foodNm:" + fvo.getFoodNm());
         * System.out.println("foodMaterial:" + fvo.getFoodMaterial());
         * System.out.println("etd:" + fvo.getEtc());
         * System.out.println("restNm:" + fvo.getStdRestNm());
         * System.out.println("seq:" + fvo.getSeq());
         * System.out.println("f_status:" + fvo.getF_status());
         */

        RedirectView rv = null;
        if (searchType == null)
            rv = new RedirectView("/adminTotal/viewMenu?cPage=" + cPage + "&f_idx=" + fvo.getF_idx());
        else
            rv = new RedirectView("/adminTotal/viewMenu?searchType=" + searchType + "&searchValue=" + searchValue
                    + "&cPage=" + cPage + "&f_idx=" + fvo.getF_idx());
        rv.setExposeModelAttributes(false);
        ModelAndView mv = new ModelAndView(rv);

        int cnt = f_Service.editFood(fvo);

        return mv;
    }

    @PostMapping("/adminTotal/saveImg")
    @ResponseBody
    public Map<String, String> saveImg(MultipartFile file) { // ajax에서 formdata를 data로 보냈다 -> Spring에서는 파일을 무조건
                                                             // MultipartFile로 받는다+변수명은 같게
        Map<String, String> map = new HashMap<String, String>();

        String fname = null;

        if (file.getSize() > 0) {
            // 첨부파일을 저장할 위치를 절대경로화 시킨다.
            String realPath = application.getRealPath(img_path);

            String oname = file.getOriginalFilename();
            // 첨부파일이 이미 저장된 파일과 이름이 동일한 경우 이름을 변경한다.
            fname = FileRenameUtil.checkFileName(oname, realPath);

            try {
                file.transferTo(new File(realPath, fname)); // 파일업로드가 수행됨

            } catch (Exception e) {
                e.printStackTrace();
            }
            // db작업은 하지 않지만 경로를 반환해야 하기 때문에 현재 서버의 경로를 알아내야 한다.
            String path = request.getContextPath(); // 서버 경로 알아내기

            // json으로 반환하기 위해 map구조에 저장
            map.put("path", img_path); // 서버 경로
            map.put("fname", fname); // 저장된 파일명
        }

        return map;
    }

    @PostMapping("/adminTotal/delImg")
    @ResponseBody
    public boolean delImg(@RequestBody ImageData data) {
        Boolean res = false;

        String path = data.getPath();
        String fname = data.getFname();

        String realPath = application.getRealPath(path);
        // System.out.println(realPath + fname);
        File f = new File(realPath, fname);

        if (f.exists()) {
            res = f.delete();
            // System.out.println("파일이 존재함");
        }

        return res;
    }

    @RequestMapping("/adminTotal/review")
    public ModelAndView review(String searchType, String searchValue, String cPage) {
        ModelAndView mv = new ModelAndView();
        int nowPage = 1;

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        int totalRecord = re_Service.reviewTotalCount(searchType, searchValue);

        Paging page = new Paging(nowPage, totalRecord, 10, 5);

        ReviewVO[] ar = re_Service.adminTotalReviewList(page.getBegin(), page.getEnd(), searchType, searchValue);

        if (ar != null) {

            mv.addObject("ar", ar);
            mv.addObject("page", page);
            mv.addObject("totalRecord", totalRecord);// 총 게시물의 수
            mv.addObject("nowPage", nowPage);// 현재페이지 값
            mv.addObject("blockList", page.getNumPerPage());// 한페이지에 표현할 게시물 수
            if (searchType != null)
                mv.addObject("searchType", searchType);
            if (searchValue != null)
                mv.addObject("searchValue", searchValue);

            mv.setViewName("/adminTotal/review");
        }

        return mv;
    }

}
