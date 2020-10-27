package com.practice.hyo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.practice.hyo.controller.MemberController;
import com.practice.hyo.repository.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private BoardDAO dao;
	
	@Test
	public void readBoard() throws Exception {
		dao.read((long)2);
	}
	
	
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
}
