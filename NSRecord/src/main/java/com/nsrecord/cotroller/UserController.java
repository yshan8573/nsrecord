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
		
		return "user/user/user_SignIn";
	}
	
	@RequestMapping(value = "user/userSignInResult")
	public String userSignIn(UserInfo user) {
		logger.info("this is a userlogin Method");
		
		service.insertUser(user);
		
		return "redirect:/user/userlogin";
	}
	
	
	
	
	
	//관리자 페이지 -> 회원리스트 출력
	@RequestMapping(value = "adminUser/adminUserList")
	public String adminUserList(Model model) {
		logger.info("this is a adminUserList Method");
		List<UserInfo> userList =
				service.admin_userList();
		
		model.addAttribute("list",userList);
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "user");
		
		return "admin/user/admin_userList";
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
		
		if(session.getAttribute("loginEmail") != null) {
			session.removeAttribute("loGinUser");
		}
		
		return "redirect:/userHome";
	}
}
