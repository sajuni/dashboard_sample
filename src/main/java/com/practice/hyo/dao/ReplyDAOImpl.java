package com.practice.hyo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.practice.hyo.common.Criteria;
import com.practice.hyo.domain.ReplyVO;
@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession session;
	
	private static String namespace = "replyMapper";
	
	@Override
	public List<ReplyVO> list(Long bno) throws Exception {
		return session.selectList(namespace + ".list", bno);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Long rno) throws Exception {
		session.delete(namespace + ".delete", rno);
	}

	@Override
	public List<ReplyVO> listPage(Long bno, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".listPage", paramMap);
	}

	@Override
	public int count(Long bno) throws Exception {
		return session.selectOne(namespace + ".count", bno);
	}

	@Override
	public int getBno(Long rno) throws Exception {
		return session.selectOne(namespace + ".getBno", rno);
	}

}
