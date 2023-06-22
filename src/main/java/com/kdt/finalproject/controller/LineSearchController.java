package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.vo.RestVO;

@Controller
public class LineSearchController {

    @Autowired
    private HttpSession session;

    // @RequestMapping("line")
    // public ModelAndView Line() {
    // ModelAndView mv = new ModelAndView();

    // mv.setViewName("/linesearch");
    // return mv;
    // }

    @RequestMapping("lineSearchList")
    public ModelAndView LineSearch(String getrouteCd) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println(getrouteCd);
        String key = "0279357255"; // 인증키
        String type = "xml";
        String setrouteCd = getrouteCd; // 노선 값 받기.
        String svarGsstClssCd = "0"; // 0: 휴게소 1: 주유소

        StringBuffer sb = new StringBuffer();
        sb.append("http://data.ex.co.kr/openapi/restinfo/hiwaySvarInfoList?"); // 호출 경로
        sb.append("key=");
        sb.append(key);
        sb.append("&type=");
        sb.append(type);
        sb.append("&routeCd=");
        sb.append(setrouteCd);
        sb.append("&svarGsstClssCd=");
        sb.append(svarGsstClssCd);

        URL url = new URL(sb.toString());

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.connect();

        SAXBuilder builder = new SAXBuilder();

        Document doc = builder.build(conn.getInputStream());

        Element root = doc.getRootElement();

        List<Element> list = root.getChildren("list");

        if (list.size() > 0) {
            RestVO[] linelist = new RestVO[list.size()];
            int i = 0;

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
                Loop1: if (svarNm.contains("졸음")) {
                    break Loop1;
                } else {
                    RestVO vo = new RestVO(svarCd, svarNm, routeCd, routeNm, hdqrCd, hdqrNm, mtnofCd, mtnofNm,
                            gudClssCd,
                            gudClssNm, svarAddr, rprsTelNo, dspnPrkgTrcn, cocrPrkgTrcn, fscarPrkgTrcn);

                    linelist[i++] = vo;
                }
            }

            mv.addObject("linelist", linelist);
            mv.setViewName("/linesearch");
        } else {
            mv.setViewName("/linesearch");
        }

        return mv;
    }

}
