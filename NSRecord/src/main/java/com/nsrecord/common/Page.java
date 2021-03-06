package com.nsrecord.common;

public class Page {
	
	private int page;
	private int perpageNum;
	
	public Page(int page, int perpageNum) {
		super();
		this.page = 1;
		this.perpageNum = 10;
	}
	
	public int getPageStart() {
		
		return (this.page-1) * perpageNum;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <=0) {
			this.page = 1;	
		} else {
			this.page = page;
		}
		
	}

	public int getPerpageNum() {
		return perpageNum;
	}

	public void setPerpageNum(int perpageNum) {
		
		if(perpageNum <=0 || perpageNum > 100) {
			this.perpageNum = 10;
		} else {
			this.perpageNum = perpageNum;
		}
		
	}

	@Override
	public String toString() {
		return "Page [page=" + page + ", perpageNum=" + perpageNum + "]";
	}
	
	
	
	
	
	
	
}//class end
