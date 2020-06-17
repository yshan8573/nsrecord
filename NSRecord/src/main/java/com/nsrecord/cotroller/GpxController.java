package com.nsrecord.cotroller;


import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.SearchDto;
import com.nsrecord.dto.UserInfo;
import com.nsrecord.service.GpxServiceImpl;

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
	public String gpxInsertResult(GpxDto dto, HttpSession sesseion, 
			MultipartFile gpxFile, String g_ori, String g_re, HttpServletRequest re ) throws ParseException {
		logger.info("this is a gpxInsert Method");
		System.out.println("파일인서트");
	
	UserInfo user = (UserInfo) sesseion.getAttribute("loginUser");
//	System.out.println(user.getU_nickname());
	
	//파일 경로 설정
	String saveDir = re.getSession().getServletContext().getRealPath("/resource/uploadGpx");
	File gpx = new File(saveDir);
	if(!gpx.exists()) {
		gpx.mkdir();
	}
	//단일 파일
	if(gpxFile != null && !gpxFile.isEmpty()) {
	
		g_ori = gpxFile.getOriginalFilename();
		String ext = g_ori.substring(g_ori.indexOf("."));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmssSSS");
		int rndNum = (int)(Math.random()*1000);
		g_re = sdf.format(new Date(System.currentTimeMillis()))+"_"+rndNum+ext;
		
		try { 
			 
			gpxFile.transferTo(new File(saveDir+"/"+g_re));
			dto.setG_re(g_re);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//if end
	else {
		dto.setG_re(g_ori);
		
	}
	re.setAttribute("GpxDto", dto);

	System.out.println("g_ori : " + g_ori);
	System.out.println("g_re : " + g_re);
	dto.setU_seq(user.getU_seq());	
	dto.setU_nickname(user.getU_nickname());
	dto.setG_ori(g_ori);
	dto.setG_re(g_re);
	
	gpxServiceImpl.insertGpxBoard(dto);	
	
		
		
	return "redirect:/gpx/gpxBoard";
	}
	
	//상세 조회
	@RequestMapping(value = "gpx/gpxBoardSelectOne")
	public String gpxSelectOne(@RequestParam("g_seq") int g_seq, Model model) {
		logger.info("this is a gpxSelectOne Method");
//		System.out.println("g_seq = "+g_seq);
		
		
		GpxDto GpxDto = 
		gpxServiceImpl.selectGpxBoardOne(g_seq);
		model.addAttribute("GpxDto",GpxDto);
		
		
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
	public String gpxUpdateResut(GpxDto dto, RedirectAttributes redirectAttributes, HttpSession sesseion) {
	
		System.out.println("수정2");
		
	UserInfo user = (UserInfo) sesseion.getAttribute("loginUser");
	dto.setU_seq(user.getU_seq());	
	dto.setU_nickname(user.getU_nickname());
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
	
	
	
	
}//class end
