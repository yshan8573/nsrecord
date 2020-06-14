package com.nsrecord.cotroller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nsrecord.dto.FreeBoardDto;
import com.nsrecord.dto.Notice;
import com.nsrecord.dto.UserInfo;
import com.nsrecord.service.CommunityServiceImpl;
import com.nsrecord.service.ICommunityService;
import com.nsrecord.service.UserService;

@Controller
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@Autowired
	private ICommunityService iCommunityService;
	
	@Autowired
	private CommunityServiceImpl communityServiceImpl;
	
	@Autowired
	private UserService userService;

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
	//HashMap(name(String), value(String)
	public String freeBoardWriteEnd(@RequestParam HashMap<String, String> writeEnd) {
		System.out.println("writeEnd=" + writeEnd);
		communityServiceImpl.freeBoardWriteEnd(writeEnd);
		return "redirect:/community/freeBoard";
	}

	
//=====================공지게시판(관리자)======================//	
	@RequestMapping(value = "adminCommunity/adminNoticeBoard")
	public String adminNoticeBoard(Model model) {
		logger.info("this is a adminNoticeBoard Method");
		
		// 공지사항 리스트 가져오기
		List<Notice> nResult = iCommunityService.selectNoticeBoardAll();
		
		model.addAttribute("noticeList",nResult);
		
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
	public String adminNoticeBoardWriteEnd(Notice notice, Model model, HttpSession session) {
		logger.info("this is a adminNoticeBoardWriteEnd Method");
		
		
		// admin 계정 임의 생성 session 추가 (관리자 페이지 로그인 기능 추가 시 삭제 에정) - Start
		
		UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
		if(loginUser != null) {
			session.removeAttribute("loginUser");
		}

		UserInfo user = new UserInfo();
		user.setU_email("admin");
		UserInfo result = userService.userSelectOne(user);// admin 계정 정보 가져오기
		
		session.setAttribute("loginUser", result); // admin 계정 정보 session 저장
		
		// admin 계정 임의 생성 session 추가 (관리자 페이지 로그인 기능 추가 시 삭제 에정) - End
		
		
		// admin 정보 공지사항 객체에 저장
		loginUser = (UserInfo)session.getAttribute("loginUser");
		notice.setU_seq(loginUser.getU_seq());
		
		// 글 작성 저장
		iCommunityService.insertNoticeBoard(notice);
		
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "redirect:/adminCommunity/adminNoticeBoard";
	}
}
