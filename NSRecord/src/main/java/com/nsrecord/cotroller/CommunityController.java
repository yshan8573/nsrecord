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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.FreeBoardDto;
import com.nsrecord.dto.Notice;
import com.nsrecord.dto.SearchDto;
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

	//자유게시판 리스트 불러오기
	@RequestMapping(value = "/community/freeBoard")
	public String freeBoard(Model model) {
		model.addAttribute("categoryLoc", "community");
		List<FreeBoardDto> freeBoardList = communityServiceImpl.selectFreeBoardAllList();
		model.addAttribute("freeBoardList", freeBoardList);
		return "user/community/freeBoard"; 
	}
	
	//자유게시판 게시 내용
	@RequestMapping(value="/freeBoardContent")
	public String freeBoardContent(int b_seq, Model model, HttpSession session) {
		
		FreeBoardDto FreeBoardDto = communityServiceImpl.selectFreeBoardContent(b_seq);
		model.addAttribute("FreeBoardDto", FreeBoardDto);
		//댓글 내용
		List<FreeBoardDto> replyDto = communityServiceImpl.replyContent(b_seq);
		model.addAttribute("replyDto", replyDto);
		//댓글 작성 기능
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("User", user);
		return "user/community/selectFreeBoardContent";
	}
	
	//자유게시판 글쓰기
	@RequestMapping(value="/community/freeBoardWriter")
	public String freeBoardWriter(HttpSession session, FreeBoardDto dto, Model model) {
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("User", user);
		return "user/community/freeBoardWriter";
	}
	
	//자유게시판 글쓰기 등록
	@RequestMapping(value="/community/freeBoardWriteEnd")
	//HashMap(name(String), value(String)
	public String freeBoardWriteEnd(@RequestParam HashMap<String, String> writeEnd) {
		communityServiceImpl.freeBoardWriteEnd(writeEnd);
		return "redirect:/community/freeBoard";
	}

	//자유게시한 글쓰기 수정
	@RequestMapping(value="/community/updateFreeBoardContent")
	public String updateFreeBoardContent(@RequestParam HashMap<String, String> paramMap, Model model) {
		model.addAttribute("UpdateContent", paramMap);
		return "user/community/updateFreeBoardContent";
	}
		
	//자유게시판 글쓰기 수정 완료
	@RequestMapping(value="/community/updateFreeBoardContentEnd")
	public String updateFreeBoardContentEnd(@RequestParam HashMap<String, String> paramMap ) {
		communityServiceImpl.updateFreeBoardContentEnd(paramMap);		
		return "redirect:/community/freeBoard";
	}
	
	//자유게시판 글쓰기 삭제
	@RequestMapping(value="/community/deleteFreeBoardContent")
	public String deleteFreeBoardContent(@RequestParam("b_seq") int b_seq) {
		communityServiceImpl.deleteFreeBoardContent(b_seq);		
		return "redirect:/community/freeBoard";
	}
	
	//댓글 등록
	@RequestMapping(value="/community/reply")
	public String reply(@RequestParam HashMap<String, String> insertReply, @RequestParam("b_seq") int b_seq, RedirectAttributes redirectAttributes) {
		communityServiceImpl.insertReply(insertReply);
		redirectAttributes.addAttribute("b_seq", insertReply.get("b_seq"));
		return "redirect:/freeBoardContent";
	}


	//자유게시판 댓글 수정
	@RequestMapping(value="/community/updateReplyEnd")
	public String updateReplyEnd(@RequestParam HashMap<String, String> paramMap, RedirectAttributes redirectAttributes) {
		System.out.println(paramMap.toString());
		communityServiceImpl.updateReplyEnd(paramMap);
		redirectAttributes.addAttribute("b_seq", paramMap.get("b_seq"));		
		return "redirect:/freeBoardContent";
	}
	
	//자유게시판 댓글 삭제
	@RequestMapping(value="/community/deleteReply")
	public String deleteReply(@RequestParam("r_seq") int r_seq, @RequestParam("b_seq") int b_seq, RedirectAttributes redirectAttributes) {
		communityServiceImpl.deleteReply(r_seq);
		redirectAttributes.addAttribute("b_seq", b_seq);
		return "redirect:/freeBoardContent";
	}
	
