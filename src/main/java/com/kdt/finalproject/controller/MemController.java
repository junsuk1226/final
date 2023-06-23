package com.kdt.finalproject.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.JoinService;
import com.kdt.finalproject.service.MemService;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class MemController {
	@Autowired
	private HttpSession session;

	@Autowired
	private MemService m_Service;

	@Autowired
	private JoinService j_Service;

	@RequestMapping("/login")
	public String login() {

		return "/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView view(String m_id, String m_pw) {
		ModelAndView mv = new ModelAndView();
		MemVO vo = m_Service.ml_login(m_id, m_pw);
		System.out.println(m_id);
		System.out.println(m_pw);
		mv.setViewName("/main");
		return mv;
	}

	/*
	 * @RequestMapping("/naver/login")
	 * public ModelAndView naverLogin(String code, String state, String error,
	 * String error_description) {
	 * ModelAndView mv = new ModelAndView();
	 * 
	 * String reqURL = "https://nid.naver.com/oauth2.0/token";
	 * String access_token = "";
	 * String refresh_token = "";
	 * String status = "2";
	 * 
	 * try {
	 * URL url = new URL(reqURL);
	 * HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	 * conn.setRequestMethod("POST");
	 * conn.setDoOutput(true);
	 * 
	 * StringBuffer sb = new StringBuffer();
	 * sb.append("grant_type=authorization_code");
	 * sb.append("&client_id=6BPvD8rTeGLnG7fdps1C");
	 * sb.append("&client_secret=xcqAzUEomv");
	 * sb.append("&code=" + code);
	 * sb.append("&state=" + state);
	 * 
	 * BufferedWriter bw = new BufferedWriter(new
	 * OutputStreamWriter(conn.getOutputStream()));
	 * bw.write(sb.toString());
	 * bw.flush();
	 * 
	 * int res_code = conn.getResponseCode();
	 * 
	 * if (res_code == HttpURLConnection.HTTP_OK) {
	 * BufferedReader br = new BufferedReader(new
	 * InputStreamReader(conn.getInputStream()));
	 * StringBuffer result = new StringBuffer();
	 * String line = null;
	 * 
	 * while ((line = br.readLine()) != null) {
	 * result.append(line);
	 * }
	 * 
	 * JSONParser jsonParser = new JSONParser();
	 * 
	 * Object obj = jsonParser.parse(result.toString());
	 * JSONObject json = (JSONObject) obj;
	 * 
	 * access_token = (String) json.get("access_token");
	 * refresh_token = (String) json.get("refresh_token");
	 * 
	 * String apiURL = "https://openapi.naver.com/v1/nid/me";
	 * String header = "Bearer " + access_token;
	 * 
	 * URL url2 = new URL(apiURL);
	 * 
	 * HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
	 * 
	 * conn2.setRequestMethod("POST");
	 * conn2.setDoOutput(true);
	 * 
	 * conn2.setRequestProperty("Authorization", header);
	 * 
	 * res_code = conn2.getResponseCode();
	 * 
	 * if (res_code == HttpURLConnection.HTTP_OK) {
	 * BufferedReader br2 = new BufferedReader(new
	 * InputStreamReader(conn2.getInputStream()));
	 * StringBuffer result2 = new StringBuffer();
	 * String line2 = null;
	 * 
	 * while ((line2 = br2.readLine()) != null) {
	 * result2.append(line2);
	 * }
	 * 
	 * Object obj2 = jsonParser.parse(result2.toString());
	 * JSONObject json2 = (JSONObject) obj2;
	 * JSONObject response = (JSONObject) json2.get("response");
	 * String nickname = (String) response.get("nickname");
	 * // String profile_image = (String) response.get("profile_image");
	 * String m_id = (String) response.get("m_id");
	 * 
	 * MemVO vo = new MemVO();
	 * vo.setM_name(nickname);
	 * // vo.setProfile_image(profile_image);
	 * vo.setM_id(m_id);
	 * vo.setAccess_token(access_token);
	 * vo.setRefresh_token(refresh_token);
	 * vo.setM_status(status);
	 * 
	 * Boolean chk = j_Service.check_email(vo);
	 * 
	 * if (chk == true) {
	 * 
	 * int cnt = j_Service.addMem(vo);
	 * 
	 * } else {
	 * 
	 * j_Service.updateToken(vo);
	 * }
	 * 
	 * MemVO mvo = j_Service.getMem(vo);
	 * 
	 * session.setAttribute("mvo", mvo);
	 * mv.setViewName("redirect:/main");
	 * }
	 * }
	 * } catch (Exception e) {
	 * e.printStackTrace();
	 * }
	 * return mv;
	 * }
	 */
}