package com.nsrecord.dto;

public class GpxDto {
	
	private int g_seq; //gpx 시퀀스
	private int u_seq; //유저 시퀀스
	private String g_content;	//케시판 내용
	private String g_date;	//등록일
	private String g_title;	//글 제목
	private String g_ori;	//gpx파일 오리지널 파일명
	private String g_re;	//gpx 파일 rename파일명
	private String u_nickname; //유저 닉네임
	private int g_count;		//조회수
	private int g_recommand;	//추천수
	private int g_reply;		//댓글수
	private char g_status;		//게시판 상태
	
	
	
	
	
	public GpxDto() {
		super();
	}





	public int getG_seq() {
		return g_seq;
	}





	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
	}





	public int getU_seq() {
		return u_seq;
	}





	public void setU_seq(int u_seq) {
		this.u_seq = u_seq;
	}





	public String getG_content() {
		return g_content;
	}





	public void setG_content(String g_content) {
		this.g_content = g_content;
	}





	public String getG_date() {
		return g_date;
	}





	public void setG_date(String g_date) {
		this.g_date = g_date;
	}





	public String getG_title() {
		return g_title;
	}





	public void setG_title(String g_title) {
		this.g_title = g_title;
	}





	public String getG_ori() {
		return g_ori;
	}





	public void setG_ori(String g_ori) {
		this.g_ori = g_ori;
	}





	public String getG_re() {
		return g_re;
	}





	public void setG_re(String g_re) {
		this.g_re = g_re;
	}





	public String getU_nickname() {
		return u_nickname;
	}





	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}





	public int getG_count() {
		return g_count;
	}





	public void setG_count(int g_count) {
		this.g_count = g_count;
	}





	public int getG_recommand() {
		return g_recommand;
	}





	public void setG_recommand(int g_recommand) {
		this.g_recommand = g_recommand;
	}





	public int getG_reply() {
		return g_reply;
	}





	public void setG_reply(int g_reply) {
		this.g_reply = g_reply;
	}





	public char getG_status() {
		return g_status;
	}





	public void setG_status(char g_status) {
		this.g_status = g_status;
	}





	public GpxDto(int g_seq, int u_seq, String g_content, String g_date, String g_title, String g_ori, String g_re,
			String u_nickname, int g_count, int g_recommand, int g_reply, char g_status) {
		super();
		this.g_seq = g_seq;
		this.u_seq = u_seq;
		this.g_content = g_content;
		this.g_date = g_date;
		this.g_title = g_title;
		this.g_ori = g_ori;
		this.g_re = g_re;
		this.u_nickname = u_nickname;
		this.g_count = g_count;
		this.g_recommand = g_recommand;
		this.g_reply = g_reply;
		this.g_status = g_status;
	}
	
	
	
	
	
	
	
	
	
}//class end
