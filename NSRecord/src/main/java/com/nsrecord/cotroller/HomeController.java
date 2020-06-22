package com.nsrecord.cotroller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nsrecord.common.GurData;
import com.nsrecord.dao.GpxDao;
import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.GrcDto;
import com.nsrecord.dto.GurDto;
import com.nsrecord.dto.UserInfo;
import com.nsrecord.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private UserService service;
	
	@Autowired
	private GpxDao gpxDao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
	@RequestMapping(value = "/staravaSample")
	public String staravaSample(Model model) {
		logger.info("this is a staravaSample Method");
		
		return "stravaSample/stravaHome";
	}
	
	@RequestMapping(value = "/userHome")
	public String userHome(Model model) {
		logger.info("this is a userHome Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "home");
		
		return "user/user_home";
	}
	
	@RequestMapping(value = "/adminHome")
	public String adminHome(Model model) {
		logger.info("this is a adminHome Method");
		
		// 사이드 메뉴 'active' 설정 flag
		model.addAttribute("categoryLoc", "home");
		
		return "admin/admin_home";
	}
	
	@RequestMapping(value = "/admin")
	public String admin(Model model) {
		logger.info("this is a admin Method");
		
		return "admin/login/adminLogin";
	}
	
	@RequestMapping(value = "/adminLoginEnd")
	public String adminLoginEnd(UserInfo user, Model model, HttpSession session) {
		logger.info("this is a adminLoginEnd Method");
		
		UserInfo result = service.userSelectOne(user);
		
		String path = "";
		if(result != null) {
			if(user.getU_email().equals("admin")) {
				if(user.getU_pwd().equals(result.getU_pwd())) {
					path = "redirect:/adminHome";
					session.setAttribute("loginUser", result);
					//session.setMaxInactiveInterval(20*60); //초단위(20분)

				} else {
					path = "common/msg";
					model.addAttribute("msg","비밀번호를 다시 입력해 주시기 바랍니다.");
					model.addAttribute("loc","/admin");
				}
			} else {
				path = "common/msg";
				model.addAttribute("msg","이메일를 다시 입력해 주시기 바랍니다.");
				model.addAttribute("loc","/admin");
			}

		} else {
			path = "common/msg";
			model.addAttribute("msg","이메일를 다시 입력해 주시기 바랍니다.");
			model.addAttribute("loc","/admin");
		}
		
		
		return path;
	}
	
	@RequestMapping(value = "/adminLogout")
	public String adminLogout(UserInfo user, Model model, HttpSession session) {
		logger.info("this is a adminLogout Method");

		if(session.getAttribute("loginUser") != null) {
			session.removeAttribute("loginUser");
		}
		
		return "redirect:/admin";
	}
	
	@RequestMapping(value = "/testGurData")
	public String testGurData(UserInfo user, Model model, HttpSession session) {
		logger.info("this is a testGurData Method");
		
		GpxDto gpx = gpxDao.selectGpxBoardOne(1);
		List<GrcDto> grcList = gpxDao.selectGrcAll();
		
		GrcDto grc = grcList.get(0);
		String[] grcStart =  grc.getGrc_start().split(",");
		System.out.println("grcStart : " + grcStart[0]);
		double grcLat = Double.parseDouble(grcStart[0]);
		System.out.println("grcLat : " + grcLat);
		String grcLatS = Double.toString(grcLat);
		System.out.println("grcLatS : " + grcLatS);
		
		//GurDto gur = GurData.read(gpx,grcList);
		
		return "redirect:/userHome";
	}
	
}
