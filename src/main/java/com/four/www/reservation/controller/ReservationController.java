package com.four.www.reservation.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.four.www.admin.domain.NoticeVO;
import com.four.www.admin.domain.PagingVO;
import com.four.www.admin.handler.PagingHandler;
import com.four.www.reservation.domain.PurposeVO;
import com.four.www.reservation.domain.ReservationVO;
import com.four.www.reservation.service.PurposeService;
import com.four.www.reservation.service.ReservationService;
import com.four.www.user.domain.MemberVO;
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

	@GetMapping("/gymSelect")
	public void gymSelect() {
	}

	@GetMapping("/register")
	public String register(@RequestParam(value = "selAddress", required = true) String address,
			@RequestParam(value = "selTitle", required = true) String title, Model m) {
		m.addAttribute("ppAddress", address);
		m.addAttribute("ppTitle", title);
		return "/reservation/register";
	}

	@PostMapping("/register")
	public String register(Model m, ReservationVO rvo, PurposeVO pvo) {

		int reservationResult = rsv.register(rvo);
		int purposeResult = psv.register(pvo);

		m.addAttribute("reservationResult", reservationResult);
		m.addAttribute("purposeResult", purposeResult);

		return "index";
	}

	@GetMapping("/list")
	public String list(Model m, PagingVO pgvo) {
		List<ReservationVO> list = rsv.getrsvList(pgvo);
		int totalCount = rsv.getTotalCount(pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		m.addAttribute("list", list);
		m.addAttribute("ph", ph);

		return "/reservation/reservationList";
	}

	@GetMapping("/detail")
	public String detail(@RequestParam("rno") int rno, Model m) {
		ReservationVO Reserv = rsv.getReserveOne(rno);
		MemberVO mvo = msv.userDetailS(Reserv.getUserSerialNo());
		String trainerName = "";
		if (Reserv.getTrainerNo() != 0)
			trainerName = msv.userDetailS(Reserv.getTrainerNo()).getUserName();
		m.addAttribute("mvo", mvo);
		m.addAttribute("rvo", Reserv);
		m.addAttribute("trainerName", trainerName);

		return "/reservation/reservationDetail";
	}
	
	@GetMapping("/submit")
	public String submit(@RequestParam("trainerNo") int tno,@RequestParam("rno") int rno, Model m) {
		ReservationVO rvo = new ReservationVO();
		rvo.setRno(rno);
		rvo.setTrainerNo(tno);
		int isOk = rsv.submitReserv(rvo);
		return "redirect:/reservation/detail?rno="+rno;
	}
	
	@GetMapping("/cancel")
	public String cancel(@RequestParam("rno") int rno, Model m) {
		int isOk = rsv.cancelReserv(rno);
		return "/reservation/reservationList";
	}

}
