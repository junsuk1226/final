package com.kdt.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.MemService;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class MemController {

	@Autowired
	private MemService m_Service;

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

}