package com.four.www.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.four.www.main.service.MainService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/main/**")
@RequiredArgsConstructor
public class MainController {
	
	private final MainService mainsv;
	
	@GetMapping("/footerPi")
	public String footerpi() {
		return "/footerdetail/privateinformation";
	}
	
	@GetMapping("/footerSt")
	public String footerst() {
		return "/footerdetail/serviceterms";
	}

	@GetMapping("/footerright")
	public String footerright() {
		return "/footerdetail/right";
	}

}
