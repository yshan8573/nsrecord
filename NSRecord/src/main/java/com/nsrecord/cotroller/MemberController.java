package com.nsrecord.cotroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nsrecord.dto.Member;
import com.nsrecord.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;

	@RequestMapping(value = "member/userlogin")
	public String userlogin() {
		
		return "user/member/user_login";
	}
	
	@RequestMapping(value = "member/userloginEnd")
	public String memberloginEnd(Member member, HttpSession session) {
		
		Member result = service.memberSelectOne(member);
		if(result != null) {
			session.setAttribute("loginEmail", member.getM_email());
		}
		
		return "redirect:/userHome";
	}
	
	@RequestMapping(value = "member/userlogout")
	public String userlogout(HttpSession session) {
		
		if(session.getAttribute("loginEmail") != null) {
			session.removeAttribute("loginEmail");
		}
		
		return "redirect:/userHome";
	}
}
