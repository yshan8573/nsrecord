package com.nsrecord.dto;

public class GrcDto {

	private int grc_seq;
	private String grc_title;
	private String grc_content;
	private String grc_gpxOri;
	private String grc_gpxRe;
	private String grc_imgOri;
	private String grc_imgRe;
	private String grc_start;
	private String grc_end;
	private String grc_length;
	private String grc_date;
	private String grc_status;
	
	public GrcDto() {
		// TODO Auto-generated constructor stub
	}

	public GrcDto(int grc_seq, String grc_title, String grc_content, String grc_gpxOri, String grc_gpxRe,
			String grc_imgOri, String grc_imgRe, String grc_start, String grc_end, String grc_length, String grc_date,
			String grc_status) {
		super();
		this.grc_seq = grc_seq;
		this.grc_title = grc_title;
		this.grc_content = grc_content;
		this.grc_gpxOri = grc_gpxOri;
		this.grc_gpxRe = grc_gpxRe;
		this.grc_imgOri = grc_imgOri;
		this.grc_imgRe = grc_imgRe;
		this.grc_start = grc_start;
		this.grc_end = grc_end;
		this.grc_length = grc_length;
		this.grc_date = grc_date;
		this.grc_status = grc_status;
	}

	public int getGrc_seq() {
		return grc_seq;
	}

	public void setGrc_seq(int grc_seq) {
		this.grc_seq = grc_seq;
	}

	public String getGrc_title() {
		return grc_title;
	}

	public void setGrc_title(String grc_title) {
		this.grc_title = grc_title;
	}

	public String getGrc_content() {
		return grc_content;
	}

	public void setGrc_content(String grc_content) {
		this.grc_content = grc_content;
	}

	public String getGrc_gpxOri() {
		return grc_gpxOri;
	}

	public void setGrc_gpxOri(String grc_gpxOri) {
		this.grc_gpxOri = grc_gpxOri;
	}

	public String getGrc_gpxRe() {
		return grc_gpxRe;
	}

	public void setGrc_gpxRe(String grc_gpxRe) {
		this.grc_gpxRe = grc_gpxRe;
	}

	public String getGrc_imgOri() {
		return grc_imgOri;
	}

	public void setGrc_imgOri(String grc_imgOri) {
		this.grc_imgOri = grc_imgOri;
	}

	public String getGrc_imgRe() {
		return grc_imgRe;
	}

	public void setGrc_imgRe(String grc_imgRe) {
		this.grc_imgRe = grc_imgRe;
	}

	public String getGrc_start() {
		return grc_start;
	}

	public void setGrc_start(String grc_start) {
		this.grc_start = grc_start;
	}

	public String getGrc_end() {
		return grc_end;
	}

	public void setGrc_end(String grc_end) {
		this.grc_end = grc_end;
	}

	public String getGrc_length() {
		return grc_length;
	}

	public void setGrc_length(String grc_length) {
		this.grc_length = grc_length;
	}

	public String getGrc_date() {
		return grc_date;
	}

	public void setGrc_date(String grc_date) {
		this.grc_date = grc_date;
	}

	public String getGrc_status() {
		return grc_status;
	}

	public void setGrc_status(String grc_status) {
		this.grc_status = grc_status;
	}

	@Override
	public String toString() {
		return "GrcDto [grc_seq=" + grc_seq + ", grc_title=" + grc_title + ", grc_content=" + grc_content
				+ ", grc_gpxOri=" + grc_gpxOri + ", grc_gpxRe=" + grc_gpxRe + ", grc_imgOri=" + grc_imgOri
				+ ", grc_imgRe=" + grc_imgRe + ", grc_start=" + grc_start + ", grc_end=" + grc_end + ", grc_length="
				+ grc_length + ", grc_date=" + grc_date + ", grc_status=" + grc_status + "]";
	}
	
}
