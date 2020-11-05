package com.practice.hyo.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVO {

	private Long rno;
	private Long bno;
	private String replytext;
	private String replyer;
	private Date regdate;

	private	Date updatedate;
	
}
