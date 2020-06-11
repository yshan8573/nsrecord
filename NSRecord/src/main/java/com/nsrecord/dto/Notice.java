package com.nsrecord.dto;

public class Notice {

	private int n_seq;
	private int u_seq;
	private String n_title;
	private String n_content;
	private String n_date;
	private String n_status;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int n_seq, int u_seq, String n_title, String n_content, String n_date, String n_status) {
		super();
		this.n_seq = n_seq;
		this.u_seq = u_seq;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_date = n_date;
		this.n_status = n_status;
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
	
}
