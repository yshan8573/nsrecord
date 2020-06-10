package com.nsrecord.dto;

import java.util.Date;

public class UserInfo {

	private int u_no;
	private String u_email;
	private String u_pwd;
	private String u_name;
	private String u_nickname;
	private String u_phone;
	private String u_originalImage;
	private String u_renamedImage;
	private Date u_enrolldate;
	private String u_grade;
	private String u_status;
	
	public UserInfo() {
		// TODO Auto-generated constructor stub
	}

	public UserInfo(int u_no, String u_email, String u_pwd, String u_name, String u_nickname, String u_phone,
			String u_originalImage, String u_renamedImage, Date u_enrolldate, String u_grade, String u_status) {
		super();
		this.u_no = u_no;
		this.u_email = u_email;
		this.u_pwd = u_pwd;
		this.u_name = u_name;
		this.u_nickname = u_nickname;
		this.u_phone = u_phone;
		this.u_originalImage = u_originalImage;
		this.u_renamedImage = u_renamedImage;
		this.u_enrolldate = u_enrolldate;
		this.u_grade = u_grade;
		this.u_status = u_status;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_nickname() {
		return u_nickname;
	}

	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_originalImage() {
		return u_originalImage;
	}

	public void setU_originalImage(String u_originalImage) {
		this.u_originalImage = u_originalImage;
	}

	public String getU_renamedImage() {
		return u_renamedImage;
	}

	public void setU_renamedImage(String u_renamedImage) {
		this.u_renamedImage = u_renamedImage;
	}

	public Date getU_enrolldate() {
		return u_enrolldate;
	}

	public void setU_enrolldate(Date u_enrolldate) {
		this.u_enrolldate = u_enrolldate;
	}

	public String getU_grade() {
		return u_grade;
	}

	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}

	public String getU_status() {
		return u_status;
	}

	public void setU_status(String u_status) {
		this.u_status = u_status;
	}
	
}