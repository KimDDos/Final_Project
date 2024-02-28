package com.four.www.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.four.www.reservation.domain.PurposeVO;
import com.four.www.reservation.domain.ReservationVO;
import com.four.www.reservation.service.PurposeService;
import com.four.www.reservation.service.ReservationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reservation/**")
@RequiredArgsConstructor
public class ReservationController {
	
	private final ReservationService rsv;
	private final PurposeService psv;
	
	@GetMapping("/gymSelect")
	public void gymSelect() {
	}
	
	@GetMapping("/register")
	public String register(@RequestParam(value="selAddress", required = true)String address,
			@RequestParam(value="selTitle", required = true)String title,Model m) {
		m.addAttribute("ppAddress",address);
		m.addAttribute("ppTitle",title);
		return "/reservation/register";
	}
	
	@PostMapping("/register")
	public String register(Model m,ReservationVO rvo,PurposeVO pvo) {
		
		int reservationResult = rsv.register(rvo);
	    int purposeResult = psv.register(pvo); 

	    m.addAttribute("reservationResult", reservationResult);
	    m.addAttribute("purposeResult", purposeResult);

		return "index";
		
		
		
		
	}
	


}
