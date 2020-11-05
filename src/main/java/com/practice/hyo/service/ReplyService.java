package com.practice.hyo.service;

import java.util.List;

import com.practice.hyo.common.Criteria;
import com.practice.hyo.domain.ReplyVO;

public interface ReplyService {

	public void addReply(ReplyVO vo)throws Exception;
	
	public List<ReplyVO> listReply(Long bno)throws Exception;
	
	public void modifyReply(ReplyVO vo)throws Exception;
	
	public void removeReply(Long rno)throws Exception;
	
	public List<ReplyVO> listReplyPage(Long bno, Criteria cri)throws Exception;
	
	public int count(Long bno)throws Exception;
	
}
