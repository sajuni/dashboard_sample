package com.practice.hyo.service;

import com.practice.hyo.domain.MessageVO;

public interface MessageService {

	public void addMessage(MessageVO vo)throws Exception;
	
	public MessageVO readMessage(String uid, Long mid)throws Exception;
	
}
