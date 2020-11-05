package com.practice.hyo.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MessageVO {

	private Long mid;
	private String targetid;
	private String sender;
	private String message;
	private Date opendate;
	private Date senddate;
	
}
