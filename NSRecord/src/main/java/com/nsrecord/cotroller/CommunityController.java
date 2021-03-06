package com.nsrecord.cotroller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nsrecord.common.FileUpload;
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
		return "user/community/freeBoard"; 
	}
	
	//자유게시판 리스트에서 상세보기 눌렀을 때만 조회수 증가.
	//댓글 작성-수정-삭제 시 리프레시 돼도 조회수 증가 안 함.
	@RequestMapping(value="/preFreeBoardContent")
	public String preFreeBoardContent(int b_seq, Model model, HttpSession session) {
		communityServiceImpl.boardCountUpdate(b_seq);	
		return "forward:/freeBoardContent";
	}
	
	//자유게시판 게시 내용
	@RequestMapping(value="/freeBoardContent")
	public String freeBoardContent(int b_seq, Model model, HttpSession session) {		
		
		//게시 내용
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

	//자유게시판 글쓰기 수정
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
		communityServiceImpl.countReply(b_seq);
		redirectAttributes.addAttribute("b_seq", insertReply.get("b_seq"));
		return "redirect:/freeBoardContent";
	}

	//자유게시판 댓글 수정
	@RequestMapping(value="/community/updateReplyEnd")
	public String updateReplyEnd(@RequestParam HashMap<String, String> paramMap, RedirectAttributes redirectAttributes) {
		communityServiceImpl.updateReplyEnd(paramMap);
		redirectAttributes.addAttribute("b_seq", paramMap.get("b_seq"));		
		return "redirect:/freeBoardContent";
	}
	
	//자유게시판 댓글 삭제
	@RequestMapping(value="/community/deleteReply")
	public String deleteReply(@RequestParam("r_seq") int r_seq, @RequestParam("b_seq") int b_seq, RedirectAttributes redirectAttributes) {
		communityServiceImpl.deleteReply(r_seq);
		communityServiceImpl.deCountReply(b_seq);
		redirectAttributes.addAttribute("b_seq", b_seq);
		return "redirect:/freeBoardContent";
	}
	
	//자유게시판 에이작스 처리
	@RequestMapping(value = "/community/freeBoardAjax")
	public String freeBoardAjax(
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "searchSort", defaultValue = "") String searchSort,
			@RequestParam(value = "searchVal", defaultValue = "") String searchVal,
			Model model) {
	
		// 검색 객체 값 넣기
		SearchDto searchDto = new SearchDto(searchSort, searchVal);
		
		// 자유게시판 리스트 총 레코드 가져오기
		int nCount = communityServiceImpl.selectFreeBoardCount(searchDto);
		
		int curPage = cPage; // 현재 출력 페이지
		
		// 페이지 객체에 값 저장 (nCount: 리스트 총 레코드 갯수 / curPage: 현재 출력 페이지)
		BoardPager boardPager = new BoardPager(nCount, curPage);
		
		// 페이지 객체에 검색 정보 저장
		boardPager.setSearchSort(searchSort);
		boardPager.setSearchVal(searchVal);
		
		// 자유게시판 리스트 가져오기
		List<FreeBoardDto> freeBoardResult = communityServiceImpl.selectFreeBoardAll(boardPager);
		
		
		model.addAttribute("freeBoardList",freeBoardResult);
		model.addAttribute("boardPager",boardPager);
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "community");
		
		return "user/community/freeBoardAjax";
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
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,	//디폴트값 설정 -> 400Error 방지
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
	public String adminNoticeBoardWriteEnd(Notice notice,
			@RequestParam(value = "upFile", required = false) MultipartFile upFile,
			HttpServletRequest req, Model model, HttpSession session) {
		logger.info("this is a adminNoticeBoardWriteEnd Method");
		
		// 파일 업로드----------------------------- start
		// 파일이 저장될 디텍토리 설정 
		String prePath = req.getSession().getServletContext().getRealPath("/resources/data/")+"/";
		String path = prePath + "notice";
		
		//단일 파일 유무에 따라 notice 객체 저장
		if(upFile != null && !upFile.isEmpty()) {
			
			// path : 저장될 파일 경로, upFile : view에서 받아온 file 값
			FileUpload ful = new FileUpload(path,upFile);
			
			notice.setN_ori(ful.getFileOriName());
			notice.setN_re(ful.getFileReName());
		} else {
			notice.setN_ori("");
			notice.setN_re("");
		}
		// 파일 업로드----------------------------- end
		
		// admin 정보 공지사항 객체에 저장
		UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
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
	
		//관리자 자유게시판 리스트 불러오기
		@RequestMapping(value = "/adminCommunity/adminFreeBoard")
		public String adminFreeBoard(Model model) {
			model.addAttribute("categoryLoc", "community");
			return "admin/community/admin_freeBoard"; 
		}
		
		//관리자 자유게시판 리스트 에이작스 처리
		@RequestMapping(value = "/adminCommunity/adminFreeBoardAjax")
		public String adminFreeBoardAjax(
				@RequestParam(value = "cPage", defaultValue = "1") int cPage,
				@RequestParam(value = "searchSort", defaultValue = "") String searchSort,
				@RequestParam(value = "searchVal", defaultValue = "") String searchVal,
				Model model) {
		
			// 검색 객체 값 넣기
			SearchDto searchDto = new SearchDto(searchSort, searchVal);
			
			// 자유게시판 리스트 총 레코드 가져오기
			int nCount = communityServiceImpl.selectFreeBoardCount(searchDto);
			
			int curPage = cPage; // 현재 출력 페이지
			
			// 페이지 객체에 값 저장 (nCount: 리스트 총 레코드 갯수 / curPage: 현재 출력 페이지)
			BoardPager boardPager = new BoardPager(nCount, curPage);
			
			// 페이지 객체에 검색 정보 저장
			boardPager.setSearchSort(searchSort);
			boardPager.setSearchVal(searchVal);
			
			// 자유게시판 리스트 가져오기
			List<FreeBoardDto> freeBoardResult = communityServiceImpl.adminSelectFreeBoardAll(boardPager);
			
			model.addAttribute("freeBoardList",freeBoardResult);
			model.addAttribute("boardPager",boardPager);
			
			// 사이드 메뉴 'active' 설정 flag
			model.addAttribute("categoryLoc", "community");
			
			return "admin/community/admin_freeBoardAjax";
		}
			
		//관리자 자유게시판 게시 내용
		@RequestMapping(value="/adminCommunity/adminFreeBoardContent")
		public String adminFreeBoardContent(int b_seq, Model model, HttpSession session) {		
		
			//게시 내용
			FreeBoardDto FreeBoardDto = communityServiceImpl.selectFreeBoardContent(b_seq);
			model.addAttribute("FreeBoardDto", FreeBoardDto);
			//댓글 내용
			List<FreeBoardDto> replyDto = communityServiceImpl.replyContent(b_seq);
			model.addAttribute("replyDto", replyDto);
			//댓글 작성 기능
			UserInfo user = (UserInfo) session.getAttribute("loginUser");
			model.addAttribute("User", user);
		
			
			return "admin/community/admin_selectFreeBoardContent";
		}
		
		//관리자 자유게시판 글쓰기
		@RequestMapping(value="/adminCommunity/adminFreeBoardWriter")
		public String adminFreeBoardWriter(HttpSession session, FreeBoardDto dto, Model model) {
			UserInfo user = (UserInfo) session.getAttribute("loginUser");
			model.addAttribute("User", user);
			return "admin/community/admin_freeBoardWriter";
		}
		
		//관리자 자유게시판 글쓰기 등록
		@RequestMapping(value="/adminCommunity/adminFreeBoardWriteEnd")
		//HashMap(name(String), value(String)
		public String adminFreeBoardWriteEnd(@RequestParam HashMap<String, String> writeEnd) {
			communityServiceImpl.freeBoardWriteEnd(writeEnd);
			return "redirect:/adminCommunity/adminFreeBoard";
		}

		//관리자 자유게시판 글쓰기 수정
		@RequestMapping(value="/adminCommunity/adminUpdateFreeBoardContent")
		public String adminUpdateFreeBoardContent(@RequestParam HashMap<String, String> paramMap, Model model) {
			model.addAttribute("UpdateContent", paramMap);
			return "admin/community/admin_updateFreeBoardContent";
		}
			
		//관리자 자유게시판 글쓰기 수정 완료
		@RequestMapping(value="/adminCommunity/adminUpdateFreeBoardContentEnd")
		public String adminUpdateFreeBoardContentEnd(@RequestParam HashMap<String, String> paramMap ) {
			communityServiceImpl.updateFreeBoardContentEnd(paramMap);		
			return "redirect:/adminCommunity/adminFreeBoard";
		}
		
		//관리자 자유게시판 글쓰기 삭제
		@RequestMapping(value="/adminCommunity/adminDeleteFreeBoardContent")
		public String adminDeleteFreeBoardContent(@RequestParam("b_seq") int b_seq) {
			communityServiceImpl.deleteFreeBoardContent(b_seq);
			return "redirect:/adminCommunity/adminFreeBoard";
		}
		
		//관리자 댓글 등록
		@RequestMapping(value="/adminCommunity/adminReply")
		public String adminReply(@RequestParam HashMap<String, String> insertReply, @RequestParam("b_seq") int b_seq, RedirectAttributes redirectAttributes) {
			communityServiceImpl.insertReply(insertReply);
			communityServiceImpl.countReply(b_seq);
			redirectAttributes.addAttribute("b_seq", insertReply.get("b_seq"));
			return "redirect:/adminCommunity/adminFreeBoardContent";
		}

		//관리자 자유게시판 댓글 수정
		@RequestMapping(value="/adminCommunity/adminUpdateReplyEnd")
		public String adminUpdateReplyEnd(@RequestParam HashMap<String, String> paramMap, RedirectAttributes redirectAttributes) {
			communityServiceImpl.updateReplyEnd(paramMap);
			redirectAttributes.addAttribute("b_seq", paramMap.get("b_seq"));		
			return "redirect:/adminCommunity/adminFreeBoardContent";
		}
		
		//관리자 자유게시판 댓글 삭제
		@RequestMapping(value="/adminCommunity/adminDeleteReply")
		public String adminDeleteReply(@RequestParam("r_seq") int r_seq, @RequestParam("b_seq") int b_seq, RedirectAttributes redirectAttributes) {
			communityServiceImpl.deleteReply(r_seq);
			communityServiceImpl.deCountReply(b_seq);
			redirectAttributes.addAttribute("b_seq", b_seq);
			return "redirect:/adminCommunity/adminFreeBoardContent";
		}
		
		//=====================마이 페이지 게시판======================//	

		@RequestMapping(value="/myPage/myFreeBoard")
		public String myFreeBoardList(Model model) {
			model.addAttribute("categoryLoc", "myCommunity");
			return "user/myPage/myFreeBoard";
		}
		
		//자유게시판 에이작스 처리
		@RequestMapping(value = "/myPage/myFreeBoardAjax")
		public String myFreeBoardAjax(
				@RequestParam(value = "cPage", defaultValue = "1") int cPage,
				@RequestParam(value = "searchSort", defaultValue = "") String searchSort,
				@RequestParam(value = "searchVal", defaultValue = "") String searchVal,
				Model model, HttpSession session) {
			
			UserInfo user = (UserInfo) session.getAttribute("loginUser");
	
			
			// 검색 객체 값 넣기
			SearchDto searchDto = new SearchDto(searchSort, searchVal);
			searchDto.setU_seq(user.getU_seq());
			
			// 자유게시판 리스트 총 레코드 가져오기
			int nCount = communityServiceImpl.mySelectFreeBoardCount(searchDto);
			
			int curPage = cPage; // 현재 출력 페이지
			
			// 페이지 객체에 값 저장 (nCount: 리스트 총 레코드 갯수 / curPage: 현재 출력 페이지)
			BoardPager boardPager = new BoardPager(nCount, curPage);
			
			// 페이지 객체에 검색 정보 저장
			boardPager.setSearchSort(searchSort);
			boardPager.setSearchVal(searchVal);
			boardPager.setU_seq(user.getU_seq());
			
			
			// 자유게시판 리스트 가져오기
			List<FreeBoardDto> myFreeBoardList = communityServiceImpl.myFreeBoardList(boardPager);
			
			model.addAttribute("myFreeBoardList", myFreeBoardList);
			model.addAttribute("boardPager",boardPager);
			
			// 사이드 메뉴 'active' 설정 flag
			model.addAttribute("categoryLoc", "community");
			
			return "user/myPage/myFreeBoardAjax";
		}
		
		//마이페이지 게시판 게시 내용
		@RequestMapping(value="/myPage/myFreeBoardContent")
		public String myFreeBoardContent(int b_seq, Model model, HttpSession session) {		
			
			//게시 내용
			FreeBoardDto FreeBoardDto = communityServiceImpl.selectFreeBoardContent(b_seq);
			model.addAttribute("FreeBoardDto", FreeBoardDto);
			//댓글 내용
			List<FreeBoardDto> replyDto = communityServiceImpl.replyContent(b_seq);
			model.addAttribute("replyDto", replyDto);
			//댓글 작성 기능
			UserInfo user = (UserInfo) session.getAttribute("loginUser");
			model.addAttribute("User", user);
				
			return "user/myPage/myFreeBoardContent";
		}
		
		//마이 게시판 글쓰기 수정
		@RequestMapping(value="/myPage/myUpdateFreeBoardContent")
		public String myUpdateFreeBoardContent(@RequestParam HashMap<String, String> paramMap, Model model) {
			model.addAttribute("myUpdateContent", paramMap);
			return "user/myPage/myUpdateFreeBoardContent";
		}
			
		//자유게시판 글쓰기 수정 완료
		@RequestMapping(value="/myPage/myUpdateFreeBoardContentEnd")
		public String myUpdateFreeBoardContentEnd(@RequestParam HashMap<String, String> paramMap ) {
			communityServiceImpl.updateFreeBoardContentEnd(paramMap);		
			return "redirect:/myPage/myFreeBoard";
		}
		
		//자유게시판 글쓰기 삭제
		@RequestMapping(value="/myPage/myDeleteFreeBoardContent")
		public String myDeleteFreeBoardContent(@RequestParam("b_seq") int b_seq) {
			communityServiceImpl.deleteFreeBoardContent(b_seq);
			return "redirect:/myPage/myFreeBoard";
		}
		
		//==========================마이 페이지 댓글==========================//

		@RequestMapping(value="/myPage/myReply")
		public String myReply(Model model) {
			model.addAttribute("categoryLoc", "myCommunity");
			return "user/myPage/myReply";
		}
		
		@RequestMapping(value="myPage/myReplyAjax")
		public String myReplyAjax(
				@RequestParam(value = "cPage", defaultValue = "1") int cPage,
				@RequestParam(value = "searchSort", defaultValue = "") String searchSort,
				@RequestParam(value = "searchVal", defaultValue = "") String searchVal,
				Model model, HttpSession session) {
			
			UserInfo user = (UserInfo) session.getAttribute("loginUser");
	
			
			// 검색 객체 값 넣기
			SearchDto searchDto = new SearchDto(searchSort, searchVal);
			searchDto.setU_seq(user.getU_seq());
			
			// 개인 댓글 리스트 총 레코드 가져오기
			int nCount = communityServiceImpl.mySelectReplyCount(searchDto);
			
			int curPage = cPage; // 현재 출력 페이지
			
			// 페이지 객체에 값 저장 (nCount: 리스트 총 레코드 갯수 / curPage: 현재 출력 페이지)
			BoardPager boardPager = new BoardPager(nCount, curPage);
			
			// 페이지 객체에 검색 정보 저장
			boardPager.setSearchSort(searchSort);
			boardPager.setSearchVal(searchVal);
			boardPager.setU_seq(user.getU_seq());
			
			
			// 개인 댓글 리스트 가져오기
			List<FreeBoardDto> myReplyList = communityServiceImpl.myReplyList(boardPager);
			
			model.addAttribute("myReplyList", myReplyList);
			model.addAttribute("boardPager",boardPager);
			
			// 사이드 메뉴 'active' 설정 flag
			model.addAttribute("categoryLoc", "community");
			
			return "user/myPage/myReplyAjax";
		}

		@RequestMapping(value = "community/userNoticeBoardAjax")
		public String userNoticeBoardAjax(
				@RequestParam(value = "cPage", defaultValue = "1") int cPage,	//디폴트값 설정 -> 400Error 방지
				@RequestParam(value = "searchSort", defaultValue = "") String searchSort,
				@RequestParam(value = "searchVal", defaultValue = "") String searchVal,
				Model model) {
			logger.info("this is a userNoticeBoardAjax Method");
			
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
			
			return "user/community/ajax/user_noticeBoard_ajax";
		}

		@RequestMapping(value = "community/userNoticeBoardDetail")
		public String userNoticeBoardDetail(
				Notice notice, Model model,
				HttpServletRequest request,
				HttpServletResponse response
				) {
			logger.info("this is a userNoticeBoardDetail Method");
			
			Notice nResult = iCommunityService.selectNoticeBoardOne(notice);
			model.addAttribute("notice", nResult);
			int nSeq = nResult.getN_seq();
			
			// 쿠키 선언
	        Cookie[] cookies = request.getCookies();
	        
	        // 비교하기 위해 새로운 쿠키
	        Cookie viewCookie = null;
	        
	        // notice 쿠키 등록 확인
	        boolean cookieFlag = false;
	        boolean seqFlag = false;
	 
	        

	 
	        // 쿠키가 있을 경우 
	        if (cookies != null && cookies.length > 0) {
	            for (int i = 0; i < cookies.length; i++) {
	            	
	                // Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌 
	                if (cookies[i].getName().equals("notice")) { 
	                    
	                	//쿠키에 저장된 notice seq 배열에 저장
	                	String[] cookArray =  cookies[i].getValue().split("|");
	                	
	                	for(int j = 0;j< cookArray.length;j++) {
	                		
	                		// 쿠키에 저장된 seq 정보와 받아온 notice seq 정보 비교시 일치한 값이 있을때
	                		if(cookArray[j].equals(Integer.toString(nResult.getN_seq()))) {
	                			seqFlag = true;
	                		}
	                	}
	                	cookieFlag = true;
	                }
	            }
	        }
	        
	        // notice 쿠키가 있을 때
	        if(cookieFlag) {
	        	
	        	// seq가 없을때
	        	if(!seqFlag) {
	        		if (cookies != null && cookies.length > 0) {
	    	            for (int i = 0; i < cookies.length; i++) {
	    	            	if (cookies[i].getName().equals("notice")) { 
	    	            	
		    	                // 쿠키 생성(이름, 값)
		    	                Cookie newCookie = new Cookie("notice", cookies[i].getValue() + "|" + nSeq);
		    	                // 쿠키 추가
		    	                response.addCookie(newCookie);
		    	                
		    	                // notice 조회수 증가시킴
		    	                int result = iCommunityService.noticeCountUp(notice);
		    	                
	    	            	}
	    	            }
	        		}
	        	}
	        	
	        // notice 쿠키가 없을때
	        } else {
	        	// 쿠키 생성(이름, 값)
                Cookie newCookie = new Cookie("notice", "" + nSeq);
                // 쿠키 추가
                response.addCookie(newCookie);

                // notice 조회수 증가시킴
                int result = iCommunityService.noticeCountUp(notice);
	        }

			
			// 사이드 메뉴 'active' 설정 flag
			model.addAttribute("categoryLoc", "community");
			
			return "user/community/user_noticeBoard_detail";
		}

}
