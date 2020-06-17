package com.nsrecord.dto;

public class Notice {

	private int n_seq;
	private int u_seq;
	private String n_title;
	private String n_content;
	private String n_count;
	private String n_date;
	private String n_status;
	
	// 첨부파일명 변수
	private String n_ori;
	private String n_re;
	
	// join을 통해 u_email 값 가져오기
	private String u_email;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int n_seq, int u_seq, String n_title, String n_content, String n_count, String n_date,
			String n_status, String n_ori, String n_re, String u_email) {
		super();
		this.n_seq = n_seq;
		this.u_seq = u_seq;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_count = n_count;
		this.n_date = n_date;
		this.n_status = n_status;
		this.n_ori = n_ori;
		this.n_re = n_re;
		this.u_email = u_email;
	}

	public int getN_seq() {
		return n_seq;
	}

	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}

	public int getU_seq() {
		return u_seq;
	}

	public void setU_seq(int u_seq) {
		this.u_seq = u_seq;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_count() {
		return n_count;
	}

	public void setN_count(String n_count) {
		this.n_count = n_count;
	}

	public String getN_date() {
		return n_date;
	}

	public void setN_date(String n_date) {
		this.n_date = n_date;
	}

	public String getN_status() {
		return n_status;
	}

	public void setN_status(String n_status) {
		this.n_status = n_status;
	}

	public String getN_ori() {
		return n_ori;
	}

	public void setN_ori(String n_ori) {
		this.n_ori = n_ori;
	}

	public String getN_re() {
		return n_re;
	}

	public void setN_re(String n_re) {
		this.n_re = n_re;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	@Override
	public String toString() {
		return "Notice [n_seq=" + n_seq + ", u_seq=" + u_seq + ", n_title=" + n_title + ", n_content=" + n_content
				+ ", n_count=" + n_count + ", n_date=" + n_date + ", n_status=" + n_status + ", n_ori=" + n_ori
				+ ", n_re=" + n_re + ", u_email=" + u_email + "]";
	}
	
}