//=====================공지게시판(관리자)======================//	
	@RequestMapping(value = "adminCommunity/adminNoticeBoard")
	public String adminNoticeBoard(Model model) {
		logger.info("this is a adminNoticeBoard Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "admin/community/admin_noticeBoard";
	}
	
	@RequestMapping(value = "adminCommunity/adminNoticeBoardAjax")
	public String adminNoticeBoardAjax(
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "searchSort", defaultValue = "") String searchSort,
			@RequestParam(value = "searchVal", defaultValue = "") String searchVal,
			Model model) {
		logger.info("this is a adminNoticeBoardAjax Method");
		
		// 검색 객체 값 넣기
		SearchDto searchDto = new SearchDto(searchSort, searchVal);
		
		// 공지사항 리스트 총 레코드 가져오기
		int nCount = iCommunityService.selectNoticeBoardCount(searchDto);
		
		int curPage = cPage; // 현재 출력 페이지
		
		// 페이지 객체에 값 저장 (nCount: 리스트 총 레코드 갯수 / curPage: 현재 출력 페이지)
		BoardPager boardPager = new BoardPager(nCount, curPage);
		
		// 페이지 객체에 검색 정보 저장
		boardPager.setSearchSort(searchSort);
		boardPager.setSearchVal(searchVal);
		
		// 공지사항 리스트 가져오기
		List<Notice> nResult = iCommunityService.selectNoticeBoardAll(boardPager);
		
		model.addAttribute("noticeList",nResult);
		model.addAttribute("boardPager",boardPager);
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "admin/community/ajax/admin_noticeBoard_ajax";
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
	
	@RequestMapping(value = "adminCommunity/adminNoticeBoardDetail")
	public String adminNoticeBoardDetail(Notice notice, Model model) {
		logger.info("this is a adminNoticeBoardDetail Method");
		
		Notice nResult = iCommunityService.selectNoticeBoardOne(notice);
		model.addAttribute("notice", nResult);
		
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "admin/community/admin_noticeBoard_detail";
	}
	

	@RequestMapping(value = "adminCommunity/adminNoticeBoardUpdate")
	public String adminNoticeBoardUpdate(Notice notice, Model model) {
		logger.info("this is a adminNoticeBoardUpdate Method");
		
		Notice nResult = iCommunityService.selectNoticeBoardOne(notice);
		model.addAttribute("notice", nResult);
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "admin/community/admin_noticeBoard_update";
	}
	
	@RequestMapping(value = "adminCommunity/adminNoticeBoardUpdateEnd")
	public String adminNoticeBoardUpdateEnd(Notice notice, Model model) {
		logger.info("this is a adminNoticeBoardUpdateEnd Method");
		
		int nResult = iCommunityService.updateNoticeBoard(notice);
		model.addAttribute("notice", nResult);
		
		String path = "common/msg";
		String loc = "";
		if(nResult > 0) {
			loc = "/adminCommunity/adminNoticeBoardDetail?n_seq="+notice.getN_seq();
			model.addAttribute("msg","업데이트 완료");
			model.addAttribute("loc",loc);

		} else {
			loc = "/adminCommunity/adminNoticeBoardUpdate?n_seq="+notice.getN_seq();
			model.addAttribute("msg","업데이트 실패");
			model.addAttribute("loc",loc);
		}
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return path;
	}
	
	
	@RequestMapping(value = "adminCommunity/adminNoticeBoardDelete")
	public String adminNoticeBoardDelete(Notice notice, Model model) {
		logger.info("this is a adminNoticeBoardDelete Method");
		
		int nResult = iCommunityService.deleteNoticeBoard(notice);
		model.addAttribute("notice", nResult);
		
		String path = "common/msg";
		String loc = "";
		if(nResult > 0) {
			loc = "/adminCommunity/adminNoticeBoard";
			model.addAttribute("msg","삭제 완료");
			model.addAttribute("loc",loc);

		} else {
			loc = "/adminCommunity/adminNoticeBoard";
			model.addAttribute("msg","삭제 실패");
			model.addAttribute("loc",loc);
		}
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return path;
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
			
		@RequestMapping(value = "community/myFreeBoard")
		public String myFreeBoard(Model model) {
			logger.info("this is a myFreeBoard Method");
			
			// 사이드 메뉴 'active' 설정 flag
			model.addAttribute("categoryLoc", "myCommunity");
			
			return "user/myPage/myFreeBoard";
		}
	
		@RequestMapping(value = "community/myReply")
		public String myReply(Model model) {
			logger.info("this is a myReply Method");
			
			// 사이드 메뉴 'active' 설정 flag
			model.addAttribute("categoryLoc", "myCommunity");
			
			return "user/myPage/myReply";
		}

}

