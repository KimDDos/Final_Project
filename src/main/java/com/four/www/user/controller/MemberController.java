package com.four.www.user.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.four.www.user.domain.CalendarVO;
import com.four.www.user.domain.MemberVO;
import com.four.www.user.domain.UserVO;
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
	public void memberRegister() {
	}

	@GetMapping("/mypage")
	public void mypage() {
	}

	@GetMapping("/calendar")
	public void calendar() {
	}

	@GetMapping("/calendarRegister")
	public void calendarRegister(@RequestParam(value = "date", required = false) String date, Model m) {
		m.addAttribute("datedata", date);
	}

	@PostMapping("/calendarRegister")
	public String calendarRegister(@RequestParam(value = "date", required = false) String date, CalendarVO CalVO,
			String Start, String End) {
		log.info("START : " + Start + "\nEnd :" + End);
		String dateStr = date + " " + Start;
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime datetime = LocalDateTime.parse(dateStr, formatter);
		CalVO.setCalScheduleStartTime(datetime);
		dateStr = date + " " + End;
		formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		datetime = LocalDateTime.parse(dateStr, formatter);
		CalVO.setCalScheduleEndTime(datetime);
		log.info(CalVO.toString());
		return "/member/calendar";
	}

	@GetMapping("/coupon")
	public void coupon() {
	}

	// mypage에서 패스워드 체크페이지로 이동.
	@GetMapping("/mypagePwdcheck")
	public void mypagePwdcheck(@RequestParam(value = "delete", required = false) int delete,Model m) {
		m.addAttribute("delete",delete);
	}

	@GetMapping("/checkPwd")
	public String checkPwd(MemberVO mvo,@RequestParam(value = "delete", required = true) int delete) {
		log.info("" + mvo);
		int isOk = msv.checkPwd(mvo);
		log.info("VALIDATION>>>>>>>>>> " + isOk);
		if (isOk == 1) {
			if (delete != 1)return "/member/mypageModify";
			else if (delete == 1) return "member/mypageDelete";
		}
		return "/member/mypagePwdcheck";
	}
	
	@GetMapping("/memberDelete")
	public String memberDelete(HttpServletRequest request, HttpServletResponse response,MemberVO mvo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		new SecurityContextLogoutHandler().logout(request, response, authentication);
		
		int isOk = msv.deleteMember(mvo.getUserSerialNo());
		
		return "redirect:/member/memberLogout";
	}

	// mypage에서 사용하는 modify.
	@PostMapping("/memberModify")
	public String memberModify(MemberVO mvo) {
		log.info(">>>> mvo >>>> {}", mvo);

		int isOk = msv.memberModify(mvo);

		return "redirect:/member/memberLogout";
	}

	@PostMapping("/memberRegister")
	public String memberRegister(MemberVO mvo, Model m,
			@RequestParam(value = "userEmailPrev", required = true) String mailPrev,
			@RequestParam(value = "emailSelect", required = true) String emailSelect) {

		mvo.setUserEmail(mailPrev + "@" + emailSelect);
		log.info("MAIL >>>>>>>>>>>>>>>>>>>>>>>>>>" + mailPrev + emailSelect);
		log.info(">>>>>>>>>>>>>>>>>>>>>> mvo >>>> {}", mvo);

		int isOk = msv.memberRegister(mvo);
		UserVO newUvo = new UserVO();
		newUvo.setUserSerialNo(msv.getUserDetail(mvo.getUserEmail()));
		newUvo.setUserName(mvo.getUserName());
		newUvo.setUserNickName(mvo.getUserNickName());
		msv.authRegister(newUvo.getUserSerialNo());
		msv.userRegister(newUvo);
		m.addAttribute("msg_mbrreg", isOk);
		m.addAttribute("msg_mbrIsTrainer", mvo.getIsTrainer());
		if (mvo.getIsTrainer().equals("Y") && isOk > 0) {
			return "/member/trainerreg";
		} else if (isOk == 0) {
			m.addAttribute("msg_mbrreg", "2");
		}
		return "redirect:/";
	}

	@GetMapping("/memberLogin")
	public void memberLogin() {
	}

	@PostMapping("/memberLogout")
	public String memberLogout(HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		new SecurityContextLogoutHandler().logout(request, response, authentication);
		return "/";
	}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request, RedirectAttributes re) {
		re.addFlashAttribute("userEmail", request.getAttribute("userEmail"));
		re.addFlashAttribute("errMsg", request.getAttribute("errMsg"));
		log.info("<<<<USER EMAIL>>>>" + request.getAttribute("userEmail"));
		log.info("<<<<ERR MSG>>>>" + request.getAttribute("errMsg"));
		return "redirect:/member/mypage";
	}

	@GetMapping("/member/trainerreg")
	public void trainerreg() {
	}

}
