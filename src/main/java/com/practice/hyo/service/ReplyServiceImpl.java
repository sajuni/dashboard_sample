package com.practice.hyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.practice.hyo.common.Criteria;
import com.practice.hyo.dao.BoardDAO;
import com.practice.hyo.dao.ReplyDAO;
import com.practice.hyo.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO rDao;
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Transactional
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		
		rDao.create(vo);
		boardDAO.updateReplyCnt(vo.getBno(), 1);
		
	}

	@Override
	public List<ReplyVO> listReply(Long bno) throws Exception {
		return rDao.list(bno);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		rDao.update(vo);
	}

	@Transactional
	@Override
	public void removeReply(Long rno) throws Exception {
		
		Long bno = (long)rDao.getBno(rno);
		rDao.delete(rno);
		boardDAO.updateReplyCnt(bno, -1);
		
	}

	@Override
	public List<ReplyVO> listReplyPage(Long bno, Criteria cri) throws Exception {
		return rDao.listPage(bno, cri);
	}

	@Override
	public int count(Long bno) throws Exception {
		return rDao.count(bno);
	}

}
