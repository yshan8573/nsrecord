package com.nsrecord.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.nsrecord.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;

}
