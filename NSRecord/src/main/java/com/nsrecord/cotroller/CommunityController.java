package com.nsrecord.cotroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nsrecord.dto.Notice;

@Controller
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@RequestMapping(value = "community/noticeBoard")
	public String noticeBoard(Model model) {
		logger.info("this is a noticeBoard Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "user/community/noticeBoard";
	}
	
	@RequestMapping(value = "community/qnaBoard")
	public String qnaBoard(Model model) {
		logger.info("this is a qnaBoard Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "user/community/qnaBoard";
	}
	
	@RequestMapping(value = "community/freeBoard")
	public String freeBoard(Model model) {
		logger.info("this is a freeBoard Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "user/community/freeBoard";
	}
	
	@RequestMapping(value = "adminCommunity/adminNoticeBoard")
	public String adminNoticeBoard(Model model) {
		logger.info("this is a adminNoticeBoard Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "admin/community/admin_noticeBoard";
	}
	
	@RequestMapping(value = "adminCommunity/adminQnaBoard")
	public String adminQnaBoard(Model model) {
		logger.info("this is a adminQnaBoard Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "admin/community/admin_qnaBoard";
	}
	
	@RequestMapping(value = "adminCommunity/adminFreeBoard")
	public String adminFreeBoard(Model model) {
		logger.info("this is a adminFreeBoard Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "admin/community/admin_freeBoard";
	}
	
	@RequestMapping(value = "adminCommunity/adminNoticeBoardWrite")
	public String adminNoticeBoardWrite(Model model) {
		logger.info("this is a adminNoticeBoardWrite Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "admin/community/admin_noticeBoard_write";
	}

	@RequestMapping(value = "adminCommunity/adminNoticeBoardWriteEnd")
	public String adminNoticeBoardWriteEnd(Notice notice, Model model) {
		logger.info("this is a adminNoticeBoardWriteEnd Method");
		
		// 글 작성 저장
		System.out.println(notice.getN_title());
		System.out.println(notice.getN_content());
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "redirect:/adminCommunity/adminNoticeBoard";
	}
}
