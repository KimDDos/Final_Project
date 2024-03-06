package com.four.www.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.four.www.admin.domain.NoticeVO;
import com.four.www.admin.domain.PagingVO;
import com.four.www.admin.service.NoticeBoardService;
import com.four.www.user.domain.AlarmVO;
import com.four.www.user.domain.MemberVO;
import com.four.www.user.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final NoticeBoardService nsv;
	private final MemberService msv;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, PagingVO pgvo) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		List<AlarmVO>avo = new ArrayList<AlarmVO>();
		int avoSize = 0;
		model.addAttribute("serverTime", formattedDate );
		 if (isAuthenticated(authentication)) 
		 {
			 int userSerial = msv.getUserDetail(authentication.getName());
			 avo = msv.getAlarmList(userSerial);
		 }
		
		List<NoticeVO> list = nsv.getList(pgvo);
		model.addAttribute("list" , list);
		model.addAttribute("alarmList",avo);
		model.addAttribute("alarmSize",avo.size());
		
		return "index";
		
	}
	
	private boolean isAuthenticated(Authentication authentication) {
	    if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
	        return false;
	    }
	    return authentication.isAuthenticated();
	}
	
}
