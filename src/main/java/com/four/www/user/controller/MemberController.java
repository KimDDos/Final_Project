package com.four.www.user.controller;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.four.www.user.domain.MemberVO;
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
	
	@GetMapping("/calendar")
	public void calendar() {}
	
	@GetMapping("/coupon")
	public void coupon() {}
	
	//mypage에서 사용하는 modify.
	@GetMapping("/mypageModify")
	public void mypageModify() {
	}
	
	
	//mypage에서 사용하는 modify.
	@PostMapping("/memberModify")
	public String memberModify(MemberVO mvo) {
		log.info(">>>> mvo >>>> {}", mvo);
		
		return "redirect:/member/mypage";
	}
	
	@PostMapping("/memberRegister")
	public String memberRegister(MemberVO mvo) {
		log.info(">>>> mvo >>>> {}", mvo);
		
		int isOk = msv.memberRegister(mvo);
		
		return "/";
	}
	
	@GetMapping("/memberLogin")
	public void memberLogin() {}
	
	
	@PostMapping("/memberLogin")
	public String memberLogin(HttpServletRequest request, RedirectAttributes re) {
		
		re.addFlashAttribute("userEmail", request.getAttribute("userEmail"));
		re.addFlashAttribute("errMsg", request.getAttribute("errMsg"));
		return "redirect:/member/login";
	}
}
