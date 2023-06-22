package com.kdt.finalproject.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.JoinService;
import com.kdt.finalproject.vo.MemVO;

// import jakarta.servlet.http.HttpSession;

@Controller
public class JoinController {

    @Autowired
    private JoinService j_Service;

    @Autowired
    private javax.servlet.http.HttpSession session;

    @RequestMapping("/join")
    public String init() {
        return "/join/join";
    }

    @RequestMapping("/kakao/join")
    public ModelAndView kakaoLogin(String code) {
        ModelAndView mv = new ModelAndView();

        String access_token = "";
        String refresh_token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        String status = "1";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            StringBuffer sb = new StringBuffer();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=c691b066d7c57c4085e1fa5fc3e2c47b");
            sb.append("&redirect_uri=http://localhost:8080/kakao/join");
            sb.append("&code=" + code);

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

            bw.write(sb.toString());
            bw.flush();

            int res_code = conn.getResponseCode();

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

                access_token = (String) json.get("access_token");
                refresh_token = (String) json.get("refresh_token");

                String apiURL = "https://kapi.kakao.com/v2/user/me";
                String header = "Bearer " + access_token;

                URL url2 = new URL(apiURL);
                HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();

                conn2.setRequestMethod("POST");
                conn2.setDoOutput(true);

                conn2.setRequestProperty("Authorization", header);

                res_code = conn2.getResponseCode();

                if (res_code == HttpURLConnection.HTTP_OK) {
                    BufferedReader br2 = new BufferedReader(new InputStreamReader(conn2.getInputStream(), "UTF-8"));

                    StringBuffer result2 = new StringBuffer();
                    String line2 = null;

                    while ((line2 = br2.readLine()) != null) {
                        result2.append(line2);
                    }

                    Object obj2 = jsonParser.parse(result2.toString());
                    JSONObject json2 = (JSONObject) obj2;
                    JSONObject props = (JSONObject) json2.get("properties");
                    String name = (String) props.get("nickname");

                    JSONObject kakao_acc = (JSONObject) json2.get("kakao_account");
                    String email = (String) kakao_acc.get("email");

                    MemVO vo = new MemVO();
                    vo.setM_name(name);
                    vo.setM_id(email);
                    vo.setAccess_token(access_token);
                    vo.setRefresh_token(refresh_token);
                    vo.setM_status(status);

                    Boolean chk = j_Service.check_email(vo);

                    if (chk == true) {
                        int cnt = j_Service.addMem(vo);
                    } else {
                        j_Service.updateToken(vo);
                    }

                    MemVO mvo = j_Service.getMem(vo);

                    session.setAttribute("mvo", mvo);
                    mv.setViewName("redirect:/tour");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }

    @RequestMapping("/naver/join")
    public ModelAndView naverLogin(String code, String state, String error, String error_description) {
        ModelAndView mv = new ModelAndView();

        String reqURL = "https://nid.naver.com/oauth2.0/token";
        String access_token = "";
        String refresh_token = "";
        String status = "2";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            StringBuffer sb = new StringBuffer();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=6BPvD8rTeGLnG7fdps1C");
            sb.append("&client_secret=xcqAzUEomv");
            sb.append("&code=" + code);
            sb.append("&state=" + state);

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            bw.write(sb.toString());
            bw.flush();

            int res_code = conn.getResponseCode();

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

                access_token = (String) json.get("access_token");
                refresh_token = (String) json.get("refresh_token");

                String apiURL = "https://openapi.naver.com/v1/nid/me";
                String header = "Bearer " + access_token;

                URL url2 = new URL(apiURL);

                HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();

                conn2.setRequestMethod("POST");
                conn2.setDoOutput(true);

                conn2.setRequestProperty("Authorization", header);

                res_code = conn2.getResponseCode();

                if (res_code == HttpURLConnection.HTTP_OK) {
                    BufferedReader br2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
                    StringBuffer result2 = new StringBuffer();
                    String line2 = null;

                    while ((line2 = br2.readLine()) != null) {
                        result2.append(line2);
                    }

                    Object obj2 = jsonParser.parse(result2.toString());
                    JSONObject json2 = (JSONObject) obj2;
                    JSONObject response = (JSONObject) json2.get("response");
                    String name = (String) response.get("nickname");
                    String email = (String) response.get("email");

                    MemVO vo = new MemVO();
                    vo.setM_name(name);
                    vo.setM_id(email);
                    vo.setAccess_token(access_token);
                    vo.setRefresh_token(refresh_token);
                    vo.setM_status(status);

                    Boolean chk = j_Service.check_email(vo);

                    if (chk == true) {

                        int cnt = j_Service.addMem(vo);

                    } else {

                        j_Service.updateToken(vo);
                    }

                    MemVO mvo = j_Service.getMem(vo);

                    session.setAttribute("mvo", mvo);
                    mv.setViewName("redirect:/tour");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }

    @PostMapping("/common/join")
    public ModelAndView commonJoin(String j_email, String j_password, String j_nickname, String j_confirmpassword) {
        ModelAndView mv = new ModelAndView();

        String email = j_email;
        String password = j_password;
        String name = j_nickname;
        String status = "0";

        MemVO vo = new MemVO();
        vo.setM_id(email);
        vo.setM_pw(password);
        vo.setM_name(name);
        vo.setM_status(status);

        Boolean chk = j_Service.check_email(vo);

        if (chk == true) {
            int cnt = j_Service.addMem(vo);
            mv.setViewName("redirect:/login");
        } else {
            session.setAttribute("commjoin_fail", "commjoin_fail");
            mv.setViewName("redirect:/join");
        }

        return mv;
    }

    @PostMapping("/join/checkid")
    @ResponseBody
    public Map<String, Object> check_id(String email) {
        boolean chk = j_Service.check_id(email);

        Map<String, Object> map = new HashMap<>();
        map.put("chk", chk);

        return map;
    }
}
