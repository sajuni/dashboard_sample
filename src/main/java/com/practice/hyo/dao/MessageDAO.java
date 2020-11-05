package com.practice.hyo.dao;

import com.practice.hyo.domain.MessageVO;

public interface MessageDAO {

	public void create(MessageVO vo)throws Exception;
	
	public MessageVO readMessage(Long mid)throws Exception;
	
	public void updateState(Long mid)throws Exception;
	
}
