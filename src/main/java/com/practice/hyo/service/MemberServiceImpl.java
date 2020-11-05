package com.practice.hyo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.practice.hyo.dao.MemberDAO;
import com.practice.hyo.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public void regist(MemberVO mem) {
		mDAO.regist(mem);
	}

	@Override
	public String login(String userid, String userpw, RedirectAttributes rttr) {
		MemberVO mem = new MemberVO();
		mem.setUserid(userid);
		mem.setUserpw(userpw);
		
		return mDAO.login(mem, rttr);
	}

}
