package com.nsrecord.dto;

public class GpxReplyDto {
	
	private int gr_seq;
	private String u_nickname;
	private String gr_content;
	private  int g_seq;
	private int u_seq;
	private String gr_date;
	
	
	
	
	public GpxReplyDto() {
		super();
	}




	public GpxReplyDto(int gr_seq, String u_nickname, String gr_content, int g_seq, int u_seq, String gr_date) {
		super();
		this.gr_seq = gr_seq;
		this.u_nickname = u_nickname;
		this.gr_content = gr_content;
		this.g_seq = g_seq;
		this.u_seq = u_seq;
		this.gr_date = gr_date;
	}




	public int getGr_seq() {
		return gr_seq;
	}




	public void setGr_seq(int gr_seq) {
		this.gr_seq = gr_seq;
	}




	public String getU_nickname() {
		return u_nickname;
	}




	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}




	public String getGr_content() {
		return gr_content;
	}




	public void setGr_content(String gr_content) {
		this.gr_content = gr_content;
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




	public String getGr_date() {
		return gr_date;
	}




	public void setGr_date(String gr_date) {
		this.gr_date = gr_date;
	}




	@Override
	public String toString() {
		return "GpxReplyDto [gr_seq=" + gr_seq + ", u_nickname=" + u_nickname + ", gr_content=" + gr_content
				+ ", g_seq=" + g_seq + ", u_seq=" + u_seq + ", gr_date=" + gr_date + "]";
	}


	

	
	
	
	




	
}//class end
