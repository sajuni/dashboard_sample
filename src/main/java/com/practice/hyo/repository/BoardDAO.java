package com.practice.hyo.repository;

import java.util.List;

import com.practice.hyo.common.Criteria;
import com.practice.hyo.domain.BoardVO;

public interface BoardDAO {

	public void create(BoardVO vo)throws Exception;
	
	public BoardVO read(Long bno)throws Exception;
	
	public void update(BoardVO vo)throws Exception;
	
	public void delete(Long bno)throws Exception;
	
	public List<BoardVO> listAll()throws Exception;

	public List<BoardVO> listPage(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri)throws Exception;
	
}
