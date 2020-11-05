package com.practice.hyo.dao;

import java.util.List;

import com.practice.hyo.common.Criteria;
import com.practice.hyo.domain.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> list(Long bno)throws Exception;
	
	public void create(ReplyVO vo)throws Exception;
	
	public void update(ReplyVO vo)throws Exception;
	
	public void delete(Long rno)throws Exception;

	public List<ReplyVO> listPage(Long bno, Criteria cri)throws Exception;
	
	public int count(Long bno)throws Exception;
	
	public int getBno(Long rno)throws Exception;
	
}
