package com.four.www.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.four.www.reservation.service.ReservationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reservation/**")
@RequiredArgsConstructor
public class ReservationController {

	private final ReservationService rsv;

	@GetMapping("/gymSelect")
	public String gymSelect() {
		return "/reservation/gymSelect";
	}

	@GetMapping("/reservRegister")
	public String register(@RequestParam(value = "selAddress", required = true) String address
			,@RequestParam(value = "selTitle", required = true) String title, Model m) {
		m.addAttribute("address", address);
		m.addAttribute("title", title);
		return "/reservation/register";
	}

}
