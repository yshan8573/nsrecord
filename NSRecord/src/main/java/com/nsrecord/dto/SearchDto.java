package com.nsrecord.dto;

public class SearchDto {

    private String searchSort;
    private String searchVal;
    private int u_seq;
	
    public SearchDto(String searchSort, String searchVal) {
		super();
		this.searchSort = searchSort;
		this.searchVal = searchVal;
	}

	public String getSearchSort() {
		return searchSort;
	}

	public void setSearchSort(String searchSort) {
		this.searchSort = searchSort;
	}

	public String getSearchVal() {
		return searchVal;
	}

	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}

	public int getU_seq() {
		return u_seq;
	}

	public void setU_seq(int u_seq) {
		this.u_seq = u_seq;
	}

}
