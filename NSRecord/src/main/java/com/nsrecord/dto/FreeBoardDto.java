package com.nsrecord.dto;

public class FreeBoardDto {
	
	private int b_seq;
	private int u_seq;
	private String b_title;
	private int b_reply;
	private String b_date;
	private int b_count;
	private String u_nickname;
	private char b_status;
	private String b_content;
	


	public FreeBoardDto() {
		
	}
	
	
	
	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	
	public int getB_seq() {
		return b_seq;
	}

	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}

	public int getU_seq() {
		return u_seq;
	}

	public void setU_seq(int u_seq) {
		this.u_seq = u_seq;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public int getB_reply() {
		return b_reply;
	}

	public void setB_reply(int b_reply) {
		this.b_reply = b_reply;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public int getB_count() {
		return b_count;
	}

	public void setB_count(int b_count) {
		this.b_count = b_count;
	}

	public String getU_nickname() {
		return u_nickname;
	}

	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}

	public char getB_status() {
		return b_status;
	}

	public void setB_status(char b_status) {
		this.b_status = b_status;
	}



}
