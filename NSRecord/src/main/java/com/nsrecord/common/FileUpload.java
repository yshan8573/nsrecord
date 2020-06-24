package com.nsrecord.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	
	private MultipartFile upFile;
	private String path;
	private String FileOriName;
	private String FileReName;
	
	private FileUpload() {} //외부 생성 불가
	
	public FileUpload(String path, MultipartFile upFile) {
		
		this.path = path;
		this.upFile = upFile;
		
		// 디텍토리 생성
		setDir();
		
		//원래 파일 명칭 변수 저장
		this.FileOriName = upFile.getOriginalFilename();
		
		//저장 파일 명칭 변환 메소드
		setReName(upFile);
		
	}

	public FileUpload(String path,String fileName, MultipartFile upFile) {
		
		this.path = path;
		this.upFile = upFile;
		
		// 디텍토리 생성
		setDir();
		
		//원래 파일 명칭 변수 저장
		this.FileOriName = upFile.getOriginalFilename();
		
		// 받은 파일명칭으로 저장
		setReName(fileName, upFile);
		
	}
	
	public void setDir() {
		File dir = new File(path);
		if(!dir.exists()) {
			// 디텍토리가 없을때 새로 생성
			dir.mkdirs();
		}
	}
	
	public void setReName(MultipartFile upFile) {
		String ext = FileOriName.substring(FileOriName.indexOf("."));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmssSSS");
		int rndNum = (int)(Math.random()*1000);
		String reNameFile = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + ext;
		try {
			upFile.transferTo(new File(path+"/"+reNameFile));
			this.FileReName = reNameFile;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setReName(String fileName, MultipartFile upFile) {
		try {
			upFile.transferTo(new File(path+"/"+fileName));
			this.FileReName = fileName;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public MultipartFile getUpFile() {
		return upFile;
	}

	public void setUpFile(MultipartFile upFile) {
		this.upFile = upFile;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getFileOriName() {
		return FileOriName;
	}

	public void setFileOriName(String fileOriName) {
		FileOriName = fileOriName;
	}

	public String getFileReName() {
		return FileReName;
	}

	public void setFileReName(String fileReName) {
		FileReName = fileReName;
	}

	
}
