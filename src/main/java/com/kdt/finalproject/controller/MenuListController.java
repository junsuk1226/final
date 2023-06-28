package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.FoodService;
import com.kdt.finalproject.vo.FacilitiesVO;
import com.kdt.finalproject.vo.FoodVO;

@Controller
public class MenuListController {

    @Autowired
    private FoodService f_Service;

    @RequestMapping("/menu")
    public ModelAndView menu(String RestNm, String r_photo) throws Exception {
        ModelAndView mv = new ModelAndView();
        String key = "2077960536";// 개인
                                  // 인증키
                                  // (Encoding)
        String RestName = URLEncoder.encode(RestNm, "UTF-8");

        StringBuffer sb = new StringBuffer();
        sb.append("http://data.ex.co.kr/openapi/restinfo/restBestfoodList"); // 휴게소 위치 정보 API
        sb.append("?key=");
        sb.append(key);
        sb.append("&type=xml");
        sb.append("&numOfRows=1000");
        sb.append("&pageNo=1");
        sb.append("&stdRestNm=");
        sb.append(RestName);

        // 위의 StringBuffer가 가지고 있는 URL전체 경로를 가지고 URL객체를 먼저 생성하자!
        URL url = new URL(sb.toString());

        // 위의 URL을 요청하기 위해 연결객체 생성하자!
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.connect();// 호출~!

        // 호출했을 때 응답이 XML로 전달된다. 우린 이 XML문서를 파싱할 수 있어야 한다.
        // mvnrepository.com에서 jdom으로 검색하여 의존성을 알아내야 한다.
        SAXBuilder builder = new SAXBuilder();

        // 위의 SAXBuilder를 이용하여 응답되는 XML문서를 Document로 생성한다.
        Document doc = builder.build(conn.getInputStream());

        // 루트엘리먼트 얻기
        Element root = doc.getRootElement();
        // System.out.println(root.getName()); // response

        // 루트의 자식들 중 body를 얻어낸다.
        // Element body = root.getChild("body");
        // Element items = body.getChild("items");// body의 자식들 중 이름이 items인 요소 검색

        // items안에 자식들 중 이름이 item인 요소들 모두를 List로 받아낸다.
        List<Element> list = root.getChildren("list");

        // 위의 list 안에 있는 Element들을 ItemVO로 만들어서 배열로 저장해 둔다.

        // double userLatitude = Double.valueOf(lat);
        // double userLongitude = Double.valueOf(lon);
        FoodVO[] fvo = new FoodVO[list.size()];
        int i = 0;

        for (Element item : list) {
            // item이 가지는 값들 중 내가 필요한 값들(addr1, addr2, firstimage, ....)
            String foodCost = item.getChildText("foodCost");
            String foodNm = item.getChildText("foodNm");
            String foodMaterial = item.getChildText("foodMaterial");
            String etc = item.getChildText("etc");
            String stdRestNm = item.getChildText("stdRestNm");
            String bestfoodyn = item.getChildText("bestfoodyn");
            String premiumyn = item.getChildText("premiumyn");
            String recommendyn = item.getChildText("recommendyn");
            String seasonMenu = item.getChildText("seasonMenu");
            String seq = item.getChildText("seq");
            String f_image = item.getChildText("f_image");

            FoodVO vo = new FoodVO(f_image, foodCost, foodNm, foodMaterial, etc, stdRestNm, bestfoodyn, premiumyn,
                    recommendyn, seasonMenu, seq, f_image);

            fvo[i++] = vo;

        } // 복문의 끝

        // ========휴게소정보=========//

        String key2 = "2077960536";// 개인
                                   // 인증키
                                   // (Encoding)
        String RestName2 = URLEncoder.encode(RestNm, "UTF-8");

        StringBuffer sb2 = new StringBuffer();
        sb2.append("http://data.ex.co.kr/openapi/business/conveniServiceArea"); // 휴게소 위치 정보 API
        sb2.append("?key=");
        sb2.append(key2);
        sb2.append("&type=xml");
        sb2.append("&numOfRows=1000");
        sb2.append("&pageNo=1");
        sb2.append("&serviceAreaName=");
        sb2.append(RestName2);

        URL url2 = new URL(sb2.toString());

        HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
        conn2.connect();// 호출~!
        SAXBuilder builder2 = new SAXBuilder();
        Document doc2 = builder2.build(conn2.getInputStream());

        // 루트엘리먼트 얻기
        Element root2 = doc2.getRootElement();

        Element list2 = root2.getChild("list");

        String direction = list2.getChildText("direction");
        String serviceAreaCode = list2.getChildText("serviceAreaCode");
        String serviceAreaName = list2.getChildText("serviceAreaName");
        String telNo = list2.getChildText("telNo");
        String convenience = list2.getChildText("convenience");
        String truckSaYn = list2.getChildText("truckSaYn");
        String maintenanceYn = list2.getChildText("maintenanceYn");
        String numOfRows = list2.getChildText("numOfRows");
        String pageNo = list2.getChildText("pageNo");
        String serviceAreaCode2 = list2.getChildText("serviceAreaCode2");
        String routeName = list2.getChildText("routeName");
        String routeCode = list2.getChildText("routeCode");
        String svarAddr = list2.getChildText("svarAddr");
        String pageSize = list2.getChildText("pageSize");
        String code = list2.getChildText("code");
        String message = list2.getChildText("message");
        String count = list2.getChildText("count");
        String brand = list2.getChildText("brand");

        FacilitiesVO favo = new FacilitiesVO(direction, serviceAreaCode, serviceAreaName, telNo, convenience,
                truckSaYn, maintenanceYn, numOfRows, pageNo, serviceAreaCode2, routeName, routeCode, svarAddr,
                pageSize, code, message, count, brand);

        FoodVO[] far = f_Service.all();

        if (r_photo != null)
            mv.addObject("r_photo", r_photo);

        mv.addObject("RestNm", RestNm);
        mv.addObject("fList", far); // DB에 저장해놓은 음식 리스트
        mv.addObject("fvo", fvo); // API에서 받아오는 음식 리스트
        mv.addObject("favo", favo); // API에서 받아오는 휴게소 정보
        mv.setViewName("menuList");

        return mv;
    }

    @RequestMapping("/menu/info")
    public ModelAndView menuInfo(String foodCost, String foodNm, String foodMaterial, String etc, String f_image,
            String RestNm, String r_photo) {

        ModelAndView mv = new ModelAndView();

        mv.addObject("RestNm", RestNm);
        mv.addObject("foodCost", foodCost);
        mv.addObject("foodNm", foodNm);
        mv.addObject("foodMaterial", foodMaterial);
        mv.addObject("etc", etc);

        if (f_image != null)
            mv.addObject("f_image", f_image);
        if (r_photo != null)
            mv.addObject("r_photo", r_photo);

        mv.setViewName("menuInfo");

        return mv;
    }

}
