package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.vo.RestVO;

@Controller
public class SearchController {

    @RequestMapping("/search")
    public ModelAndView view_search(String sname) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println("||sname|||||||||||||||||||" + sname);
        String key = "0279357255"; // 인증키
        String type = "xml";
        // String setrouteCd = getrouteCd; // 노선 값 받기.
        String svarGsstClssCd = "0"; // 0: 휴게소 1: 주유소

        StringBuffer sb = new StringBuffer();
        sb.append("http://data.ex.co.kr/openapi/restinfo/hiwaySvarInfoList?"); // 호출 경로
        sb.append("key=");
        sb.append(key);
        sb.append("&type=");
        sb.append(type);
        // sb.append("&routeCd=");
        sb.append("&svarNm=");
        sb.append(URLEncoder.encode(sname, "utf-8"));
        sb.append("&svarGsstClssCd=");
        sb.append(svarGsstClssCd);

        URL url = new URL(sb.toString());

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.connect();

        SAXBuilder builder = new SAXBuilder();

        Document doc = builder.build(conn.getInputStream());

        Element root = doc.getRootElement();

        List<Element> list = root.getChildren("list");

        RestVO[] linelist = null;
        if (list.size() > 0) {
            int i = 0;
            List<RestVO> r_list = new ArrayList<>();

            for (Element item : list) {
                String svarCd = item.getChildText("svarCd");
                String svarNm = item.getChildText("svarNm");
                String routeCd = item.getChildText("routeCd");
                String routeNm = item.getChildText("routeNm");
                String hdqrCd = item.getChildText("hdqrCd");
                String hdqrNm = item.getChildText("hdqrNm");
                String mtnofCd = item.getChildText("mtnofCd");
                String mtnofNm = item.getChildText("mtnofNm");
                String gudClssCd = item.getChildText("gudClssCd");
                String gudClssNm = item.getChildText("gudClssNm");
                String svarAddr = item.getChildText("svarAddr");
                String rprsTelNo = item.getChildText("rprsTelNo");
                String dspnPrkgTrcn = item.getChildText("dspnPrkgTrcn");
                String cocrPrkgTrcn = item.getChildText("cocrPrkgTrcn");
                String fscarPrkgTrcn = item.getChildText("fscarPrkgTrcn");

                // 졸음쉼터 제거
                if (!svarNm.contains("졸음")) {
                    RestVO vo = new RestVO(svarCd, svarNm, routeCd, routeNm, hdqrCd, hdqrNm, mtnofCd, mtnofNm,
                            gudClssCd,
                            gudClssNm, svarAddr, rprsTelNo, dspnPrkgTrcn, cocrPrkgTrcn, fscarPrkgTrcn);

                    // linelist[i++] = vo;
                    r_list.add(vo);
                }
            } // for의 끝
            if (r_list.size() > 0) {
                linelist = new RestVO[r_list.size()];
                r_list.toArray(linelist);
            }

            mv.addObject("linelist", linelist);

        }
        mv.setViewName("/search");

        return mv;

    }

}
