package com.nsrecord.cotroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
