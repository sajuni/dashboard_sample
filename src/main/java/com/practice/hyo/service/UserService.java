package com.practice.hyo.service;

import java.util.Date;

import com.practice.hyo.domain.UserVO;
import com.practice.hyo.dto.LoginDTO;

public interface UserService {

	public UserVO login(LoginDTO dto)throws Exception;
	
	public void keepLogin(String uid, String sessionId, Date next)throws Exception;
	
	public UserVO checkLoginBefore(String value);
	
}
