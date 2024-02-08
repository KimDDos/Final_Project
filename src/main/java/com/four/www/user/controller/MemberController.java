package com.four.www.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.four.www.user.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/**")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService msv;
	
	@GetMapping("/memberRegister")
	public void memberRegister() {}
	
	@GetMapping("/mypage")
	public void mypage() {}
	
}
