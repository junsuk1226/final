package com.kdt.finalproject.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Random;
import java.util.Base64.Encoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.PayService;
import com.kdt.finalproject.vo.KakaoReadyResponseDTO;
import com.kdt.finalproject.vo.PayVO;

@Controller
public class OrderPayController {
    KakaoReadyResponseDTO dto = new KakaoReadyResponseDTO();

    @Autowired
    private PayService p_Service;

    @RequestMapping("/orderpay")
    public ModelAndView orderPay() {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("orderpay");
        return mv;
    }

    @RequestMapping("/kakao/pay")
    public ModelAndView kakaoPay() {
        ModelAndView mv = new ModelAndView();

        String reqURL = "https://kapi.kakao.com/v1/payment/ready";
        String adminkey = "22c4183a06a4812b3265f8971a5fed6e"; // Admin key(kakaodeveloper에서 확인)
        String cid = "TC0ONETIME"; // 테스트용 가맹점 코드
        String partner_order_id = "1001"; // 가맹점 주문번호---------값 받기
        String partner_user_id = "hahaha"; // 가맹점 회원 id(휴게소코드)---------값 받기
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
    public ModelAndView kakaopaymentSuccess(@RequestParam("pg_token") String pgToken) {
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
        String approved_at = ""; // 결제 승인 시각(넘어올때 "approved_at":"2023-06-27T16:39:23" T를 기준으로 쪼개 넣어야 할 듯.)
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

                // System.out.println(aid);
                // System.out.println(tid);
                // System.out.println(cid);
                // System.out.println(partner_order_id);
                // System.out.println(partner_user_id);
                // System.out.println(approved_at);
                // System.out.println(amount);

                String datetime[] = approved_at.split("T");
                String p_date = datetime[0];
                String p_time = datetime[1];
                // System.out.println(p_date);
                // System.out.println(p_time);

                Random rnd = new Random();
                StringBuffer sb2 = new StringBuffer();

                for (int i = 0; i < 48; i++) {
                    if (rnd.nextBoolean()) {
                        sb2.append((char) ((int) (rnd.nextInt(26)) + 97));
                    } else {
                        sb2.append((rnd.nextInt(10)));
                    }
                }

                PayVO vo = new PayVO();
                // vo.setM_idx();
                // vo.setRestCd();
                // vo.setRestNm();
                // vo.setFoodNm();
                // vo.setFoodCost();
                // vo.setFoodNm();

                vo.setP_date(p_date);
                vo.setP_time(p_time);
                vo.setAid(aid);
                vo.setTid(tid);
                vo.setCid(cid);
                vo.setTotalCost(amount);
                vo.setP_oderId(sb2.toString());
                // System.out.println(sb2.toString());

                String poNum_count = String.format("%04d", p_Service.poNum_count(vo) + 1); // vo.setRestNm();
                vo.setP_oNum("RestCd" + "_" + poNum_count);

                int cnt = p_Service.kakaopay(vo);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        mv.setViewName("orderpaycomplete");

        return mv;
    }

    @RequestMapping("/kakaopayment/cancel")
    public ModelAndView kakaopaymentCancel() {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("redirect:/orderpay");

        return mv;
    }

    @RequestMapping("/kakaopayment/fail")
    public ModelAndView kakaopaymentFail() {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("redirect:/orderpay");

        return mv;
    }

    @RequestMapping("/toss/pay")
    public ModelAndView tossPay() {
        ModelAndView mv = new ModelAndView();

        Random rnd = new Random();
        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < 48; i++) {
            if (rnd.nextBoolean()) {
                sb.append((char) ((int) (rnd.nextInt(26)) + 97));
            } else {
                sb.append((rnd.nextInt(10)));
            }
        }
        // System.out.println(sb.toString());
        mv.addObject("orderId", sb.toString());
        mv.setViewName("/tosspay");

        return mv;
    }

    @RequestMapping("tosspayment/success")
    public ModelAndView tosspaymentSuccess(String paymentKey, String orderId, String amount, String paymentType) {
        ModelAndView mv = new ModelAndView();

        String getpaymentKey = ""; // 결제 키값(tid)
        String getorderId = orderId; // 주문건 ID
        String getamount = amount; // 최종 금액
        String getpaymentType = paymentType; // 결제 유형
        String reqURL = "https://api.tosspayments.com/v1/payments/confirm"; // 결제 승인 URL
        String secretKey = "test_sk_lpP2YxJ4K870lAdMDkJ3RGZwXLOb:"; // toss 시크릿 키
        String aid = "";
        String tid = "";
        String approved_at = "";

        try {
            Encoder encoder = Base64.getEncoder();
            byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
            String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);
            getpaymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);

            // System.out.println(getpaymentKey); //
            // k0A2Ga1QqXjExPeJWYVQOJ0monE0zj849R5gvNLdzZwO6oKl
            // System.out.println(getorderId); // 10_0005
            // System.out.println(getamount); // 1000000
            // System.out.println(getpaymentType); // NORMAL
            // System.out.println(authorizations);

            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Authorization", authorizations);
            conn.setRequestProperty("Content-Type", "application/json");

            JSONObject jobj = new JSONObject();
            jobj.put("paymentKey", getpaymentKey);
            jobj.put("orderId", getorderId);
            jobj.put("amount", getamount);

            OutputStream outputStream = conn.getOutputStream();
            outputStream.write(jobj.toString().getBytes("UTF-8"));

            int res_code = conn.getResponseCode();
            // System.out.println(res_code);

            if (res_code == HttpURLConnection.HTTP_OK) {
                BufferedReader br = new BufferedReader(
                        new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
                StringBuffer result = new StringBuffer();
                String line = null;

                while ((line = br.readLine()) != null) {
                    result.append(line);
                }

                JSONParser jsonParser = new JSONParser();

                Object obj = jsonParser.parse(result.toString());
                JSONObject json = (JSONObject) obj;
                // System.out.println(json);

                approved_at = (String) json.get("approvedAt");

                String subapproved_at = approved_at.substring(0, approved_at.lastIndexOf("+"));
                String datetime[] = subapproved_at.split("T");
                String p_date = datetime[0];
                String p_time = datetime[1];

                aid = (String) json.get("lastTransactionKey");
                tid = (String) json.get("paymentKey");
                int totalCost = Integer.parseInt(String.valueOf(json.get("totalAmount")));

                // System.out.println(p_date);
                // System.out.println(p_time);
                // System.out.println(aid);
                // System.out.println(tid);
                // System.out.println(totalCost);

                PayVO vo = new PayVO();
                // vo.setM_idx();
                // vo.setRestCd();
                // vo.setRestNm();
                // vo.setFoodNm();
                // vo.setFoodCost();
                // vo.setFoodNm();

                vo.setP_date(p_date);
                vo.setP_time(p_time);
                vo.setAid(aid);
                vo.setTid(tid);
                vo.setTotalCost(totalCost);
                vo.setP_oderId(getorderId);

                String poNum_count = String.format("%04d", p_Service.poNum_count(vo) + 1); // vo.setRestNm(); 체크
                vo.setP_oNum("RestCd" + "_" + poNum_count);

                int cnt = p_Service.tosspay(vo);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        mv.setViewName("/orderpaycomplete");

        return mv;
    }

}
