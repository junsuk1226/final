package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.vo.FacilitiesVO;
import com.kdt.finalproject.vo.RestVO;

@Controller
public class RestInfoController {
    
    @RequestMapping("/rest/info")
     public ModelAndView ViewRestInfo(String restCode) throws Exception {
        ModelAndView mv = new ModelAndView();

        String key = "0279357255"; //인증키
        String type = "xml";
        String serviceAreaCode2 = restCode; //휴게소 코드

        StringBuffer sb = new StringBuffer();
        sb.append("http://data.ex.co.kr/openapi/business/serviceAreaRoute?"); // 호출 경로
        sb.append("key=");
        sb.append(key);
        sb.append("&type=");
        sb.append(type);
        sb.append("&serviceAreaCode2=");
        sb.append(serviceAreaCode2);

        URL url = new URL(sb.toString());

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.connect();

        SAXBuilder builder = new SAXBuilder();

        Document doc = builder.build(conn.getInputStream());

        Element root = doc.getRootElement();

        List<Element> list = root.getChildren("list");
        FacilitiesVO[] facilities_list = null;

        return mv;
     }
}
