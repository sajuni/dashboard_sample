package com.practice.hyo.service;

import java.util.List;

import com.practice.hyo.common.PagingVO;
import com.practice.hyo.domain.BoardVO;

public interface BoardService {

	public void regist(BoardVO board)throws Exception;
	
	public BoardVO read(Long bno)throws Exception;
	
	public void update(BoardVO board)throws Exception;
	
	public void delete(Long bno)throws Exception;
	
	public List<BoardVO> listAll()throws Exception;
	
	public List<BoardVO> listPage(PagingVO page)throws Exception;
	
	public int countPaging(PagingVO page)throws Exception;
	
}
