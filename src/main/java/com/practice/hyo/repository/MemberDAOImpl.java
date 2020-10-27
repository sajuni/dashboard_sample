package com.practice.hyo.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.practice.hyo.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession session;
	
	public static String namespace = "memberMapper";
	
	@Override
	public void regist(MemberVO mem) {
		System.out.println("여기" + mem);
		session.insert(namespace+".regist", mem);
	}

	@Override
	public String login(MemberVO mem, RedirectAttributes rttr) {
		return session.selectOne(namespace+".login", mem);
	}

}
