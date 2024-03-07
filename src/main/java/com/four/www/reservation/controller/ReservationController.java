package com.four.www.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.four.www.admin.domain.NoticeVO;
import com.four.www.admin.domain.PagingVO;
import com.four.www.admin.handler.PagingHandler;
import com.four.www.reservation.domain.PurposeVO;
import com.four.www.reservation.domain.ReservationVO;
import com.four.www.reservation.service.PurposeService;
import com.four.www.reservation.service.ReservationService;
import com.four.www.user.domain.MemberVO;
import com.four.www.user.oauth.CustomAuthMemberService;
import com.four.www.user.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reservation/**")
@RequiredArgsConstructor
public class ReservationController {

	private final ReservationService rsv;
	private final PurposeService psv;
	private final MemberService msv;
	private final CustomAuthMemberService cms;

	@GetMapping("/gymSelect")
	public void gymSelect() {
		SecurityContextHolder.getContext()
		.setAuthentication(cms.createNewAuthentication());
	}

	@GetMapping("/register")
	public String register(@RequestParam(value = "selAddress", required = true) String address,
			@RequestParam(value = "selTitle", required = true) String title, Model m) {
		m.addAttribute("ppAddress", address);
		m.addAttribute("ppTitle", title);
		
		SecurityContextHolder.getContext()
		.setAuthentication(cms.createNewAuthentication());
		
		return "/reservation/register";
	}

	@PostMapping("/register")
	public String register(Model m, ReservationVO rvo, PurposeVO pvo) {

		int reservationResult = rsv.register(rvo);
		int purposeResult = psv.register(pvo);

		m.addAttribute("reservationResult", reservationResult);
		m.addAttribute("purposeResult", purposeResult);
		
		SecurityContextHolder.getContext()
		.setAuthentication(cms.createNewAuthentication());

		return "redirect:/reservation/list";
	}

	@GetMapping("/list")
	public String list(Model m, PagingVO pgvo) {
		log.info("PGVO~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+pgvo);
		List<ReservationVO> list = rsv.getrsvList(pgvo);
		int totalCount = rsv.getTotalCount(pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		m.addAttribute("list", list);
		m.addAttribute("ph", ph);
		
		SecurityContextHolder.getContext()
		.setAuthentication(cms.createNewAuthentication());

		return "/reservation/reservationList";
	}

	@GetMapping("/detail")
	public String detail(@RequestParam("rno") int rno, Model m) {
		ReservationVO Reserv = rsv.getReserveOne(rno);
		
		m.addAttribute("rvo", Reserv);
		
		SecurityContextHolder.getContext()
		.setAuthentication(cms.createNewAuthentication());

		return "/reservation/reservationDetail";
	}

	@GetMapping("/submit")
	public String submit(ReservationVO rvo, Model m, @RequestParam("userName") String userName,
			@RequestParam("trainerName") String trainerName) {

		MemberVO mvo = new MemberVO();
		mvo = msv.userDetailS(rvo.getTrainerNo());
		rvo.setTrainerName(mvo.getUserName());
		rvo.setTrainerPhoneNum(mvo.getUserPhoneNum());
		log.info("RVO>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + rvo);
		int isOk = rsv.submitReserv(rvo);
		
		SecurityContextHolder.getContext()
		.setAuthentication(cms.createNewAuthentication());
		
		return "redirect:/reservation/detail?rno=" + rvo.getRno();
	}

	@GetMapping("/cancel")
	public String cancel(@RequestParam("rno") int rno, Model m) {
		
		SecurityContextHolder.getContext()
		.setAuthentication(cms.createNewAuthentication());
		
		PagingVO pgvo = new PagingVO();
		
		int isOk = rsv.cancelReserv(rno);
		return "redirect:/reservation/list";
	}

}
