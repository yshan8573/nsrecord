package com.nsrecord.dto;

public class GurDto {

	private int gur_seq;
	private int g_seq;
	private int u_seq;
	private int grc_seq;
	private long gur_time;
	private String gur_timeS;
	private String gur_date;
	private String gur_status;
	
	public GurDto() {
		// TODO Auto-generated constructor stub
	}

	public GurDto(int gur_seq, int g_seq, int u_seq, int grc_seq, long gur_time, String gur_timeS, String gur_date, String gur_status) {
		super();
		this.gur_seq = gur_seq;
		this.g_seq = g_seq;
		this.u_seq = u_seq;
		this.grc_seq = grc_seq;
		this.gur_time = gur_time;
		this.gur_timeS = gur_timeS;
		this.gur_date = gur_date;
		this.gur_status = gur_status;
	}

	public int getGur_seq() {
		return gur_seq;
	}

	public void setGur_seq(int gur_seq) {
		this.gur_seq = gur_seq;
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

	public int getGrc_seq() {
		return grc_seq;
	}

	public void setGrc_seq(int grc_seq) {
		this.grc_seq = grc_seq;
	}

	public long getGur_time() {
		return gur_time;
	}

	public void setGur_time(long gur_time) {
		this.gur_time = gur_time;
	}

	public String getGur_timeS() {
		return gur_timeS;
	}

	public void setGur_timeS(String gur_timeS) {
		this.gur_timeS = gur_timeS;
	}

	public String getGur_date() {
		return gur_date;
	}

	public void setGur_date(String gur_date) {
		this.gur_date = gur_date;
	}

	public String getGur_status() {
		return gur_status;
	}

	public void setGur_status(String gur_status) {
		this.gur_status = gur_status;
	}

	@Override
	public String toString() {
		return "GurDto [gur_seq=" + gur_seq + ", g_seq=" + g_seq + ", u_seq=" + u_seq + ", grc_seq=" + grc_seq + ", gur_time=" + gur_time + ", gur_timeS=" + gur_timeS + ", gur_date=" + gur_date + ", gur_status=" + gur_status + "]";
	}
	
}
