package com.practice.hyo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.practice.hyo.domain.SampleVO;

@RestController
@RequestMapping(value = "/sample")
public class SampleController {

		@GetMapping(value = "/hello")
		public String sayHello() {
			return "Hello World";
		}

		@GetMapping(value = "/sendVO")
		public SampleVO send() {
			System.out.println("여기");
			SampleVO vo = new SampleVO();
			vo.setFirstName("길동");
			vo.setLastName("홍");
			vo.setMno(123);

			return vo;
		}

		@GetMapping(value = "/sendList")
		public List<SampleVO> sendList() {

			List<SampleVO> list = new ArrayList<>();
			for (int i = 0; i < 10; i++) {
				SampleVO vo = new SampleVO();
				vo.setFirstName("길동");
				vo.setLastName("홍");
				vo.setMno(i);
				list.add(vo);
			}

			return list;
		}

		@GetMapping(value = "/sendMap")
		public Map<Integer, SampleVO> sendMap() {

			Map<Integer, SampleVO> map = new HashMap<>();

			for (int i = 0; i < 10; i++) {
				SampleVO vo = new SampleVO();
				vo.setFirstName("길동");
				vo.setLastName("홍");
				vo.setMno(i);
				map.put(i, vo);
			}
			
			return map;
		}

		@GetMapping(value = "/sendErrorAuth")
		public ResponseEntity<Void> sendListAuth() {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		@GetMapping(value = "/sendErrorNot")
		public ResponseEntity<List<SampleVO>> sendListNot() {
			
			List<SampleVO> list = new ArrayList<>();
			for (int i = 0; i < 10; i++) {
				SampleVO vo = new SampleVO();
				vo.setFirstName("길동");
				vo.setLastName("홍");
				vo.setMno(i);
				list.add(vo);
			}
			
			return new ResponseEntity<>(list, HttpStatus.NOT_FOUND);
		}
}
