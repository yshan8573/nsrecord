package com.nsrecord.common;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class GpxFileChangeBox {
	
	/*private final static String prePath = "C:/ProjectData/";*/

	@RequestMapping(value = "/grcFileChange", method = RequestMethod.POST)
	public String grcFileChange(
			@RequestParam("upFile") MultipartFile upFile,
			Model model,
			HttpServletRequest request
			) {
		
		String prePath = request.getSession().getServletContext().getRealPath("/resources/data/")+"/";
		
		String fileName = "";

		// 파일 업로드----------------------------- start
		// 파일이 저장될 디텍토리 설정
		String path = prePath + "temp";
		System.out.println(path);

		// 단일 파일 유무에 따라 temp 객체 저장
		if (upFile != null && !upFile.isEmpty()) {
			// path : 저장될 파일 경로, upFile : view에서 받아온 file 값
			FileUpload ful = new FileUpload(path, upFile);

			fileName = ful.getFileReName();

		}
		// 파일 업로드----------------------------- end

		// GPX 파일 정보 list에 저장
		List<Map> mapList = GpxReader.read(path, fileName);

		// 임시 GPX 파일 삭제 --------------- start
		File file = new File(path + "/" + fileName);
		
		if (file.exists()) {
			if (file.delete()) {
				System.out.println("파일삭제 성공 : " + fileName);
			} else {
				System.out.println("파일삭제 실패");
			}
		} else {
			System.out.println("파일이 존재하지 않습니다.");
		}
		// 임시 GPX 파일 삭제 --------------- end
		
		
		model.addAttribute("mapList", mapList);

		return "admin/gpx/ajax/grcFileChange";
	}
	
	@RequestMapping(value = "/gpxFileChange", method = RequestMethod.POST)
	public String gpxFileChange(
			@RequestParam("gpxFile") MultipartFile upFile,
			Model model,
			HttpServletRequest request
			) {
		
		String prePath = request.getSession().getServletContext().getRealPath("/resources/data/")+"/";
		
		String fileName = "";

		// 파일 업로드----------------------------- start
		// 파일이 저장될 디텍토리 설정
		String path = prePath + "temp";
		System.out.println(path);

		// 단일 파일 유무에 따라 temp 객체 저장
		if (upFile != null && !upFile.isEmpty()) {
			// path : 저장될 파일 경로, upFile : view에서 받아온 file 값
			FileUpload ful = new FileUpload(path, upFile);

			fileName = ful.getFileReName();

		}
		// 파일 업로드----------------------------- end

		// GPX 파일 정보 list에 저장
		List<Map> mapList = GpxReader.read(path, fileName);

		// 임시 GPX 파일 삭제 --------------- start
		File file = new File(path + "/" + fileName);
		
		if (file.exists()) {
			if (file.delete()) {
				System.out.println("파일삭제 성공 : " + fileName);
			} else {
				System.out.println("파일삭제 실패");
			}
		} else {
			System.out.println("파일이 존재하지 않습니다.");
		}
		// 임시 GPX 파일 삭제 --------------- end
		
		
		model.addAttribute("mapList", mapList);

		return "user/gpx/ajax/gpxFileChange";
	}	


	@RequestMapping(value = "/imgFileChange", method = RequestMethod.POST)
	@ResponseBody
	public String imgFileChange(
			@RequestParam(value = "upFile1", required = false) MultipartFile upFile1,
			@RequestParam(value = "upFile2", required = false) MultipartFile upFile2,
			@RequestParam(value = "upFile3", required = false) MultipartFile upFile3,
			Model model,
			HttpServletRequest request
			) {

		// 파일 업로드----------------------------- start
		// 파일이 저장될 디텍토리 설정
		String path = request.getSession().getServletContext().getRealPath("/resources/img/")+"/";

		// upFile1
		if (upFile1 != null && !upFile1.isEmpty()) {
			File file = new File(path + "main_slide1.jpg");
			file.delete();
			// path : 저장될 파일 경로, upFile : view에서 받아온 file 값
			FileUpload ful = new FileUpload(path, "main_slide1.jpg", upFile1);

		}
		// upFile2
		if (upFile2 != null && !upFile2.isEmpty()) {
			File file = new File(path + "main_slide2.jpg");
			file.delete();
			// path : 저장될 파일 경로, upFile : view에서 받아온 file 값
			FileUpload ful = new FileUpload(path, "main_slide2.jpg", upFile2);

		}
		// upFile3
		if (upFile3 != null && !upFile3.isEmpty()) {
			File file = new File(path + "main_slide3.jpg");
			file.delete();
			// path : 저장될 파일 경로, upFile : view에서 받아온 file 값
			FileUpload ful = new FileUpload(path, "main_slide3.jpg", upFile3);

		}
		// 파일 업로드----------------------------- end
		
		


		return "success";
	}	

}
