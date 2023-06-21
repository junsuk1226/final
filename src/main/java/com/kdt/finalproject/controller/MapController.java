package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.vo.MapInfoVO;
import com.kdt.finalproject.vo.MapVO;

@Controller
public class MapController {

    @RequestMapping("map")
    public String map() {
        return "map";
    }

    @RequestMapping("reqMap")
    @ResponseBody
    public Map<String, String> map(Double lat, Double lon) throws Exception {
        Map<String, String> map = new HashMap<>();

        String key = "2077960536";// 개인
                                  // 인증키
                                  // (Encoding)

        StringBuffer sb = new StringBuffer();
        sb.append("http://data.ex.co.kr/openapi/locationinfo/locationinfoRest"); // 호출할 경로
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