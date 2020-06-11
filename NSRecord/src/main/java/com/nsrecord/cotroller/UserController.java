package com.nsrecord.cotroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		if(result != null && user.getU_email().equals(result.getU_email())) {
			if(user.getU_pwd().equals(result.getU_pwd())) {
				path = "redirect:/userHome";
				session.setAttribute("loginEmail", user.getU_email());
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
			session.removeAttribute("loginEmail");
		}
		
		return "redirect:/userHome";
	}
}
