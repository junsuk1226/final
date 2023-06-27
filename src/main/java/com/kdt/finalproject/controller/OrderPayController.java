package com.kdt.finalproject.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.vo.KakaoReadyResponseDTO;

@Controller
public class OrderPayController {
    KakaoReadyResponseDTO dto = new KakaoReadyResponseDTO();

    @RequestMapping("/orderpay")
    public ModelAndView orderPay() {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("orderpay");
        return mv;
    }

    @RequestMapping("/orderpaycomplete")
    public ModelAndView orderpaycomplete() {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("orderpaycomplete");
        return mv;
    }

    @RequestMapping("/kakao/pay")
    public ModelAndView kakaoPay() {
        ModelAndView mv = new ModelAndView();
        // 받아야 할 것들. (회원정보(m_idx) 구매정보(음식명, 수량, 가격, 총가격, 휴게소명))

        String reqURL = "https://kapi.kakao.com/v1/payment/ready";
        String adminkey = "22c4183a06a4812b3265f8971a5fed6e"; // Admin key(kakaodeveloper에서 확인)
        String cid = "TC0ONETIME"; // 테스트용 가맹점 코드
        String partner_order_id = "1001"; // 가맹점 주문번호---------값 받기
        String partner_user_id = "hahaha"; // 가맹점 회원 id---------값 받기
        String item_name = "choco"; // 상품명---------값 받기
        String quantity = "2"; // 상품 수량---------값 받기
        String total_amount = "2100"; // 상품 총액---------값 받기
        String tax_free_amount = "0"; // 상품 비과세 금액-----모르겠다.
        String approval_url = "http://localhost:8080/kakaopayment/success"; // 결제 성공 시 redirect url
        String cancel_url = "http://localhost:8080/kakaopayment/cancel"; // 결제 취소 시 redirect url
        String fail_url = "http://localhost:8080/kakaopayment/fail"; // 결제 실패 시 redirect url
        String header = "KakaoAK " + adminkey;
        String tid = "";
        String next_redirect_mobile_url = "";
        String next_redirect_pc_url = "";
        String created_at = "";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Authorization", header);

            StringBuffer sb = new StringBuffer();
            sb.append("cid=" + cid);
            sb.append("&partner_order_id=" + partner_order_id);
            sb.append("&partner_user_id=" + partner_user_id);
            sb.append("&item_name=" + item_name);
            sb.append("&quantity=" + quantity);
            sb.append("&total_amount=" + total_amount);
            sb.append("&tax_free_amount=" + tax_free_amount);
            sb.append("&approval_url=" + approval_url);
            sb.append("&cancel_url=" + cancel_url);
            sb.append("&fail_url=" + fail_url);

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

            bw.write(sb.toString());
            // System.out.println(sb.toString());
            bw.flush();

            int res_code = conn.getResponseCode();
            // System.out.println(res_code);

            if (res_code == HttpURLConnection.HTTP_OK) {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuffer result = new StringBuffer();
                String line = null;

                while ((line = br.readLine()) != null) {
                    result.append(line);
                }

                JSONParser jsonParser = new JSONParser();

                Object obj = jsonParser.parse(result.toString());
                JSONObject json = (JSONObject) obj;

                tid = (String) json.get("tid");
                next_redirect_mobile_url = (String) json.get("next_redirect_mobile_url");
                next_redirect_pc_url = (String) json.get("next_redirect_pc_url");
                created_at = (String) json.get("created_at");
                // System.out.println(tid);
                // System.out.println(next_redirect_mobile_url);
                // System.out.println(next_redirect_pc_url);
                // System.out.println(created_at);

                dto.setTid(tid);
                dto.setNext_redirect_mobile_url(next_redirect_mobile_url);
                dto.setNext_redirect_pc_url(next_redirect_pc_url);
                dto.setCreated_at(created_at);
                dto.setPartner_order_id(partner_order_id);
                dto.setPartner_user_id(partner_user_id);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        mv.setViewName("redirect:" + dto.getNext_redirect_pc_url());

        return mv;
    }

    @RequestMapping("/kakaopayment/success")
    public ModelAndView paymentSuccess(@RequestParam("pg_token") String pgToken) {
        ModelAndView mv = new ModelAndView();

        String reqURL = "https://kapi.kakao.com/v1/payment/approve";
        String adminkey = "22c4183a06a4812b3265f8971a5fed6e"; // Admin key(kakaodeveloper에서 확인)
        String cid = "TC0ONETIME"; // 테스트용 가맹점 코드
        String tid = dto.getTid(); // 결제 고유번호
        String partner_order_id = dto.getPartner_order_id(); // 가맹점 주문번호
        String partner_user_id = dto.getPartner_user_id(); // 가맹점 회원 id
        String pg_token = pgToken; // 결제승인 요청 인증 토큰
        String header = "KakaoAK " + adminkey;

        String aid = ""; // 요청 고유 번호
        int amount = 0; // 결제 금액
        String approved_at = ""; // 결제 승인 시각(넘어올때 "approved_at":"2023-06-27T16:39:23")
        // System.out.println(pg_token);
        // System.out.println(dto.getTid());

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Authorization", header);

            StringBuffer sb = new StringBuffer();
            sb.append("cid=" + cid);
            sb.append("&tid=" + tid);
            sb.append("&partner_order_id=" + partner_order_id);
            sb.append("&partner_user_id=" + partner_user_id);
            sb.append("&pg_token=" + pg_token);

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

            bw.write(sb.toString());
            // System.out.println(sb.toString());
            bw.flush();

            int res_code = conn.getResponseCode();
            // System.out.println(res_code);

            if (res_code == HttpURLConnection.HTTP_OK) {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuffer result = new StringBuffer();
                String line = null;

                while ((line = br.readLine()) != null) {
                    result.append(line);
                }

                JSONParser jsonParser = new JSONParser();

                Object obj = jsonParser.parse(result.toString());
                JSONObject json = (JSONObject) obj;
                JSONObject amountjson = (JSONObject) json.get("amount");
                // System.out.println(amountjson);

                aid = (String) json.get("aid");
                tid = (String) json.get("tid");
                cid = (String) json.get("cid");
                partner_order_id = (String) json.get("partner_order_id");
                partner_user_id = (String) json.get("partner_user_id");
                approved_at = (String) json.get("approved_at");
                amount = Integer.parseInt(String.valueOf(amountjson.get("total")));

                System.out.println(aid);
                System.out.println(tid);
                System.out.println(cid);
                System.out.println(partner_order_id);
                System.out.println(partner_user_id);
                System.out.println(approved_at);
                System.out.println(amount);

                // db저장, 그리고
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        mv.setViewName("redirect:/orderpaycomplete");

        return mv;
    }

    @RequestMapping("/payment/cancel")
    public ModelAndView paymentCancel() {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("orderpay");

        return mv;
    }

    @RequestMapping("/payment/fail")
    public ModelAndView paymentFail() {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("orderpayfail");

        return mv;
    }

}
