package com.practice.hyo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/ajax")
public class AjaxTestController {

	@GetMapping(value = "/test")
	public void ajaxText() {
		
	}
}
