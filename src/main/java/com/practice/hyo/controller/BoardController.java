package com.practice.hyo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.practice.hyo.common.PageMaker;
import com.practice.hyo.common.Criteria;
import com.practice.hyo.domain.BoardVO;
import com.practice.hyo.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/board/*")
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void boardListGET(Model model) throws Exception {
		
		log.info("board List GET ..........");
		
		List<BoardVO> blist = bService.listAll();
		
		log.info("board List Success : " + blist);
		
		model.addAttribute("blist", blist);
		
	}
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public void registerGET() {
		log.info("board Register GET ........");
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registerPOST(@ModelAttribute BoardVO vo) throws Exception {
		
		log.info("board Register POST ....... " + vo);
		
		bService.regist(vo);
		
		return "redirect:listPage";
	
	}
	
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public void boardInfoGET(@RequestParam("bno") Long bno, Model model) throws Exception {
		
		log.info("board Read GET......");
		
		BoardVO bInfo = bService.read(bno);
		
		model.addAttribute("board", bInfo);
		
	}
	
	@GetMapping(value = "modify")
	public void modifyGET(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		log.info("board Modify GET....");
		model.addAttribute("board", bService.read(bno));
		
	}
	
	@PostMapping(value ="modify")
	public String modifyPOST(BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		log.info("board Modify POST...." + board);
		bService.update(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "게시글 수정 성공!!");
		
		return "redirect:/board/listPage";
		
	}
	
	@PostMapping(value = "remove")
	public String removePOST(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		log.info("board Remove POST.... ");
		
		bService.delete(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "게시글 삭제 성공!!");
		
		return "redirect:/board/listPage";
		
	}
	
	@GetMapping(value = "listPage")
	public void listAll(@ModelAttribute Criteria cri, Model model) throws Exception {
		log.info("show list page with Paging........" + cri.toString());
		
		model.addAttribute("blist", bService.listPage(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(bService.countPaging(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@GetMapping(value = "readPage")
	public void read(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		model.addAttribute("board", bService.read(bno));
	}
	
}
