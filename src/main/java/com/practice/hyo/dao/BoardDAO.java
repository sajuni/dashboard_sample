package com.practice.hyo.dao;

import java.util.List;

import com.practice.hyo.common.Criteria;
import com.practice.hyo.domain.BoardVO;
import com.practice.hyo.domain.SearchCriteria;

public interface BoardDAO {

	public void create(BoardVO vo)throws Exception;
	
	public BoardVO read(Long bno)throws Exception;
	
	public void update(BoardVO vo)throws Exception;
	
	public void delete(Long bno)throws Exception;
	
	public List<BoardVO> listAll()throws Exception;

	public List<BoardVO> listPage(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri)throws Exception;
	
	public List<BoardVO> listSearch(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	public void updateReplyCnt(Long bno, int amount)throws Exception;
	
	public void updateViewCnt(Long bno)throws Exception;
	
	public void addAttach(String fullName)throws Exception;
	
	public List<String> getAttach(Long bno)throws Exception;
	
}
