package com.nsrecord.cotroller;


import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.GpxReplyDto;
import com.nsrecord.dto.SearchDto;
import com.nsrecord.dto.UserInfo;
import com.nsrecord.service.GpxServiceImpl;
import com.sun.org.apache.regexp.internal.recompile;

@Controller
public class GpxController {
	
	private static final Logger logger = LoggerFactory.getLogger(GpxController.class);
	
	@Autowired
	private GpxServiceImpl gpxServiceImpl;
	
	
	
	@RequestMapping(value = "gpx/gpxBoard")
	public String gpxBoard(Model model) {
		logger.info("this is a gpxBoard Method");

		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return "user/gpx/gpxBoard";
	}

	@RequestMapping(value = "usergpx/userGpxBoardAjax")
	public String userGpxBoardAjax(@RequestParam(value = "cPage", defaultValue = "1") int cPage,	//디폴트값 설정 -> 400Error 방지
			@RequestParam(value = "searchSort", defaultValue = "") String searchSort,
			@RequestParam(value = "searchVal", defaultValue = "") String searchVal,
			Model model) {
		logger.info("this is a userGpxBoardAjax Method");

		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		//검색 객체 값 넣기
		SearchDto searchDto = new SearchDto(searchSort, searchVal);
		
		//GPX리스트 총 레코드 가져오기
		int nCount = gpxServiceImpl.selectGpxBoardCount(searchDto);
		
		int curPage = cPage; //현재 출력 페이지
		
		//페이지 객체에 값 저장 (nCount: 리슽 총 레코드 갯수 / curPage: 현재 출력 페이지)
		BoardPager boardPager = new BoardPager(nCount, curPage);
		
		//페이지 객체에 검색 정보 저장
		boardPager.setSearchSort(searchSort);
		boardPager.setSearchVal(searchVal);

		
		//gpxBoard 전체 리스트 출력
		List<GpxDto> gpxBoardAllList =
				gpxServiceImpl.selectGpxBoardAllList(boardPager);
		
		model.addAttribute("gpxList", gpxBoardAllList);
		model.addAttribute("boardPager",boardPager);
		
		return "user/gpx/ajax/user_gpxBoard_ajax";
	}
	
	@RequestMapping(value = "gpx/gpxRanking")
	public String gpxRanking(Model model) {
		logger.info("this is a gpxRanking Method");

		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return "user/gpx/gpxRanking";
	}
	
	@RequestMapping(value = "gpx/myGpxBoard")
	public String myGpxBoard(Model model) {
		logger.info("this is a myGpxBoard Method");

		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "myGpx");
		
