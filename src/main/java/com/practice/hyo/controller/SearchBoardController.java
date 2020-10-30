package com.practice.hyo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.practice.hyo.common.PageMaker;
import com.practice.hyo.domain.SearchCriteria;
import com.practice.hyo.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/sboard/*")
public class SearchBoardController {

	@Autowired
	private BoardService bService;
	
	@GetMapping(value = "list")
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		model.addAttribute("blist", bService.listPage(cri));
		
		pageMaker.setTotalCount(bService.countPaging(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	
}
