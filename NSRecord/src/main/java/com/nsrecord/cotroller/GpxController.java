package com.nsrecord.cotroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GpxController {
	
	private static final Logger logger = LoggerFactory.getLogger(GpxController.class);
	
	@RequestMapping(value = "gpx/gpxBoard")
	public String gpxBoard(Model model) {
		logger.info("this is a userlogin Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "gpx");
		
		return "user/gpx/gpxBoard";
	}

}
