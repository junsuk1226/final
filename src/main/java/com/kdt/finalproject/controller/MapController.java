package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kdt.finalproject.service.FoodService;
import com.kdt.finalproject.service.ReviewService;
import com.kdt.finalproject.vo.FoodVO;
import com.kdt.finalproject.vo.MapInfoVO;
import com.kdt.finalproject.vo.MapVO;
import com.kdt.finalproject.vo.ReviewVO;
import com.kdt.finalproject.vo.WeatherVO;

@Controller
public class MapController {

    @Autowired
    FoodService f_Service;

    @Autowired
    ReviewService r_sService;

    @RequestMapping("map")
    public String map() {
        return "map";
    }

    @RequestMapping("reqMap")
    @ResponseBody
    public Map<String, Object> map(Double lat, Double lon) throws Exception {
        Map<String, Object> map = new HashMap<>();

        String key = "2077960536";// 개인
                                  // 인증키
                                  // (Encoding)

        StringBuffer sb = new StringBuffer();
        sb.append("http://data.ex.co.kr/openapi/locationinfo/locationinfoRest"); // 휴게소 위치 정보 API
        sb.append("?key=");
        sb.append(key);
        sb.append("&type=xml");
        sb.append("&numOfRows=1000");
        sb.append("&pageNo=1");

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
        double radius = 300;
        MapVO vo = null;
        double minDistance = Double.MAX_VALUE;
        if (lat != null && lon != null) {
            lat = 37.332583;
            lon = 127.104397;
            for (Element item : list) {
                // item이 가지는 값들 중 내가 필요한 값들(addr1, addr2, firstimage, ....)
                String unitCode = item.getChildText("unitCode");
                String unitName = item.getChildText("unitName");
                String routeName = item.getChildText("routeName");
                String xValue = item.getChildText("xValue");
                String yValue = item.getChildText("yValue");

                double locationLatitude = Double.parseDouble(yValue);
                double locationLongitude = Double.parseDouble(xValue);

                double distance = calculateDistance(lat, lon,
                        locationLatitude,
                        locationLongitude);

                if (distance <= radius && distance < minDistance) {
                    // 위에서 얻어낸 값들을 하나의 VO로 저장해 둔다.
                    vo = new MapVO(unitCode, unitName, routeName, xValue, yValue);

                    map.put("xValue", xValue);
                    map.put("yValue", yValue);
                    map.put("unitName", unitName);
                    map.put("routeName", routeName);
                    minDistance = distance;
                    break;
                }

            } // 복문의 끝

        }

        String encodedKeyword = URLEncoder.encode(vo.getUnitName(), "UTF-8");

        StringBuffer sb2 = new StringBuffer();
        sb2.append("http://data.ex.co.kr/openapi/restinfo/restBrandList"); // 휴게소의 브랜드 호출 API
        sb2.append("?key=");
        sb2.append(key);
        sb2.append("&type=xml");
        sb2.append("&numOfRows=1000");
        sb2.append("&pageNo=1");
        sb2.append("&stdRestNm=");
        sb2.append(encodedKeyword);

        // 위의 StringBuffer가 가지고 있는 URL전체 경로를 가지고 URL객체를 먼저 생성하자!
        URL url2 = new URL(sb2.toString());

        // 위의 URL을 요청하기 위해 연결객체 생성하자!
        HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
        conn2.connect();// 호출~!

        // 호출했을 때 응답이 XML로 전달된다. 우린 이 XML문서를 파싱할 수 있어야 한다.
        // mvnrepository.com에서 jdom으로 검색하여 의존성을 알아내야 한다.
        SAXBuilder builder2 = new SAXBuilder();

        // 위의 SAXBuilder를 이용하여 응답되는 XML문서를 Document로 생성한다.
        Document doc2 = builder2.build(conn2.getInputStream());

        // 루트엘리먼트 얻기
        Element root2 = doc2.getRootElement();
        // System.out.println(root.getName()); // response

        // 루트의 자식들 중 body를 얻어낸다.
        // Element body = root.getChild("body");
        // Element items = body.getChild("items");// body의 자식들 중 이름이 items인 요소 검색

        // items안에 자식들 중 이름이 item인 요소들 모두를 List로 받아낸다.
        List<Element> list2 = root2.getChildren("list");

        // 위의 list 안에 있는 Element들을 ItemVO로 만들어서 배열로 저장해 둔다.

        // double userLatitude = Double.valueOf(lat);
        // double userLongitude = Double.valueOf(lon);

        MapInfoVO[] info = new MapInfoVO[list2.size()];
        int i = 0;

        for (Element item : list2) {
            // item이 가지는 값들 중 내가 필요한 값들(addr1, addr2, firstimage, ....)
            String brdName = item.getChildText("brdName");
            String brdDesc = item.getChildText("brdDesc");
            String stime = item.getChildText("stime");
            String etime = item.getChildText("etime");
            String psName = item.getChildText("psName");
            String psDesc = item.getChildText("psDesc");
            String svarAddr = item.getChildText("svarAddr");

            // 위에서 얻어낸 값들을 하나의 VO로 저장해 둔다.
            MapInfoVO mvo = new MapInfoVO(brdName, brdDesc, stime, etime, psName, psDesc, svarAddr);

            info[i++] = mvo;

        } // 복문의 끝
        map.put("info", info);
        // System.out.println(info[1].getBrdDesc());

        StringBuffer sb3 = new StringBuffer();
        sb3.append("http://data.ex.co.kr/openapi/restinfo/restConvList"); // 휴게소의 편의시설 호출 API
        sb3.append("?key=");
        sb3.append(key);
        sb3.append("&type=xml");
        sb3.append("&numOfRows=1000");
        sb3.append("&pageNo=1");
        sb3.append("&stdRestNm=");
        sb3.append(encodedKeyword);

        // 위의 StringBuffer가 가지고 있는 URL전체 경로를 가지고 URL객체를 먼저 생성하자!
        URL url3 = new URL(sb3.toString());

        // 위의 URL을 요청하기 위해 연결객체 생성하자!
        HttpURLConnection conn3 = (HttpURLConnection) url3.openConnection();
        conn3.connect();// 호출~!

        // 호출했을 때 응답이 XML로 전달된다. 우린 이 XML문서를 파싱할 수 있어야 한다.
        // mvnrepository.com에서 jdom으로 검색하여 의존성을 알아내야 한다.
        SAXBuilder builder3 = new SAXBuilder();

        // 위의 SAXBuilder를 이용하여 응답되는 XML문서를 Document로 생성한다.
        Document doc3 = builder3.build(conn3.getInputStream());

        // 루트엘리먼트 얻기
        Element root3 = doc3.getRootElement();
        // System.out.println(root.getName()); // response

        // 루트의 자식들 중 body를 얻어낸다.
        // Element body = root.getChild("body");
        // Element items = body.getChild("items");// body의 자식들 중 이름이 items인 요소 검색

        // items안에 자식들 중 이름이 item인 요소들 모두를 List로 받아낸다.
        List<Element> list3 = root3.getChildren("list");

        // 위의 list 안에 있는 Element들을 ItemVO로 만들어서 배열로 저장해 둔다.

        // double userLatitude = Double.valueOf(lat);
        // double userLongitude = Double.valueOf(lon);

        MapInfoVO[] rest = new MapInfoVO[list3.size()];
        i = 0;

        for (Element item : list3) {
            // item이 가지는 값들 중 내가 필요한 값들(addr1, addr2, firstimage, ....)
            String brdName = item.getChildText("brdName");
            String brdDesc = item.getChildText("brdDesc");
            String stime = item.getChildText("stime");
            String etime = item.getChildText("etime");
            String psName = item.getChildText("psName");
            String psDesc = item.getChildText("psDesc");
            String svarAddr = item.getChildText("svarAddr");

            // 위에서 얻어낸 값들을 하나의 VO로 저장해 둔다.
            MapInfoVO mvo = new MapInfoVO(brdName, brdDesc, stime, etime, psName, psDesc, svarAddr);
            rest[i++] = mvo;

        } // 복문의 끝
        map.put("rest", rest);

        // 오늘 날짜 구하기
        LocalDate now = LocalDate.now();
        int year = now.getYear();
        int month = now.getMonthValue();
        int day = now.getDayOfMonth();
        StringBuffer sdate = new StringBuffer();
        sdate.append(year);
        if (month < 10)
            sdate.append("0");
        sdate.append(month);
        if (day < 10)
            sdate.append("0");
        sdate.append(day);

        // 현재 시간 구하기
        LocalTime nowTime = LocalTime.now();
        int hour = nowTime.getHour();
        StringBuffer stdHour = new StringBuffer();
        if (hour - 2 < 10)
            stdHour.append("0");
        stdHour.append(hour - 2);

        StringBuffer sb4 = new StringBuffer();
        sb4.append("http://data.ex.co.kr/openapi/restinfo/restWeatherList"); // 휴게소 위치별 날씨정보
        sb4.append("?key=");
        sb4.append(key);
        sb4.append("&type=xml");
        sb4.append("&sdate=");
        sb4.append(sdate.toString());
        sb4.append("&stdHour=");
        sb4.append(stdHour.toString());
        System.out.println(sb4.toString());
        // 위의 StringBuffer가 가지고 있는 URL전체 경로를 가지고 URL객체를 먼저 생성하자!
        URL url4 = new URL(sb4.toString());

        // 위의 URL을 요청하기 위해 연결객체 생성하자!
        HttpURLConnection conn4 = (HttpURLConnection) url4.openConnection();
        conn4.connect();// 호출~!

        // 호출했을 때 응답이 XML로 전달된다. 우린 이 XML문서를 파싱할 수 있어야 한다.
        // mvnrepository.com에서 jdom으로 검색하여 의존성을 알아내야 한다.
        SAXBuilder builder4 = new SAXBuilder();

        // 위의 SAXBuilder를 이용하여 응답되는 XML문서를 Document로 생성한다.
        Document doc4 = builder4.build(conn4.getInputStream());

        // 루트엘리먼트 얻기
        Element root4 = doc4.getRootElement();
        // System.out.println(root.getName()); // response

        // 루트의 자식들 중 body를 얻어낸다.
        // Element body = root.getChild("body");
        // Element items = body.getChild("items");// body의 자식들 중 이름이 items인 요소 검색

        // items안에 자식들 중 이름이 item인 요소들 모두를 List로 받아낸다.
        List<Element> list4 = root4.getChildren("list");

        // 위의 list 안에 있는 Element들을 ItemVO로 만들어서 배열로 저장해 둔다.

        // double userLatitude = Double.valueOf(lat);
        // double userLongitude = Double.valueOf(lon);

        WeatherVO wvo = null;

        // 현재 위치의 휴게소 날씨 API 구하기
        for (Element item : list4) {

            String unitName2 = item.getChildText("unitName");
            String unitCode2 = item.getChildText("unitCode");
            String weatherContents = item.getChildText("weatherContents");
            String tempValue = item.getChildText("tempValue");

            // System.out.println("현재 위치 휴게소 코드:" + vo.getUnitCode());
            // System.out.println("휴게소 날씨 코드" + unitCode2);
            if (vo.getUnitCode().trim().equals(unitCode2.trim())) {
                // System.out.println("현재위치의 휴게소:" + vo.getUnitCode());
                // System.out.println("날씨:" + unitCode2);
                wvo = new WeatherVO(unitName2, unitCode2, weatherContents, tempValue);
                map.put("unitName2", unitName2);
                map.put("unitCode2", unitCode2);
                map.put("weatherContents", weatherContents);
                map.put("tempValue", tempValue);

                break;
            }

        } // 복문의 끝

        FoodVO[] far = f_Service.all(vo.getUnitName());

        FoodVO[] pick_ar = new FoodVO[3];
        Set<FoodVO> set = new HashSet<>();
        while (true) {
            FoodVO fvo = far[(int) (Math.random() * far.length)];
            if (fvo == null)
                continue;

            int temp = (int) (Double.parseDouble(wvo.getTempValue()));

            if (temp >= 25 && fvo.getSeasonMenu().equals("S")) {
                set.add(fvo);
            } else if (temp < 25 && temp > 10 && fvo.getSeasonMenu().equals("4")) {
                set.add(fvo);
            } else if (temp <= 10 && fvo.getSeasonMenu().equals("W")) {
                set.add(fvo);
            }

            if (set.size() >= 3)
                break;
        }
        set.toArray(pick_ar);

        Float avg = r_sService.getScoreAvg(vo.getUnitName());
        if (avg == null)
            avg = (float) 0;

        ReviewVO[] review = r_sService.getRestReviewList(vo.getUnitName());

        int length = 0;
        if (review != null) {
            length = review.length;
        }

        map.put("review", length);
        map.put("avg", avg);
        map.put("far", pick_ar);

        return map;
    }

    private double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
        double earthRadius = 6371; // 지구 반지름 (단위: km)

        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);

        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                        Math.sin(dLon / 2) * Math.sin(dLon / 2);

        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        double distance = earthRadius * c * 1000; // 거리 계산 결과 (단위: m)

        return distance;
    }
}