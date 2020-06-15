package com.nsrecord.dto;

public class SearchDto {

    private String searchSort;
    private String searchVal;
	
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
	   
}
