package com.four.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.four.www.service.NoticeBoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/notice/**")
@RequiredArgsConstructor

public class NoticeController {
	
	private final NoticeBoardService nvc;
	
	@GetMapping("/list")
	public void list() {
	}
	
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	
	
	
	
	
	
	
	

}
