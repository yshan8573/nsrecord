package com.nsrecord.cotroller;

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

import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.UserInfo;
import com.nsrecord.service.GpxServiceImpl;

@Controller
public class GpxController {
	
	private static final Logger logger = LoggerFactory.getLogger(GpxController.class);
	
	@Autowired
	private GpxServiceImpl gpxServiceImpl;
	
	
	
	@RequestMapping(value = "gpx/gpxBoard")
	public String gpxBoard(Model model) {
		logger.info("this is a userlogin Method");

		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		
		//gpxBoard 전체 리스트 출력
		List<GpxDto> gpxBoardAllList =
				gpxServiceImpl.selectGpxBoardAllList();
		model.addAttribute("gpxList", gpxBoardAllList);
		
		
		
		
		return "user/gpx/gpxBoard";
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
	public String gpxInsertResult(GpxDto dto, HttpSession sesseion) {
		logger.info("this is a gpxInsert Method");
		
	
	UserInfo user = (UserInfo) sesseion.getAttribute("loginUser");
	System.out.println(user.getU_nickname());
	
	dto.setU_seq(user.getU_seq());	
	dto.setU_nickname(user.getU_nickname());
	
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
	
	//수정중
	//조건 조회
	@RequestMapping(value = "gpx/gpxWhere")
	public String gpxWhere(@RequestParam("search") String search, @RequestParam GpxDto dto, Model model, HttpSession session) {
		System.out.println("조건조회컨트롤러");
		
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		dto.setU_nickname(user.getU_nickname());
		
		
		List<GpxDto> gpxWhereList = 
				gpxServiceImpl.gpxWhereList();
		model.addAttribute("gpxWhereList", gpxWhereList);
		
		return "user/gpx/gpxWhere";
	}
	
	
}//class end
