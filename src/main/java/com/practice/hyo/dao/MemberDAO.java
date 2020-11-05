package com.practice.hyo.dao;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.practice.hyo.domain.MemberVO;

public interface MemberDAO {

	public void regist(MemberVO mem);

	public String login(MemberVO mem, RedirectAttributes rttr);

	
}
