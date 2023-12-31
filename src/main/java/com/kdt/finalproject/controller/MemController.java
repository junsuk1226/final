package com.kdt.finalproject.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.JoinService;
import com.kdt.finalproject.service.MemLogService;
import com.kdt.finalproject.service.MemService;
import com.kdt.finalproject.util.Cart;
import com.kdt.finalproject.vo.MemLogVO;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class MemController {
	@Autowired
	private HttpSession session;

	@Autowired
	private MemService m_Service;

	@Autowired
	private JoinService j_Service;

	@Autowired
	private MemLogService memLogService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@RequestMapping("/login")
	public String login() {

		return "/login";
	}

	@RequestMapping("/logout")
	public String logout() {
		session.removeAttribute("mvo");
		return "redirect:/main";
	}

	@RequestMapping(value = "/reqLogin", method = RequestMethod.POST)
	public ModelAndView view(MemVO vo) {
		ModelAndView mv = new ModelAndView();

		if (vo != null) {
			MemVO mvo = m_Service.ml_login(vo);
			if (mvo != null) {
				session.setAttribute("mvo", mvo);
				Cart cart = new Cart();
				session.setAttribute("cart", cart);
				mv.setViewName("/main");
			} else {
				mv.setViewName("/login");
				mv.addObject("alat", "alat");
			}
		} else {
			mv.setViewName("/login");
			mv.addObject("alat", "alat");
		}
		return mv;
	}

	@PostMapping("/myPage/changeInfo")
	@ResponseBody
	public Map<String, String> changeInfo(MemVO vo) {
		Map<String, String> map = new HashMap<>();

		// 로그인한 사용자의 정보를 세션에서 얻어온다.

		Object obj = session.getAttribute("mvo");
		if (obj != null) {
			MemVO mvo = (MemVO) obj;
			vo.setM_idx(mvo.getM_idx());

			int cnt = m_Service.updateMem(vo, mvo);

			if (cnt > 0) {
				// 세션에 있는 정보도 수정해 줘야 한다.
				mvo.setM_name(vo.getM_name());
				mvo.setM_phone(vo.getM_phone());

				vo = j_Service.getMem(mvo);
				if (vo != null) {
					MemLogVO mlvo = new MemLogVO();
					mlvo.setM_idx(vo.getM_idx());
					mlvo.setM_id(vo.getM_id());
					mlvo.setM_pw(vo.getM_pw());
					mlvo.setM_name(vo.getM_name());
					mlvo.setM_status(vo.getM_status());
					mlvo.setAccess_token(vo.getAccess_token());
					mlvo.setRefresh_token(vo.getRefresh_token());
					mlvo.setM_phone(vo.getM_phone());
					mlvo.setEditor("M");
					mlvo.setMl_information("개인정보수정");

					memLogService.join_log(mlvo);
				}
			}

			map.put("updateMem_fail", String.valueOf(cnt));
		}
		return map;
	}

	@PostMapping("/myPage/changePw")
	@ResponseBody
	public Map<String, String> changePw(MemVO vo) {
		// ModelAndView mv = new ModelAndView();
		Map<String, String> map = new HashMap<>();

		// 로그인한 사용자의 정보를 세션에서 얻어온다.
		Object obj = session.getAttribute("mvo");

		if (obj != null) {
			// mvo에 m_idx값을 저장해야 한다.
			MemVO mvo = (MemVO) obj;
			vo.setM_idx(mvo.getM_idx());

			int cnt = m_Service.updatePw(vo, mvo);
			if (cnt > 0) {
				// 세션에 있는 정보도 수정해 줘야 한다.
				// mvo.setM_pw(vo.getNew_pw());

				mvo = j_Service.getMem(mvo);
				if (mvo != null) {
					MemLogVO mlvo = new MemLogVO();
					mlvo.setM_idx(mvo.getM_idx());
					mlvo.setM_id(mvo.getM_id());
					mlvo.setM_pw(mvo.getM_pw());
					mlvo.setM_name(mvo.getM_name());
					mlvo.setM_status(mvo.getM_status());
					mlvo.setAccess_token(mvo.getAccess_token());
					mlvo.setRefresh_token(mvo.getRefresh_token());
					mlvo.setM_phone(mvo.getM_phone());
					mlvo.setEditor("M");
					mlvo.setMl_information("비밀번호변경");

					memLogService.join_log(mlvo);
				}
			}

			map.put("updatePw_fail", String.valueOf(cnt));

		}
		return map;
	}

	@RequestMapping("/kakao/login")
	public ModelAndView kakaoLogin(String code) {
		ModelAndView mv = new ModelAndView();

		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			StringBuffer sb = new StringBuffer();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=86232d0bde1862adbc69b920971724cc");
			sb.append("&redirect_uri=https://rest.o-r.kr/kakao/login");
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
					System.out.println("line2" + line2);

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
					vo.setM_pw("0000");
					vo.setAccess_token(access_token);
					vo.setRefresh_token(refresh_token);

					Boolean chk = j_Service.check_email(vo);
					System.out.println("chk" + chk);
					if (chk == true) {
						int cnt = j_Service.addkakao(vo);
					} else {
						j_Service.updateToken(vo);
					}

					MemVO mvo = j_Service.getMem(vo);

					session.setAttribute("mvo", mvo);
					Cart cart = new Cart();
					session.setAttribute("cart", cart);
					mv.setViewName("redirect:/main");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/naver/login")
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
			sb.append("&client_id=py8uuUtaAKsCCxoOKiY3");
			sb.append("&client_secret=iSXwl3_nLz");
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
					Cart cart = new Cart();
					session.setAttribute("cart", cart);
					mv.setViewName("redirect:/main");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}