package com.practice.hyo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoginDTO {

	private String uid;
	private String upw;
	private boolean userCookie;
	
}