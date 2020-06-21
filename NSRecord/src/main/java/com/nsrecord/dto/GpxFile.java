package com.nsrecord.dto;

public class GpxFile {

	private String lat; // 위도
	private String lon; // 경도
	private String ele; // 고도
	private String time; // 기록된 시간
	
	public GpxFile() {
		// TODO Auto-generated constructor stub
	}

	public GpxFile(String lat, String lon, String ele, String time) {
		super();
		this.lat = lat;
		this.lon = lon;
		this.ele = ele;
		this.time = time;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}

	public String getEle() {
		return ele;
	}

	public void setEle(String ele) {
		this.ele = ele;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "GpxFile [lat=" + lat + ", lon=" + lon + ", ele=" + ele + ", time=" + time + "]";
	}
	
	
}
