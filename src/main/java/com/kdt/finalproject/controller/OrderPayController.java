package com.kdt.finalproject.controller;

import java.awt.print.PrinterException;
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
    public ModelAndView orderPay()
            throws Exception {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("orderpay");

        return mv;
    }

    @RequestMapping("/kakao/pay") // 음식숫자 DB 만들어야 함.
    public ModelAndView kakaoPay(String sumPrice, String[] foodNm, String[] foodQn,
            String[] ggetfoodCost, String m_idx, String restNm, String[] seq) {
        ModelAndView mv = new ModelAndView();

        // 음식명
        String[] getfoodNm = foodNm;
        StringBuffer foodNmsb = new StringBuffer();
        for (String str : getfoodNm) {
            foodNmsb.append(str + "/");
        }

        foodNmsb.setLength(foodNmsb.length() - 1);
        // System.out.println(foodNmsb.toString());

        // 음식숫자
        String[] getfoodQn = foodQn;
        StringBuffer foodQnsb = new StringBuffer();
        for (String str : getfoodQn) {
            foodQnsb.append(str + "/");
        }

        foodQnsb.setLength(foodQnsb.length() - 1);
        // System.out.println(foodQnsb.toString());

        // quantity값이 int라 배열의 문자열은 넣을 수 없음. 첫번쨰 수량만 대표로 넣는다.
        int foonQn = Integer.valueOf(getfoodQn[0]);
        // System.out.println(foonQn);

        // 음식개별 가격
        String[] getfoodCost = ggetfoodCost;
        StringBuffer foodCostsb = new StringBuffer();
        for (String str : getfoodCost) {
            foodCostsb.append(str + "/");
        }

        foodCostsb.setLength(foodCostsb.length() - 1);
        // System.out.println(foodCostsb.toString());

        // 음식 코드
        String[] getseq = seq;
        StringBuffer seqsb = new StringBuffer();
        for (String str : getseq) {
            seqsb.append(str + "/");
        }

        seqsb.setLength(seqsb.length() - 1);
        // System.out.println(seqsb.toString());

        String getm_idx = m_idx;
        String getrestNm = restNm;
        // System.out.println(getm_idx);
        // System.out.println(getrestNm);

        String reqURL = "https://kapi.kakao.com/v1/payment/ready";
        String adminkey = "22c4183a06a4812b3265f8971a5fed6e"; // Admin key(kakaodeveloper에서 확인)
        String cid = "TC0ONETIME"; // 테스트용 가맹점 코드

        // 가맹점 주문번호 생성 시작
        Random rnd = new Random();
        StringBuffer sb2 = new StringBuffer();

        for (int i = 0; i < 48; i++) {
            if (rnd.nextBoolean()) {
                sb2.append((char) ((int) (rnd.nextInt(26)) + 97));
            } else {
                sb2.append((rnd.nextInt(10)));
            }
        }
        // 가맹점 주문번호 생성 끝

        String partner_order_id = sb2.toString(); // 가맹점 주문번호
        String partner_user_id = "restCd"; // 가맹점 회원 id(휴게소코드)---------값 받기 넘겨주세요.
        String item_name = foodNmsb.toString(); // 상품명
        int quantity = foonQn; // 상품 수량
        String foodQnTotal = foodQnsb.toString(); // 상품 개별 수량
        String foodCost = foodCostsb.toString(); // 상품 개별 가격
        String total_amount = sumPrice; // 상품 총액
        String tax_free_amount = "0"; // 상품 비과세 금액-----모르겠다.
        String approval_url = "http://localhost:8080/kakaopayment/success"; // 결제 성공 시 redirect url
        String cancel_url = "http://localhost:8080/kakaopayment/cancel"; // 결제 취소 시 redirect url
        String fail_url = "http://localhost:8080/kakaopayment/fail"; // 결제 실패 시 redirect url
        String header = "KakaoAK " + adminkey;
        String tid = "";
        String next_redirect_mobile_url = "";
        String next_redirect_pc_url = "";
        String created_at = "";
        String ggetseq = seqsb.toString();

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Authorization", header);
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

            StringBuffer sb = new StringBuffer();
            sb.append("cid=" + cid);
            sb.append("&partner_order_id=" + partner_order_id);
            sb.append("&partner_user_id=" + partner_user_id);
            sb.append("&item_name=" + URLEncoder.encode(item_name, "UTF-8"));
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
                dto.setM_idx(getm_idx);
                dto.setFoonNm(item_name);
                dto.setFoodCost(foodCost);
                dto.setRestNm(getrestNm);
                dto.setFoodQnTotal(foodQnTotal);
                dto.setSeq(ggetseq);
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

                // System.out.println(dto.getFoodCost());
                PayVO vo = new PayVO();
                vo.setM_idx(dto.getM_idx());
                vo.setRestNm(dto.getRestNm());
                vo.setFoodNm(dto.getFoonNm());
                vo.setFoodCost(dto.getFoodCost());
                vo.setFoodQn(dto.getFoodQnTotal());

                vo.setP_date(p_date);
                vo.setP_time(p_time);
                vo.setAid(aid);
                vo.setTid(tid);
                vo.setCid(cid);
                vo.setTotalCost(amount);
                vo.setP_oderId(partner_order_id);
                vo.setSeq(dto.getSeq());
                // System.out.println(sb2.toString());

                String poNum_count = String.format("%04d", p_Service.poNum_count(vo) + 1); // vo.setRestNm();
                vo.setP_oNum(poNum_count);

                int cnt = p_Service.kakaopay(vo);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        PayVO pvo = p_Service.order_receipt(partner_order_id);

        // 음식 이름 배열
        String[] foodname = pvo.getFoodNm().split("/");

        // 음식 수량 배열
        String[] foodqnt = pvo.getFoodQn().split("/");

        mv.addObject("pvo", pvo);
        mv.addObject("foodname", foodname);
        mv.addObject("foodqnt", foodqnt);
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

    @RequestMapping("/kakaopayment/refund")
    public ModelAndView kakaopaymentRefund(PayVO payvo) {
        ModelAndView mv = new ModelAndView();

        String reqURL = "https://kapi.kakao.com/v1/payment/cancel";
        String adminkey = "22c4183a06a4812b3265f8971a5fed6e"; // Admin key(kakaodeveloper에서 확인)
        System.out.println(payvo.getTid());
        String tid = payvo.getTid(); // 결제 고유번호-----DB셀렉(리스트 선택 값 받고 검색)

        PayVO pvo = p_Service.kakao_refunt_select(tid);

        String cid = pvo.getCid(); // 테스트용 가맹점 코드
        int cancel_amount = pvo.getTotalCost(); // 결제 총액
        int cancel_tax_free_amount = 0; // 상품 비과세 금액-----모르겠다.
        String header = "KakaoAK " + adminkey;
        String canceled_at = "";

        // System.out.println(cid);
        // System.out.println(cancel_amount);

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Authorization", header);
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

            StringBuffer sb = new StringBuffer();
            sb.append("cid=" + cid);
            sb.append("&tid=" + tid);
            sb.append("&cancel_amount=" + cancel_amount);
            sb.append("&cancel_tax_free_amount=" + cancel_tax_free_amount);

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
                // System.out.println(json);

                canceled_at = (String) json.get("canceled_at");
                // System.out.println(canceled_at);

                String canceldatetime[] = canceled_at.split("T");
                String c_date = canceldatetime[0];
                String c_time = canceldatetime[1];
                // System.out.println(c_date);
                // System.out.println(c_time);

                PayVO vo = new PayVO();
                vo.setC_date(c_date);
                vo.setC_time(c_time);
                vo.setTid(tid);

                int cnt = p_Service.kakaorefund(vo);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        mv.setViewName("redirect:/admin/orderlist");

        return mv;
    }

    @RequestMapping("/toss/pay")
    public ModelAndView tossPay(String sumPrice, String[] foodNm, String[] foodQn,
            String[] ggetfoodCost, String m_idx, String restNm, String[] seq) {
        ModelAndView mv = new ModelAndView();

        // 음식명
        String[] getfoodNm = foodNm;
        StringBuffer foodNmsb = new StringBuffer();
        for (String str : getfoodNm) {
            foodNmsb.append(str + "/");
        }

        foodNmsb.setLength(foodNmsb.length() - 1);
        // System.out.println(foodNmsb.toString());

        // 음식숫자
        String[] getfoodQn = foodQn;
        StringBuffer foodQnsb = new StringBuffer();
        for (String str : getfoodQn) {
            foodQnsb.append(str + "/");
        }

        foodQnsb.setLength(foodQnsb.length() - 1);
        // System.out.println(foodQnsb.toString());

        // 음식개별 가격
        String[] getfoodCost = ggetfoodCost;
        StringBuffer foodCostsb = new StringBuffer();
        for (String str : getfoodCost) {
            foodCostsb.append(str + "/");
        }

        foodCostsb.setLength(foodCostsb.length() - 1);
        // System.out.println(foodCostsb.toString());

        // 음식 코드
        String[] getseq = seq;
        StringBuffer seqsb = new StringBuffer();
        for (String str : getseq) {
            seqsb.append(str + "/");
        }

        seqsb.setLength(seqsb.length() - 1);
        // System.out.println(seqsb.toString());

        String getm_idx = m_idx;
        String getrestNm = restNm;
        String getsumPrice = sumPrice;
        String ggetseq = seqsb.toString();
        // System.out.println(getm_idx);
        // System.out.println(getrestNm);
        // System.out.println(getsumPrice);

        Random rnd = new Random();
        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < 48; i++) {
            if (rnd.nextBoolean()) {
                sb.append((char) ((int) (rnd.nextInt(26)) + 97));
            } else {
                sb.append((rnd.nextInt(10)));
            }
        }

        dto.setM_idx(getm_idx);
        dto.setFoonNm(foodNmsb.toString());
        dto.setFoodCost(foodCostsb.toString());
        dto.setRestNm(getrestNm);
        dto.setFoodQnTotal(getsumPrice);
        dto.setFoodCost(foodCostsb.toString());
        dto.setFoodQnTotal(foodQnsb.toString());
        dto.setSeq(ggetseq);

        mv.addObject("orderId", sb.toString());
        mv.addObject("foodNm", foodNmsb.toString());
        mv.addObject("sumPrice", getsumPrice);
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
        int totalAmount = 0;

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
                aid = (String) json.get("lastTransactionKey");
                tid = (String) json.get("paymentKey");
                totalAmount = Integer.parseInt(String.valueOf(json.get("totalAmount")));

                String subapproved_at = approved_at.substring(0, approved_at.lastIndexOf("+"));
                String datetime[] = subapproved_at.split("T");
                String p_date = datetime[0];
                String p_time = datetime[1];

                PayVO vo = new PayVO();
                vo.setM_idx(dto.getM_idx());
                // vo.setRestCd();
                vo.setRestNm(dto.getRestNm());
                vo.setFoodNm(dto.getFoonNm());
                vo.setFoodCost(dto.getFoodCost());
                vo.setTotalCost(totalAmount);
                vo.setFoodCost(dto.getFoodCost());
                vo.setFoodQn(dto.getFoodQnTotal());

                vo.setP_date(p_date);
                vo.setP_time(p_time);
                vo.setAid(aid);
                vo.setTid(tid);
                vo.setP_oderId(getorderId);
                vo.setSeq(dto.getSeq());

                String poNum_count = String.format("%04d", p_Service.poNum_count(vo) + 1); // vo.setRestNm();
                vo.setP_oNum(poNum_count);

                int cnt = p_Service.tosspay(vo);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        PayVO pvo = p_Service.order_receipt(getorderId);

        // 음식 이름 배열
        String[] foodname = pvo.getFoodNm().split("/");

        // 음식 수량 배열
        String[] foodqnt = pvo.getFoodQn().split("/");

        mv.addObject("pvo", pvo);
        mv.addObject("foodname", foodname);
        mv.addObject("foodqnt", foodqnt);
        mv.setViewName("/orderpaycomplete");

        return mv;
    }

    @RequestMapping("/tosspayment/refund")
    public ModelAndView tosspaymentRefund(PayVO pvo) {
        ModelAndView mv = new ModelAndView();

        String reqURL = "https://api.tosspayments.com/v1/payments/";
        String paymentkey = pvo.getTid(); // 결제 고유번호-DB셀렉(리스트 선택 값 받고 검색) tid에
                                          // 저장되어 있음.
        String secretKey = "test_sk_lpP2YxJ4K870lAdMDkJ3RGZwXLOb:"; // toss 시크릿 키
        String cancelReason = "변심";// 그냥 고정값으로 해둠. 필수값
        String approved_at = "";

        try {
            Encoder encoder = Base64.getEncoder();
            byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
            String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);

            URL url = new URL(reqURL + paymentkey + "/cancel");

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestProperty("Authorization", authorizations);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);

            JSONObject jobj = new JSONObject();
            jobj.put("cancelReason", cancelReason);

            OutputStream outputStream = connection.getOutputStream();
            outputStream.write(jobj.toString().getBytes("UTF-8"));

            int res_code = connection.getResponseCode();
            // System.out.println(res_code);

            if (res_code == HttpURLConnection.HTTP_OK) {
                BufferedReader br = new BufferedReader(
                        new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8));
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
                String c_date = datetime[0];
                String c_time = datetime[1];

                PayVO vo = new PayVO();
                vo.setC_date(c_date);
                vo.setC_time(c_time);
                vo.setTid(paymentkey);

                int cnt = p_Service.kakaorefund(vo);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        mv.setViewName("redirect:/orderpay");

        return mv;
    }

}
