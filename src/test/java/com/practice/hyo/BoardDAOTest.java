package com.practice.hyo;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.practice.hyo.common.PagingVO;
import com.practice.hyo.domain.BoardVO;
import com.practice.hyo.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardDAOTest {

	@Autowired
	private BoardDAO dao;
	
//	@Test
//	public void readBoard() throws Exception {
//		dao.read((long)2);
//	}
	
	
//	@Test
//	public void testCreate() throws Exception {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로운 글 입니다.");
//		board.setContent("새로운 내용입니다.");
//		board.setWriter("시몬스");
//		dao.create(board);
//	}
	
//	@Test
//	public void testUpdate() throws Exception {
//		BoardVO board = new BoardVO();
//		board.setBno((long)1);
//		board.setTitle("변경된 글 입니다.");
//		board.setContent("변경된 내용입니다.");
//		System.out.println("변경 내용 : " + board);
//		dao.update(board);
//	}	
	
//	@Test
//	public void testDelete() throws Exception {
//		dao.delete((long)1);
//	}
	
//	@Test
//	public void testListPage()throws Exception{
//		int page = 1;
//		
//		List<BoardVO> list = dao.listPage(page);
//		
//		for (BoardVO boardVO : list) {
//			log.info(boardVO.getBno() + " : " + boardVO.getbtitle());
//		}
//		
//	}
	
//	@Test
//	public void testListPaging() throws Exception{
//		
//		PagingVO page = new PagingVO();
//		page.setPage(2);
//		page.setPerPageNum(5);
//		
//		List<BoardVO> list = dao.listPage(page);
//		
//		for (BoardVO boardVO: list) {
//			log.info(boardVO.getBno() + ": " + boardVO.getbtitle());
//		}
//	}
	
//	@Test
//	public void testURI()throws Exception {
//		
//		UriComponents uriComponents = 
//				UriComponentsBuilder.newInstance()
//				.path("/board/read")
//				.queryParam("bno", 12)
//				.queryParam("perPageNum", 20).build();
//		
//		log.info("/board/read?bno=12&perPageNum=20");
//		log.info(uriComponents.toString());
//	}
	
	@Test
	public void testURI2()throws Exception {
		
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.path("/{module}/{page}")
				.queryParam("bno", 12)
				.queryParam("perPageNum", 20)
				.build()
				.expand("board","read")
				.encode();
		
		log.info("/board/read?bno=12&perPageNum=20");
		log.info(uriComponents.toString());
	}
}
