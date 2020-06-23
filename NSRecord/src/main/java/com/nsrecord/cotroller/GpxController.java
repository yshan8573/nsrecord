package com.nsrecord.cotroller;


import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.nsrecord.common.GpxReader;
import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.GpxReplyDto;
import com.nsrecord.dto.GrcDto;
import com.nsrecord.dto.GurDto;
import com.nsrecord.dto.SearchDto;
import com.nsrecord.dto.UserInfo;
import com.nsrecord.service.GpxService;
import com.nsrecord.service.GpxServiceImpl;

@Controller
public class GpxController {
	
	private static final Logger logger = LoggerFactory.getLogger(GpxController.class);
	
	@Autowired
	private GpxServiceImpl gpxServiceImpl;

	@Autowired
	private GpxService gpxService;
	
	
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
			Model model, HttpSession session) {
		logger.info("this is a userGpxBoardAjax Method");
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("user",user);
		
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

	@RequestMapping(value = "myPage/myGpxBoard")
	public String myGpxBoard(Model model) {
		logger.info("this is a myGpxBoard Method");

		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "myGpx");
		
		return "user/myPage/myGpxBoard";
	}
	
	@RequestMapping(value = "myPage/myGpxRanking")
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
	public String gpxInsertForm(GpxDto dto, Model model, HttpServletRequest req) {
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
	
		// 파일 업로드----------------------------- start
		// 파일이 저장될 디텍토리 설정 
		String prePath = re.getSession().getServletContext().getRealPath("/resources/data/")+"/";
		String pathGpx = prePath + "gpx/gpx";
		
		//단일 파일 유무에 따라 notice 객체 저장
		if(gpxFile != null && !gpxFile.isEmpty()) {
			
			// path : 저장될 파일 경로, upFile : view에서 받아온 file 값
			FileUpload ful = new FileUpload(pathGpx,gpxFile);
			
			dto.setG_ori(ful.getFileOriName());
			dto.setG_re(ful.getFileReName());
		} else {
			dto.setG_ori("");
			dto.setG_re("");
		}

		// 파일 업로드----------------------------- end
	

	
	gpxServiceImpl.insertGpxBoard(dto);	

		
		
	return "redirect:/gpx/gpxBoard";
	}
	
	//조회수 증가
	@RequestMapping(value = "gpx/gpxCount")
	public String gpxCount(int g_seq, Model model, HttpSession session) {
		System.out.println("조회수 증가 컨트롤러"+g_seq);
		gpxServiceImpl.gpxCount(g_seq);
		
		
		return "forward:/gpx/gpxBoardSelectOne";
	}
	
	//추천수 증가
	@RequestMapping(value = "gpx/gpxRecommand")
	public String gpxRecommand(int g_seq, Model model, HttpSession session) {
		
		gpxServiceImpl.gpxRecommand(g_seq);
		
	
		return "forward:/gpx/gpxBoardSelectOne";
	}
	
	
	//상세 조회
	@RequestMapping(value = "gpx/gpxBoardSelectOne")
	public String gpxSelectOne(@RequestParam("g_seq") int g_seq, Model model, 
			HttpSession session, GpxDto dto, HttpServletRequest req, HttpServletResponse res) {
		logger.info("this is a gpxSelectOne Method");
		//		System.out.println("g_seq = "+g_seq);
		model.addAttribute("categoryLoc", "gpx");
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("user",user);
		dto.getU_nickname();	//유저 닉네임 가져오기
		dto.getG_ori();
		dto.getG_re();
		
		GpxDto gpxResult = gpxService.selectGpxBoardOne(g_seq);
		model.addAttribute("gpx", gpxResult);
		
		// 지도 gpx 코스 정보 가져오기
		String prePath = req.getSession().getServletContext().getRealPath("/resources/data/")+"/";
		String pathGpx = prePath + "gpx/gpx";
		String g_re = gpxResult.getG_re();
		List<Map> mapList = GpxReader.read(pathGpx, g_re);
		System.out.println("mapList"+mapList.toString());
		model.addAttribute("mapList", mapList);
		
		
		
//		//해당 게시판 번호를 받아 상세페이지로 넘겨줌
//		GpxDto selectOne = gpxServiceImpl.selectGpxBoardOne(g_seq);
//		ModelAndView view = new ModelAndView();
//		
//		//쿠키 생성
//		Cookie[] cookies = req.getCookies();
//		
//		//비교하기 위한 새로운 쿠키
//		Cookie viewCookie = null;
//		
//		//쿠키가 있을 경우
//		if(cookies != null && cookies.length > 0) {
//			for(int i = 0; i < cookies.length; i++) {
//				
//			//Cookie의 name이 cookie+g_seq와 일치하는 쿠키를 viewCookie에 넣어줌
//			if(cookies[i].getName().equals("cookie"+g_seq)) {
//			System.out.println("처음 쿠키가 생성한 뒤 들어옴");
//			viewCookie = cookies[i];
//			}//if end
//				
//			}//for end
//		}//if end
//		
//		if(selectOne != null) {
//			System.out.println("해당 상세페이지로 넘어감");
//			view.addObject("selectOne", selectOne);
//			//--------------------------------------------------------------------------			
//			//만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직 처리
//			if(viewCookie == null) {
//				System.out.println("쿠키 없음");
//				
//				//쿠키 생성(이름값)
//				Cookie newCookie = new Cookie("cookie"+g_seq, "|"+g_seq+"|");
//				
//				//쿠키 추가
//				res.addCookie(newCookie);
//				
//				//쿠키를 추가시키고 조회수 증가시킴
//				int result = gpxServiceImpl.gpxCount(g_seq);
//				
//				if(result > 0 && dto.getU_seq() != user.getU_seq()) {
//					System.out.println("조회수 증가");
//				} else if(result > 0 && dto.getU_seq() == user.getU_seq()) {
//					System.out.println("조회수 변동 없음");
//				} else {
//					System.out.println("조회수 중가 실패");
//				}
//				
//			}//if end
//			
//			//viewCookie가 null이 아닐 경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음
//			else {
//				System.out.println("cookie 있음");
//				
//				//쿠키 값 받아옴
//				String value = viewCookie.getValue();
//				System.out.println("쿠키값 : "+value);
//			} 
//			
//			view.setViewName("gpxSelectOne");
//			
//		}//if end
		
		
		GpxDto GpxDto = 
		gpxServiceImpl.selectGpxBoardOne(g_seq);
		System.out.println("이값을 확인 : " + GpxDto.toString());
		model.addAttribute("GpxDto",GpxDto);
	
		
		
		
		
		
		
		
		
		System.out.println("파일 이름"+dto.toString());
		
		//댓글 내용
		List<GpxReplyDto> gpxReply = gpxServiceImpl.selectOneReply(g_seq);
		model.addAttribute("GpxReply",gpxReply);
		
		
		return "user/gpx/gpxSelectOne";	
	}
	
	//수정1
	@RequestMapping(value = "gpx/gpxUpdateForm")
	public String gpxUpdateForm(@RequestParam("g_seq") int g_seq, @RequestParam("u_seq") int u_seq, 
			Model model, GpxDto dto, HttpSession sesseion, HttpServletRequest request) {
		
		GpxDto gpxResult = gpxService.selectGpxBoardOne(g_seq);
		model.addAttribute("gpx",gpxResult);
		// 지도 gpx 코스 정보 가져오기
		String prePath = request.getSession().getServletContext().getRealPath("/resources/data/")+"/";
		String pathGpx = prePath + "gpx/gpx";
		String g_re = gpxResult.getG_re();
		List<Map> mapList = GpxReader.read(pathGpx, g_re);
		System.out.println("mapList"+mapList.toString());
		model.addAttribute("mapList", mapList);
	
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
			HttpSession sesseion, HttpServletRequest request, Model model, 
			@RequestParam(value = "gpxFile", required = false) MultipartFile gpxFile) {
	
		System.out.println("수정2");
		GpxDto gpxResult = gpxService.selectGpxBoardOne(dto.getG_seq());
		model.addAttribute("gpx", gpxResult);
		
		
		// 파일 업로드----------------------------- start
		// 파일이 저장될 디텍토리 설정 
		// 지도 gpx 코스 정보 가져오기
		String prePath = request.getSession().getServletContext().getRealPath("/resources/data/")+"/";
		String pathGpx = prePath + "gpx/gpx";
		String g_re = gpxResult.getG_re();
		List<Map> mapList = GpxReader.read(pathGpx, g_re);
		System.out.println("mapList"+mapList.toString());
		model.addAttribute("mapList", mapList);
				
				//단일 파일 유무에 따라 notice 객체 저장
				if(gpxFile != null && !gpxFile.isEmpty()) {
					
					// path : 저장될 파일 경로, upFile : view에서 받아온 file 값
					FileUpload ful = new FileUpload(pathGpx,gpxFile);
					
					dto.setG_ori(ful.getFileOriName());
					dto.setG_re(ful.getFileReName());
				} else {
					dto.setG_ori("");
					dto.setG_re("");
				}

				// 파일 업로드----------------------------- end
		
		
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
	public String gpxDelete(GpxDto dto, HttpSession session) {
		 System.out.println(dto.toString());
		 int g_seq = dto.getG_seq();
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		dto.setU_seq(user.getU_seq());	
		dto.setU_nickname(user.getU_nickname());
		
		GpxDto gpxResult = gpxService.selectGpxBoardOne(g_seq);
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
	
	
	
	//
	@RequestMapping(value = "gpxTestContrller")
	public String gpxTestContrller(HttpServletRequest request) {
		logger.info("this is a gpxTestContrller Method");
		
		String prePath = request.getSession().getServletContext().getRealPath("/resources/data/")+"/";
		String path = prePath + "gpx";
		String g_re = "남산.gpx";
		
		List<Map> gfList = GpxReader.read(path, g_re);
		
		for(Map<String,String> gf : gfList) {
			System.out.println(gf.toString());
		}
		
		return "redirect:/gpx/gpxRanking";
	}
	
	//
	@RequestMapping(value = "adminGpx/adminGpxRankingList")
	public String adminGpxRankingList(Model model) {
		logger.info("this is a adminGpxRankingList Method");

		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return "admin/gpx/admin_gpxRankingList";
	}
	
	// GPX Ranking 리스트 ajax 처리
	@RequestMapping(value = "adminGpx/adminGpxRankingListAjax")
	public String adminGpxRankingListAjax(
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "searchSort", defaultValue = "") String searchSort,
			@RequestParam(value = "searchVal", defaultValue = "") String searchVal,
			Model model) {
		logger.info("this is a adminGpxRankingList Method");

		// 검색 객체 값 넣기
		SearchDto searchDto = new SearchDto(searchSort, searchVal);
		
		// grc 리스트 레코드 갯수 가져오기
		int grcCount = gpxService.selectGrcCount(searchDto);
		
		int curPage = cPage; // 현재 출력 페이지
		
		// 페이지 객체에 값 저장 (nCount: 리스트 총 레코드 갯수 / curPage: 현재 출력 페이지)
		BoardPager boardPager = new BoardPager(grcCount, curPage);
		
		// 페이지 객체에 검색 정보 저장
		boardPager.setSearchSort(searchSort);
		boardPager.setSearchVal(searchVal);
		
		// GPX Ranking 리스트 가져오기
		List<GrcDto> grcResult = gpxService.selectGrcAll(boardPager);
		
		model.addAttribute("grcList",grcResult);
		model.addAttribute("boardPager",boardPager);

		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return "admin/gpx/ajax/admin_gpxRankingList_ajax";
	}
	

	
	@RequestMapping(value = "adminGpx/adminGrcInsert")
	public String adminGrcInsert(Model model) {
		logger.info("this is a adminGrcInsert Method");

		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return "admin/gpx/admin_grcInsert";
	}
	
	@RequestMapping(value = "adminGpx/adminGrcInsertEnd")
	public String adminGrcInsertEnd(
			GrcDto grc,
			@RequestParam(value = "upFile") MultipartFile upFile,
			@RequestParam(value = "upFileImg") MultipartFile upFileImg,
			Model model,
			HttpServletRequest request
			) {
		logger.info("this is a adminGrcInsertEnd Method");
		
		
		// 파일 업로드----------------------------- start
		// 파일이 저장될 디텍토리 설정 
		String prePath = request.getSession().getServletContext().getRealPath("/resources/data/")+"/";
		String pathGpx = prePath + "gpxRanking/gpx";
		
		//단일 파일 유무에 따라 notice 객체 저장
		if(upFile != null && !upFile.isEmpty()) {
			
			// path : 저장될 파일 경로, upFile : view에서 받아온 file 값
			FileUpload ful = new FileUpload(pathGpx,upFile);
			
			grc.setGrc_gpxOri(ful.getFileOriName());
			grc.setGrc_gpxRe(ful.getFileReName());
		} else {
			grc.setGrc_gpxOri("");
			grc.setGrc_gpxRe("");
		}
		
		// 파일이 저장될 디텍토리 설정 
		String pathImg = prePath + "gpxRanking/img";
		
		//단일 파일 유무에 따라 notice 객체 저장
		if(upFileImg != null && !upFileImg.isEmpty()) {
			
			// path : 저장될 파일 경로, upFile : view에서 받아온 file 값
			FileUpload ful = new FileUpload(pathImg,upFileImg);
			
			grc.setGrc_imgOri(ful.getFileOriName());
			grc.setGrc_imgRe(ful.getFileReName());
		} else {
			grc.setGrc_imgOri("");
			grc.setGrc_imgRe("");
		}
		// 파일 업로드----------------------------- end
		
		int insertResult = gpxService.insertGrc(grc);


		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return "redirect:/adminGpx/adminGpxRankingList";
	}
	
	
	
	@RequestMapping(value = "adminGpx/adminGpxRankingListDetail")
	public String adminGpxRankingListDetail(GrcDto grc, Model model, HttpServletRequest request) {
		logger.info("this is a adminGpxRankingListDetail Method");
		
		GrcDto grcResult = gpxService.selectGrcOne(grc);
		model.addAttribute("grc", grcResult);
		
		// 지도 gpx 코스 정보 가져오기
		String prePath = request.getSession().getServletContext().getRealPath("/resources/data/")+"/";
		String path = prePath + "gpxRanking/gpx";
		String g_re = grcResult.getGrc_gpxRe();
		List<Map> mapList = GpxReader.read(path, g_re);
		model.addAttribute("mapList", mapList);
		
		// gur 정보 가져오기
		List<GurDto> gurList = gpxService.selectGurListAdmin(grcResult);
		model.addAttribute("gurList", gurList);
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return "admin/gpx/admin_gpxRankingList_detail";
	}
	
	@RequestMapping(value = "/adminGpx/adminGrcUpdateEnd")
	public String adminGrcUpdateEnd(GrcDto grc, Model model) {
		logger.info("this is a adminGrcUpdateEnd Method");
		
		int result = gpxService.updateGrc(grc);
		
		String path = "common/msg";
		String loc = "";
		if(result > 0) {
			loc = "/adminGpx/adminGpxRankingListDetail?grc_seq="+grc.getGrc_seq();
			model.addAttribute("msg","수정 완료");
			model.addAttribute("loc",loc);

		} else {
			loc = "/adminGpx/adminGpxRankingListDetail?grc_seq="+grc.getGrc_seq();
			model.addAttribute("msg","수정 실패");
			model.addAttribute("loc",loc);
		}
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return path;
	}
	
	@RequestMapping(value = "/adminGpx/adminGrcDeleteEnd")
	public String adminGrcDeleteEnd(GrcDto grc, Model model) {
		logger.info("this is a adminGrcDeleteEnd Method");
		
		// 파일 삭제를 위해 GRC 정보 가져오기
		GrcDto grcResult = gpxService.selectGrcOne(grc);
		
		int result = gpxService.deleteGrc(grcResult);
		
		String path = "common/msg";
		String loc = "";
		if(result > 0) {
			loc = "/adminGpx/adminGpxRankingList";
			model.addAttribute("msg","삭제 완료");
			model.addAttribute("loc",loc);
			
		} else {
			loc = "/adminGpx/adminGpxRankingListDetail?grc_seq="+grc.getGrc_seq();
			model.addAttribute("msg","삭제 실패");
			model.addAttribute("loc",loc);
		}
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return path;
	}
	
	@RequestMapping(value = "gpx/gpxRanking")
	public String gpxRanking(Model model) {
		logger.info("this is a gpxRanking Method");

		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return "user/gpx/gpxRanking";
	}
	
	// GPX Ranking 리스트 ajax 처리
	@RequestMapping(value = "gpx/userGpxRankingListAjax")
	public String userGpxRankingListAjax(
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "searchSort", defaultValue = "") String searchSort,
			@RequestParam(value = "searchVal", defaultValue = "") String searchVal,
			Model model) {
		logger.info("this is a userGpxRankingListAjax Method");

		// 검색 객체 값 넣기
		SearchDto searchDto = new SearchDto(searchSort, searchVal);
		
		// grc 리스트 레코드 갯수 가져오기
		int grcCount = gpxService.selectGrcCount(searchDto);
		
		int curPage = cPage; // 현재 출력 페이지
		
		// 페이지 객체에 값 저장 (nCount: 리스트 총 레코드 갯수 / curPage: 현재 출력 페이지)
		BoardPager boardPager = new BoardPager(grcCount, curPage);
		
		// 페이지 객체에 검색 정보 저장
		boardPager.setSearchSort(searchSort);
		boardPager.setSearchVal(searchVal);
		
		// GPX Ranking 리스트 가져오기
		List<GrcDto> grcResult = gpxService.selectGrcAll(boardPager);
		
		model.addAttribute("grcList",grcResult);
		model.addAttribute("boardPager",boardPager);

		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return "user/gpx/ajax/user_gpxRankingList_ajax";
	}
	
	@RequestMapping(value = "gpx/userGpxRankingListDetail")
	public String userGpxRankingListDetail(GrcDto grc, Model model, HttpServletRequest request, HttpSession session) {
		logger.info("this is a userGpxRankingListDetail Method");
		
		GrcDto grcResult = gpxService.selectGrcOne(grc);
		model.addAttribute("grc", grcResult);
		
		// 지도 gpx 코스 정보 가져오기
		String prePath = request.getSession().getServletContext().getRealPath("/resources/data/")+"/";
		String path = prePath + "gpxRanking/gpx";
		String g_re = grcResult.getGrc_gpxRe();
		List<Map> mapList = GpxReader.read(path, g_re);
		model.addAttribute("mapList", mapList);
		
		// gur 정보 가져오기
		List<GurDto> gurList = gpxService.selectGurListAdmin(grcResult);
		model.addAttribute("gurList", gurList);
		
		// user gur 정보 가져오기
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		if(user != null) {
			GurDto gur = new GurDto();
			gur.setU_seq(user.getU_seq());
			gur.setGrc_seq(grcResult.getGrc_seq());
			GurDto gurUser = gpxService.selectGurListUser(gur);
			model.addAttribute("gurUser", gurUser);
		}
		
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return "user/gpx/gpxRankingList_detail";
	}
	
	
	@RequestMapping(value = "userMyGpxBoardAjax")
	public String gpxMyPage(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "searchSort", defaultValue = "") String searchSort,
			@RequestParam(value = "searchVal", defaultValue = "") String searchVal,
			Model model, GpxDto dto, HttpSession session) {
		
		logger.info("this is a userMyGpxBoardAjax Method");
		
		UserInfo user = (UserInfo) session.getAttribute("loginUser");
		model.addAttribute("user",user);
		dto.getU_seq();
		
		// 검색 객체 값 넣기
		SearchDto searchDto = new SearchDto(searchSort, searchVal);
		
		// gpx 리스트 레코드 갯수 가져오기
		int gpxCount = gpxServiceImpl.selectGpxBoardCount(searchDto);
		
		int curPage = cPage; // 현재 출력 페이지
		
		// 페이지 객체에 값 저장 (nCount: 리스트 총 레코드 갯수 / curPage: 현재 출력 페이지)
		BoardPager boardPager = new BoardPager(gpxCount, curPage);
		
		// 페이지 객체에 검색 정보 저장
		boardPager.setSearchSort(searchSort);
		boardPager.setSearchVal(searchVal);
		boardPager.setU_seq(user.getU_seq());
		
		// MYGPX 리스트 가져오기
		List<GpxDto> gpxResult = gpxServiceImpl.selectMyGpxAllList(boardPager);
		
		System.out.println(gpxResult);
		
		model.addAttribute("myGpxList",gpxResult);
		model.addAttribute("boardPager",boardPager);

		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return "user/gpx/ajax/user_myGpxBoard_ajax";
	}
	
	
	
	
	
}//class end