		return "user/myPage/myGpxBoard";
	}
	
	@RequestMapping(value = "gpx/myGpxRanking")
	public String myGpxRanking(Model model) {
		logger.info("this is a myGpxRanking Method");

		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "myGpx");
		
		return "user/myPage/myGpxRanking";
	}
	
	@RequestMapping(value = "adminGpx/adminGpxList")
	public String adminGpxList(Model model) {
		logger.info("this is a adminGpxList Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return "admin/gpx/admin_gpxList";
	}
	
	
	//유저 글쓰기 폼
	@RequestMapping(value = "gpx/gpxInsertForm")
	public String gpxInsertForm() {
		logger.info("this is a gpxInsertForm Method");
			
		
		
		
	return "user/gpx/gpxInsertForm";
	}
	
	
	//유저 글쓰기 폼 결과 = redirect를 통해 gpxBoard로 이동
	@RequestMapping(value = "gpx/gpxInsertResult")
	public String gpxInsertResult(@RequestParam(value = "gpxFile", required = false) MultipartFile gpxFile, GpxDto dto, HttpSession sesseion, 
	HttpServletRequest re, Model model) throws ParseException {
		logger.info("this is a gpxInsert Method");
		UserInfo user = (UserInfo) sesseion.getAttribute("loginUser");
		dto.setU_seq(user.getU_seq());	
		dto.setU_nickname(user.getU_nickname());
		System.out.println("파일인서트");
	
	
//	System.out.println(user.getU_nickname());
	
	//파일 업로드 -----------------------------start
	//파일 경로 설정
	String path = "gpx";
	System.out.println(gpxFile);
	
	//단일 파일 유무에 따라 gpx객체 저장
	if(gpxFile !=null && !gpxFile.isEmpty()) {
		
	//path : 저장될 파일 경로, gpxFile : view에서 받아온 file값
	FileUpload ful = new FileUpload(path, gpxFile);
	
	dto.setG_ori(ful.getFileOriName());
	dto.setG_re(ful.getFileReName());
	
	} else {
		dto.setG_ori("");
		dto.setG_re("");
		
	}
//파일 업로드 --------------------------------end
	

	
	gpxServiceImpl.insertGpxBoard(dto);	

		
		
	return "redirect:/gpx/gpxBoard";
	}
	
	//상세 조회
	@RequestMapping(value = "gpx/gpxBoardSelectOne")
	public String gpxSelectOne(@RequestParam("g_seq") int g_seq, Model model, 
			HttpSession session, GpxDto dto) {
		logger.info("this is a gpxSelectOne Method");
		//		System.out.println("g_seq = "+g_seq);
		
		
		
		
		
		
		GpxDto GpxDto = 
		gpxServiceImpl.selectGpxBoardOne(g_seq);
		System.out.println("이값을 확인 : " + GpxDto.toString());
		model.addAttribute("GpxDto",GpxDto);
	
		
		
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("user",user);
		dto.getU_nickname();	//유저 닉네임 가져오기
		dto.getG_ori();
		dto.getG_re();
		
		
		
		
		System.out.println("파일 이름"+dto.toString());
		
		//댓글 내용
		List<GpxReplyDto> gpxReply = gpxServiceImpl.selectOneReply(g_seq);
		model.addAttribute("GpxReply",gpxReply);
		
		
		return "user/gpx/gpxSelectOne";	
	}
	
	//수정1
	@RequestMapping(value = "gpx/gpxUpdateForm")
	public String gpxUpdateForm(@RequestParam("g_seq") int g_seq, @RequestParam("u_seq") int u_seq, Model model, GpxDto dto, HttpSession sesseion) {
	
	
	UserInfo user = (UserInfo) sesseion.getAttribute("loginUser");
	dto.setU_seq(user.getU_seq());	
	dto.setU_nickname(user.getU_nickname());
	dto.setU_seq(user.getU_seq());
	System.out.println("수정1 = "+dto.getU_seq());
	GpxDto GpxDto = 
	gpxServiceImpl.selectGpxBoardOne(g_seq);
	model.addAttribute("GpxDto",GpxDto);
	
	
	return "user/gpx/gpxUpdate";	
	}
	
	//수정2
	@RequestMapping(value = "gpx/gpxUpdate")
	public String gpxUpdateResut(GpxDto dto, RedirectAttributes redirectAttributes, 
			HttpSession sesseion, @RequestParam(value = "gpxFile", required = false) MultipartFile gpxFile) {
	
		System.out.println("수정2");
		
		//파일 업로드 -----------------------------start
		//파일 경로 설정
		String path = "gpx";
		System.out.println(gpxFile);
		
		//단일 파일 유무에 따라 gpx객체 저장
		if(gpxFile !=null && !gpxFile.isEmpty()) {
			
		//path : 저장될 파일 경로, gpxFile : view에서 받아온 file값
		FileUpload ful = new FileUpload(path, gpxFile);
		
		dto.setG_ori(ful.getFileOriName());
		dto.setG_re(ful.getFileReName());
		
		} else {
			dto.setG_ori("");
			dto.setG_re("");
			
		}
	//파일 업로드 --------------------------------end
		
		
	UserInfo user = (UserInfo) sesseion.getAttribute("loginUser");
	dto.setU_seq(user.getU_seq());	
	dto.setU_nickname(user.getU_nickname());
	dto.getG_ori();
	System.out.println("파일추가수정 = "+dto.toString());
	gpxServiceImpl.updateGpxBoardUpdate(dto);	
		
	redirectAttributes.addAttribute("g_seq", dto.getG_seq());	
		
	return "redirect:/gpx/gpxBoardSelectOne";	
	}
	
	//삭제
	@RequestMapping( value = "gpx/gpxDelete")
	public String gpxDelete(@RequestParam("u_seq") int u_seq, 
			@RequestParam("g_seq") int g_seq, GpxDto dto, HttpSession session) {
		 
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		dto.setU_seq(user.getU_seq());	
		dto.setU_nickname(user.getU_nickname());
		gpxServiceImpl.deleteGpxBoard(g_seq);
		
		
		return "redirect:/gpx/gpxBoard";
	}
	
	//댓글 등록
	@RequestMapping(value = "gpxBoardReply")
	public String gpxreply(GpxReplyDto dtoreply, RedirectAttributes redirectAttribute, 
			HttpSession session, GpxDto dto) {
		
		System.out.println("GPXREPLYCon"+dtoreply.toString());
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		dto.setU_seq(user.getU_seq());
		dto.setU_nickname(user.getU_nickname());
		dto.setG_seq(dto.getG_seq());
		
		gpxServiceImpl.insertGpxReply(dtoreply);
		
		redirectAttribute.addAttribute("g_seq", dto.getG_seq());
		return "redirect:/gpx/gpxBoardSelectOne";
	}
	
	//댓글 수정
	@RequestMapping(value = "gpx/gpxUpdateReply")
	public String gpxReplyUpdate(@RequestParam HashMap<String, String> paramMap, RedirectAttributes redirectAttribute,
			HttpSession session) {
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
	
		gpxServiceImpl.gpxReplyUpdate(paramMap);
		
		redirectAttribute.addAttribute("g_seq", paramMap.get("g_seq"));
		
		return "redirect:/gpx/gpxBoardSelectOne";
	}
	
	//댓글 삭제
	@RequestMapping(value = "gpx/gpxDeleteReply")
	public String gpxReplyDelete(@RequestParam("gr_seq") int gr_seq, GpxDto dto, HttpSession session, RedirectAttributes redirectAttribute) {
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		System.out.println("Controller"+gr_seq);
		
	
		gpxServiceImpl.deleteGpxReply(gr_seq);
		
		
		redirectAttribute.addAttribute("g_seq", dto.getG_seq());
		System.out.println(dto.toString());
		System.out.println("접근?");
		return "redirect:/gpx/gpxBoardSelectOne";
	}
	
	//조회수 올리기 작업중
	@RequestMapping(value = "gpx/gpxCount")
	public String gpxCount(@RequestParam("g_seq") int g_seq, HttpSession session, HttpServletRequest re, Model model) {
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		
		//조회수 작업중
				int userSeq = user.getU_seq();
				GpxDto gpxDto = new GpxDto();
				
				try {
				
					gpxDto = gpxServiceImpl.selectGpxBoardOne(userSeq);
					if(gpxDto.getU_seq() != userSeq) {
					gpxServiceImpl.gpxCount(g_seq);	
					}
					System.out.println(gpxDto.getG_seq());
					
				} catch (Exception e) {
					e.printStackTrace();
				}
		model.addAttribute("g_seq", g_seq);
		
		
		return "redirect:/gpx/gpxBoardSelectOne";
	}
	
	
	
}//class end
