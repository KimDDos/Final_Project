package com.four.www.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.four.www.admin.domain.NoticeVO;
import com.four.www.admin.domain.PagingVO;
import com.four.www.admin.handler.PagingHandler;
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
	private final NoticeBoardService nsv;
	
	@GetMapping("/index")
	public void adminpage() {}
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(NoticeVO nvo) {
		log.info(">>>> nvo >>>{}" , nvo);
		int isOk = nsv.register(nvo);
		return "redirect:/admin/list";
	}
	
	
	
	@GetMapping("/list")
	public void list(Model m, PagingVO pgvo) {
		List<NoticeVO> list = nsv.getadminList(pgvo);
		int totalCount = nsv.getTotalCount(pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		m.addAttribute("list" , list);
		m.addAttribute("ph",ph);
	}
	
	@GetMapping({"/detail","/modify"})
	public void detail(Model m, @RequestParam("notice_no")int nvo) {
		m.addAttribute("nvo", nsv.getdetail(nvo));
	}
	
	@PostMapping("/modify")
	public String modify(NoticeVO nvo,  RedirectAttributes re) {
		int isOk = nsv.modify(nvo);
		return "redirect:/admin/detail?notice_no="+nvo.getNoticeNo();
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("notice_no")int nvo, RedirectAttributes re) {
		nsv.remove(nvo);
		return "redirect:/admin/list";
	}
	
	
	
}


