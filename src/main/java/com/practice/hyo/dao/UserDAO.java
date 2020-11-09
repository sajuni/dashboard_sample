package com.practice.hyo.dao;

import java.util.Date;

import com.practice.hyo.domain.UserVO;
import com.practice.hyo.dto.LoginDTO;

public interface UserDAO {

	public UserVO login(LoginDTO dto)throws Exception;
	
	public void keepLogin(String uid, String sessionId, Date next);
	
	public UserVO checkUserWithSessionKey(String value);
	
}
