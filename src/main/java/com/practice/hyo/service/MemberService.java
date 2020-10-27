package com.practice.hyo.service;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.practice.hyo.domain.MemberVO;

public interface MemberService {

	void regist(MemberVO mem);

	String login(String userid, String userpw, RedirectAttributes rttr);

}
