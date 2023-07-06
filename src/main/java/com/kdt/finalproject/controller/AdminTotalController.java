package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.MemService;
import com.kdt.finalproject.service.RegRestService;
import com.kdt.finalproject.vo.FoodVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.RegRestVO;
import com.kdt.finalproject.vo.RestVO;

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

    // 회원정보 수정(관리자)
    @RequestMapping("/adminTotal/editAdmin")
    public ModelAndView getRegRestList() {

        ModelAndView mv = new ModelAndView();

        RegRestVO[] ar = r_Service.getRegRestList();

        if (ar != null) {
            mv.addObject("ar", ar);
            mv.setViewName("/adminTotal/editAdmin");
        }

        return mv;
    }

    // 어드민 정보 수정
    @RequestMapping("/editAdminInfo")
    public ModelAndView editAdminInfo(String RestNm) {

        ModelAndView mv = new ModelAndView();

        RegRestVO rvo = r_Service.getRegRest(RestNm);

        mv.addObject("rvo", rvo);
        mv.setViewName("/adminTotal/editAdminInfo");

        return mv;
    }

    // 어드민 정보수정 로그
    @RequestMapping("/adminTotal/adminEditLog")
    public ModelAndView viewRegStatus() {
        ModelAndView mv = new ModelAndView();

        MemVO[] ar = r_Service.regLogList();

        if (ar != null) {

            mv.addObject("ar", ar);
            mv.setViewName("/adminTotal/adminEditLog");
        }

        return mv;
    }

    // 회원정보 수정(고객)
    @RequestMapping("/adminTotal/editMem")
    public ModelAndView getMemView() {

        ModelAndView mv = new ModelAndView();

        MemVO[] ar = m_Service.all();

        if (ar != null) {
            mv.addObject("ar", ar);
            mv.setViewName("/adminTotal/editMem");
        }
        return mv;
    }

    @PostMapping("/adminTotal/editMemSave")
    @ResponseBody
    public String editMemSave(String m_idx, String value, String type) {

        MemVO mvo = m_Service.searchMem(m_idx);

        if (type == "name") {
            mvo.setM_name(value);
        } else if (type == "phone") {
            mvo.setM_phone(value);
        }

        int result = m_Service.updateMem(mvo);

        if (result == 0) {
            return "false";
        }

        return "true";

    }

    @RequestMapping("/adminTotal/memEditLog")
    public String memEditLogTest() {
        return "/adminTotal/memEditLog";
    }

    @RequestMapping("/adminTotal/menuList")
    public String menuListTest() {
        return "/adminTotal/menuList";
    }

}
