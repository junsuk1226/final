package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.MemService;
import com.kdt.finalproject.service.RegRestService;
import com.kdt.finalproject.vo.MemVO;
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

    @RequestMapping("adminTotal/approval")
    @ResponseBody
    public void approval(String m_id) throws Exception {

        // 해당 아이디와 일치하는 휴게소 멤버 정보 가져오기
        MemVO mvo = r_Service.getRestInfo(m_id);

        String key = "0279357255"; // 인증키
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

        Map<String, String> map = new HashMap<>();

        map.put("m_id", mvo.getM_id());
        map.put("m_pw", mvo.getM_pw());
        map.put("m_name", mvo.getM_name());
        map.put("m_joinDate", mvo.getM_joinDate());
        map.put("m_status", "1");
        map.put("m_phone", mvo.getM_phone());
        map.put("restCd", rvo.getRouteCd());
        map.put("m_idx", mvo.getM_idx());

        Map<String, String> map2 = new HashMap<>();
        map2.put("reg_restNm", mvo.getM_name());
        map2.put("reg_restCd", rvo.getRouteCd());
        map2.put("reg_addr", rvo.getSvarAddr());
        map2.put("reg_phone", rvo.getRprsTelNo());
        map2.put("reg_ownerPhone", mvo.getM_phone());
        map2.put("reg_ownerEmail", mvo.getM_id());
        map2.put("m_idx", mvo.getM_idx());

        // 해당 휴게소의 m_status 값을 1로 변경 & log 추가 & regrest테이블에 저장
        r_Service.approval(m_id, map, map2);

    }

}
