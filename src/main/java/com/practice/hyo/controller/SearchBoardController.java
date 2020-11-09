package com.practice.hyo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.practice.hyo.common.PageMaker;
import com.practice.hyo.domain.BoardVO;
import com.practice.hyo.domain.SearchCriteria;
import com.practice.hyo.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/sboard/*")
public class SearchBoardController {

	@Autowired
	private BoardService bService;
	
	@GetMapping(value = "listPage")
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception {
		
		log.info(cri.toString());
		
		model.addAttribute("blist", bService.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
//		model.addAttribute("blist", bService.listPage(cri));
		
//		pageMaker.setTotalCount(bService.countPaging(cri));
		pageMaker.setTotalCount(bService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
	}

	@GetMapping(value = "readPage")
	public void readPage(@RequestParam("bno") Long bno, @ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception {
		model.addAttribute("board", bService.read(bno));
	}
	
	@GetMapping(value = "modifyPage")
	public void modifyPagingGET(@RequestParam("bno") Long bno, @ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception {
		model.addAttribute("board", bService.read(bno));
	}
	
	@PostMapping(value = "modifyPage")
	public String modifyPagingPOST(BoardVO board, SearchCriteria cri, RedirectAttributes rttr)throws Exception {
		log.info(cri.toString());
		bService.update(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "게시글 수정 성공!!");
		
		return "redirect:/sboard/listPage";
		
	}
	
	
	
	@PostMapping(value = "removePage")
	public String removePage(@RequestParam("bno") Long bno, SearchCriteria cri, RedirectAttributes rttr)throws Exception {
		
		bService.delete(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/sboard/listPage";
		
	}
	
	@GetMapping(value = "register")
	public void registGET()throws Exception {
		log.info("regist GET ....");
	}
	
	@PostMapping(value = "register")
	public String registPOST(BoardVO board, RedirectAttributes rttr)throws Exception {
		
		log.info("regist POST....");
		log.info(board.toString());
		
		bService.regist(board);
		
		rttr.addFlashAttribute("msg", "게시글 등록 성공!!");
		
		return "redirect:/sboard/listPage";
	}
	
	@GetMapping(value = "/getAttach/{bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("bno") Long bno)throws Exception{
		
		return bService.getAttach(bno);
		
	}
	
	
}
