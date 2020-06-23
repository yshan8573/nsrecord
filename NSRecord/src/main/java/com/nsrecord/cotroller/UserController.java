package com.nsrecord.cotroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.SearchDto;
import com.nsrecord.dto.UserInfo;
import com.nsrecord.service.UserService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService service;

	@RequestMapping(value = "user/userlogin")
	public String userlogin() {
		logger.info("this is a userlogin Method");
		
		return "user/user/user_login";
	}
	
//	 회원가입 폼 페이지
	@RequestMapping(value = "user/userSignIn")
	public String userSignIn() {
		logger.info("this is a userlogin Method");
		
		return "user/user/user_SignUp";
	}
	
	@RequestMapping(value = "user/userSignInResult")
	public String userSignIn(UserInfo user) throws Exception {
		logger.info("this is a userlogin Method");
		
		service.insertUser(user);
		
		return "redirect:/user/userlogin";
	}
	
	// 회원 정보 수정
	@RequestMapping(value="user/userUpdateView")
	public String userUpdateView() throws Exception{
			
		return "user/myPage/user_myUserInfo";
	}

	@RequestMapping(value="user/userUpdate")
	public String userUpdate(HttpSession session, UserInfo user) throws Exception{
		
		service.updateUser(user);
		
		session.invalidate();
			
		return "redirect:/user/userlogin";
	}
	
	// 회원 정보 삭제
	@RequestMapping(value="user/userDeleteView")
	public String userDeleteView() throws Exception{
			
		return "user/myPage/user_delete";
	}

	@RequestMapping(value="user/userDelete")
	public String userDelete(HttpSession session, UserInfo user, RedirectAttributes rttr) throws Exception{
		
		UserInfo member = (UserInfo) session.getAttribute("loginUser");
		
		String oldPass = member.getU_pwd();
		String newPass = user.getU_pwd();
		
		if(!(oldPass.equals(newPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/user/userDeleteView";
		}
		
		service.deleteUser(user);
		session.invalidate();
			
		return "redirect:/user/userlogin";
	}

	
//	이메일 중복체크
	@RequestMapping(value = "/user/idcheck", method = RequestMethod.GET)
	@ResponseBody
	public String idcheck(@RequestParam("u_email") String u_email) throws Exception {
		
		int result = service.idcheck(u_email);
		String msg;
		if(result > 0) {
			msg = "1";
		} else {
			msg = "0";
		}
		
		return msg;  
	}
//	닉네임 중복체크
	@RequestMapping(value = "/user/nickcheck", method = RequestMethod.GET)
	@ResponseBody
	public String nickcheck(@RequestParam("u_nickname") String u_nickname) throws Exception{
		
		int result = service.nickcheck(u_nickname.trim()) ;
		String msg;
		if(result > 0) {
			msg = "1";
		} else {
			msg = "0";
		}
		
		return msg;  
	}
	
	
	@RequestMapping(value = "adminUser/adminUserList")
	public String adminUSer(Model model) {
		
		model.addAttribute("categoryLoc", "user");
		
		return "admin/user/admin_user";
	}
	
	
	//관리자 페이지 -> 회원리스트 출력
	@RequestMapping(value = "adminUser/adminUserListAjax")
	public String adminUserList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,	//디폴트값 설정 -> 400Error 방지
			@RequestParam(value = "searchSort", defaultValue = "") String searchSort,
			@RequestParam(value = "searchVal", defaultValue = "") String searchVal,
			Model model) throws Exception{
		logger.info("this is a adminUserList Method") ;
		
		
		//검색 객체 값 넣기
				SearchDto searchDto = new SearchDto(searchSort, searchVal);
				
				//GPX리스트 총 레코드 가져오기
				int nCount = service.selectUserListCount(searchDto);
				
				int curPage = cPage; //현재 출력 페이지
				
				//페이지 객체에 값 저장 (nCount: 리슽 총 레코드 갯수 / curPage: 현재 출력 페이지)
				BoardPager boardPager = new BoardPager(nCount, curPage);
				
				//페이지 객체에 검색 정보 저장
				boardPager.setSearchSort(searchSort);
				boardPager.setSearchVal(searchVal);
				
			
		
		
		
		
		List<UserInfo> userList =
				service.admin_userList(boardPager);
		
//		System.out.println("리스트"+userList);
		model.addAttribute("list",userList);
		model.addAttribute("boardPager", boardPager);
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "user");
		
		return "admin/user/admin_userListAjax";
	}
	
	@RequestMapping(value = "adminUser/adminUserLeaveList")
	public String adminUserLeaveList(Model model) {
		logger.info("this is a adminUserLeaveList Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "user");
		
		return "admin/user/admin_userLeaveList";
	}
	
	@RequestMapping(value = "user/userloginEnd")
	public String userloginEnd(Model model, UserInfo user, HttpSession session) {
		logger.info("this is a userloginEnd Method");
		
		UserInfo result = service.userSelectOne(user);
		
		String path = "";
		if(result != null) {
			if(user.getU_pwd().equals(result.getU_pwd())) {
				path = "redirect:/userHome";

				session.setAttribute("loginUser", result);
				//session.setMaxInactiveInterval(20*60); //초단위(20분)

			} else {
				path = "common/msg";
				model.addAttribute("msg","비밀번호를 다시 입력해 주시기 바랍니다.");
				model.addAttribute("loc","/user/userlogin");
			}
		} else {
			path = "common/msg";
			model.addAttribute("msg","이메일를 다시 입력해 주시기 바랍니다.");
			model.addAttribute("loc","/user/userlogin");
		}
		
		return path;
	}
	
	@RequestMapping(value = "user/userlogout")
	public String userlogout(HttpSession session) {
		logger.info("this is a userlogout Method");
		
		if(session.getAttribute("loginUser") != null) {
			session.removeAttribute("loginUser");
		}
		
		return "redirect:/userHome";
	}
	
	@RequestMapping(value = "myPage/myUserInfo")
	public String myUserInfo(Model model) {
		logger.info("this is a myUserInfo Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "myUser");
		
		
		return "user/myPage/user_myUserInfo";
	}
	
}
