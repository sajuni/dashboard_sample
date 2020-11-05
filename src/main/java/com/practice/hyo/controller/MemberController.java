package com.practice.hyo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.practice.hyo.domain.MemberVO;
import com.practice.hyo.service.MemberService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequestMapping("/member/*")
@Controller
public class MemberController{

	@Autowired
	private MemberService mService;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() {
		log.info("register get......");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(@RequestBody MemberVO mem, Model model) throws Exception {

		log.info("register post....");
		mService.regist(mem);
		
		model.addAttribute("result", "success");
		
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String  loginGET() {
		
		return "/member/login";
	}
	 
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(@RequestBody MemberVO mem, RedirectAttributes rttr) {
		String userid = mem.getUserid();
		String userpw = mem.getUserpw();
		System.out.println("테스트 : " + userid + " : " + userpw);
		
		return mService.login(userid, userpw, rttr);
	}
	
}
