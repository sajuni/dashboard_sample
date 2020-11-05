package com.practice.hyo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.practice.hyo.domain.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Autowired
	private SqlSession session;
	
	private static String namespace = "MessageMapper";
	
	@Override
	public void create(MessageVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public MessageVO readMessage(Long mid) throws Exception {
		return session.selectOne(namespace + ".readMessage", mid);
	}

	@Override
	public void updateState(Long mid) throws Exception {
		session.update(namespace + ".updateState", mid);
	}

}
