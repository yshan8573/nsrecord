package com.nsrecord.cotroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nsrecord.dto.UserInfo;
import com.nsrecord.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService service;

	@RequestMapping(value = "user/userlogin")
	public String userlogin() {
		
		return "user/user/user_login";
	}
	
	@RequestMapping(value = "user/userloginEnd")
	public String userloginEnd(UserInfo user, HttpSession session) {
		
		UserInfo result = service.userSelectOne(user);
		if(result != null) {
			session.setAttribute("loginEmail", user.getU_email());
		}
		
		return "redirect:/userHome";
	}
	
	@RequestMapping(value = "user/userlogout")
	public String userlogout(HttpSession session) {
		
		if(session.getAttribute("loginEmail") != null) {
			session.removeAttribute("loginEmail");
		}
		
		return "redirect:/userHome";
	}
}
