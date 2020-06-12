package com.nsrecord.cotroller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nsrecord.dto.FreeBoardDto;
import com.nsrecord.dto.Notice;
import com.nsrecord.service.CommunityServiceImpl;

@Controller
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@Autowired
	private CommunityServiceImpl communityServiceImpl;

//=====================공지게시판(사용자)======================//	
	@RequestMapping(value = "community/noticeBoard")
	public String noticeBoard(Model model) {
		logger.info("this is a noticeBoard Method");
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "user/community/noticeBoard";
	}
	
	
//=====================질문게시판(사용자)======================//	
	@RequestMapping(value = "community/qnaBoard")
	public String qnaBoard(Model model) {
		logger.info("this is a qnaBoard Method");
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
				
		return "user/community/qnaBoard";
	}
	
	
//=====================자유게시판(사용자)======================//	
	@RequestMapping(value = "/community/freeBoard")
	public String freeBoard(Model model) {
		logger.info("this is a freeBoard Method");
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		List<FreeBoardDto> freeBoardList = communityServiceImpl.selectFreeBoardAllList();
		model.addAttribute("freeBoardList", freeBoardList);
		return "user/community/freeBoard";
	}
	
	@RequestMapping(value="/community/freeBoardContent")
	public String freeBoardContent(int b_seq, Model model) {
		FreeBoardDto FreeBoardDto = communityServiceImpl.selectFreeBoardContent(b_seq);
		model.addAttribute("FreeBoardDto", FreeBoardDto);
		return "user/community/selectFreeBoardContent";
	}
	

	@RequestMapping(value="/community/freeBoardWriter")
	public String freeBoardWriter() {
		return "user/community/freeBoardWriter";
	}
	
	@RequestMapping(value="/community/freeBoardWriteEnd")
	public String freeBoardWriteEnd(@RequestParam HashMap<String, String> writeEnd) {
		communityServiceImpl.freeBoardWriteEnd(writeEnd);
		return "redirect:/selectFreeBoardContent";
	}

	
//=====================공지게시판(관리자)======================//	
	@RequestMapping(value = "adminCommunity/adminNoticeBoard")
	public String adminNoticeBoard(Model model) {
		logger.info("this is a adminNoticeBoard Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "admin/community/admin_noticeBoard";
	}

//=====================질문게시판(관리자)======================//		
	@RequestMapping(value = "adminCommunity/adminQnaBoard")
	public String adminQnaBoard(Model model) {
		logger.info("this is a adminQnaBoard Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "admin/community/admin_qnaBoard";
	}
	
//=====================자유게시판(관리자)======================//	
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
