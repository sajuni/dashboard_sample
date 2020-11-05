package com.practice.hyo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.practice.hyo.dao.MessageDAO;
import com.practice.hyo.dao.PointDAO;
import com.practice.hyo.domain.MessageVO;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO messageDAO;
	
	@Autowired
	private PointDAO pointDAO;

	@Transactional
	@Override
	public void addMessage(MessageVO vo) throws Exception {
	
		messageDAO.create(vo);
		pointDAO.updatePoint(vo.getSender(), 10);
		
	}

	@Override
	public MessageVO readMessage(String uid, Long mid) throws Exception {
		
		messageDAO.updateState(mid);
		pointDAO.updatePoint(uid, 5);
		
		return messageDAO.readMessage(mid);
		
	}
	
	

}
