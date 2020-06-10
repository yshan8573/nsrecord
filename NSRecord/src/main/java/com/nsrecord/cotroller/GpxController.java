package com.nsrecord.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GpxController {
	
	@RequestMapping(value = "gpx/gpxBoard")
	public String gpxBoard(Model model) {
		
		model.addAttribute("categoryLoc", "gpx");
		return "user/gpx/gpxBoard";
	}

}
