package com.nsrecord.dto;

public class GurDto {

	private int gur_seq;
	private int u_seq;
	private int grc_seq;
	private long gur_time;
	private String gur_times;
	private String gur_date;
	private String gur_status;
	
	// join 변수
	private String u_nickname;
	
	// rownum 값 변수
	private int ranking;
	
	public GurDto() {
		// TODO Auto-generated constructor stub
	}

	public GurDto(int gur_seq, int u_seq, int grc_seq, long gur_time, String gur_times, String gur_date,
			String gur_status, String u_nickname, int ranking) {
		super();
		this.gur_seq = gur_seq;
		this.u_seq = u_seq;
		this.grc_seq = grc_seq;
		this.gur_time = gur_time;
		this.gur_times = gur_times;
		this.gur_date = gur_date;
		this.gur_status = gur_status;
		this.u_nickname = u_nickname;
		this.ranking = ranking;
	}

	public int getGur_seq() {
		return gur_seq;
	}

	public void setGur_seq(int gur_seq) {
		this.gur_seq = gur_seq;
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

	public String getGur_times() {
		return gur_times;
	}

	public void setGur_times(String gur_times) {
		this.gur_times = gur_times;
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

	public String getU_nickname() {
		return u_nickname;
	}

	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}

	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	@Override
	public String toString() {
		return "GurDto [gur_seq=" + gur_seq + ", u_seq=" + u_seq + ", grc_seq=" + grc_seq + ", gur_time=" + gur_time
				+ ", gur_times=" + gur_times + ", gur_date=" + gur_date + ", gur_status=" + gur_status + ", u_nickname="
				+ u_nickname + ", ranking=" + ranking + "]";
	}

}
