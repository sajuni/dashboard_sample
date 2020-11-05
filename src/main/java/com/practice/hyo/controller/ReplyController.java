package com.practice.hyo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.practice.hyo.common.Criteria;
import com.practice.hyo.common.PageMaker;
import com.practice.hyo.domain.ReplyVO;
import com.practice.hyo.service.ReplyService;

@RestController
@RequestMapping(value = "/replies")
public class ReplyController {
	
	@Autowired
	private ReplyService rService;

	@PostMapping(value = "")
	public ResponseEntity<String> register(@RequestBody ReplyVO vo) {
		ResponseEntity<String> entity = null;
		
		try {
			rService.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	@GetMapping(value = "/all/{bno}")
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Long bno){
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(
					rService.listReply(bno), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PutMapping(value = "/{rno}")
	public ResponseEntity<String> update(@PathVariable("rno") Long rno, @RequestBody ReplyVO vo) {
		ResponseEntity<String> entity = null;
		
		try {
			vo.setRno(rno);
			rService.modifyReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@DeleteMapping(value = "/{rno}")
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
		
		ResponseEntity<String> entity = null;
		try {
			rService.removeReply(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@GetMapping(value = "/{bno}/{page}")
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno") Long bno, @PathVariable("page") int page) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<ReplyVO> list = rService.listReplyPage(bno, cri);
			
			map.put("list", list);
			
			int replyCount = rService.count(bno);
	     	pageMaker.setTotalCount(replyCount);

	     	map.put("pageMaker", pageMaker);
			
	     	entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
