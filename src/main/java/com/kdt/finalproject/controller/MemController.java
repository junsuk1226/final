package com.kdt.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@RequestMapping("")
	public ModelAndView all() {
		ModelAndView mv = new ModelAndView();

		MemVO[] ar = m_Service.all();

		mv.addObject("ar", ar);
		mv.setViewName("test");

		return mv;
	}
}