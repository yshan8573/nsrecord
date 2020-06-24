package com.nsrecord.cotroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BasicOpController {
	
	private static final Logger logger = LoggerFactory.getLogger(BasicOpController.class);
	
	@RequestMapping(value = "basicOp/adminMainImg")
	public String adminMainImg(Model model) {
		logger.info("this is a adminMainImg Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "basicOp");
		
		return "admin/basicOp/admin_mainImg";
	}

}
