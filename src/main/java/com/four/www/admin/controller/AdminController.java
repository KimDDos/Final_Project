package com.four.www.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.four.www.admin.service.AdminService;
import com.four.www.admin.service.NoticeBoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/**")
@RequiredArgsConstructor

public class AdminController {

	private final AdminService asv;
	
	@GetMapping("/index")
	public void adminpage() {}
}
