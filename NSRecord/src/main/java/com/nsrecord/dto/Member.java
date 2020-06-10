package com.nsrecord.dto;

import java.util.Date;

public class Member {

	private int m_no;
	private String m_email;
	private String m_pwd;
	private String m_name;
	private String m_nickname;
	private String m_phone;
	private String m_originalImage;
	private String m_renamedImage;
	private Date m_enrolldate;
	private String m_grade;
	private String m_status;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(int m_no, String m_email, String m_pwd, String m_name, String m_nickname, String m_phone,
			String m_originalImage, String m_renamedImage, Date m_enrolldate, String m_grade, String m_status) {
		super();
		this.m_no = m_no;
		this.m_email = m_email;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_nickname = m_nickname;
		this.m_phone = m_phone;
		this.m_originalImage = m_originalImage;
		this.m_renamedImage = m_renamedImage;
		this.m_enrolldate = m_enrolldate;
		this.m_grade = m_grade;
		this.m_status = m_status;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_originalImage() {
		return m_originalImage;
	}

	public void setM_originalImage(String m_originalImage) {
		this.m_originalImage = m_originalImage;
	}

	public String getM_renamedImage() {
		return m_renamedImage;
	}

	public void setM_renamedImage(String m_renamedImage) {
		this.m_renamedImage = m_renamedImage;
	}

	public Date getM_enrolldate() {
		return m_enrolldate;
	}

	public void setM_enrolldate(Date m_enrolldate) {
		this.m_enrolldate = m_enrolldate;
	}

	public String getM_grade() {
		return m_grade;
	}

	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}

	public String getM_status() {
		return m_status;
	}

	public void setM_status(String m_status) {
		this.m_status = m_status;
	}
	
}
