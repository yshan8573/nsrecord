package com.nsrecord.common;

import com.nsrecord.dto.BoardSearch;

public class PageBarFactory {

	private PageBarFactory() {} // 외부 생성 불가
	
	public static String getPageBar(int total, BoardSearch bs, String url) // url은 루트 경로 포함
	{

		String functionName = "fn_paging_" + url.substring(url.lastIndexOf("/") + 1);
		String pageBar;
		String querryStr = "";
		int cPage = bs.getcPageNo();
		int numPerPage = bs.getNumPerPageNo();

		if (cPage <= 0) {
			cPage = 1;
		}
		
		//cPage를 제외한 쿼리스트링 생성 로직
		if(numPerPage>0)
		{
			querryStr += "&numPerPage="+numPerPage;
		}
		if(bs.getKeyword() != null && bs.getKeyword().length()>0)
		{
			querryStr += "&keyword="+bs.getKeyword(); // 검색어 쿼리스트링

		}
		if (bs.getType() != null && bs.getType().length() > 0) {
			querryStr += "&type=" + bs.getType(); // 검색타입(동적쿼리-컬럼) 쿼리스트링
		}
		if (bs.getOrder() != null && bs.getOrder().length() > 0) {
			querryStr += "&order=" + bs.getOrder(); // 정렬 쿼리스트링
		}

		int pageBarSize = 7;
		int totalPage = (int) Math.ceil((double) total / numPerPage);
		int pageStart = Math.max(1, cPage - (pageBarSize - 1) / 2);
		int pageEnd = Math.min(totalPage, pageStart + pageBarSize - 1);
		pageStart = Math.max(1, pageEnd - pageBarSize + 1);

		pageBar = "<div class='pagebar'>";

		if (pageStart == 1) {
			if (cPage == 1) {
				pageBar += "<div><img src='/forpet/resources/images/board-double-arrow-left.png'></div>";
				pageBar += "<div><img src='/forpet/resources/images/board-arrow-left.png'></div>";

			} else {
				pageBar += "<div><a href='javascript:" + functionName + "(" + 1
						+ ")'><img src='/forpet/resources/images/board-double-arrow-left.png'></a></div>";
				pageBar += "<div><a href='javascript:" + functionName + "(" + 1
						+ ")'><img src='/forpet/resources/images/board-arrow-left.png'></a></div>";
			}
		} else {
			pageBar += "<div><a href='javascript:" + functionName + "(" + 1
					+ ")'><img src='/forpet/resources/images/board-double-arrow-left.png'></a></div>";
			pageBar += "<div><a href='javascript:" + functionName + "(" + (pageStart - 1)
					+ ")'><img src='/forpet/resources/images/board-arrow-left.png'></a></div>";
		}

		for (int i = pageStart; i <= pageEnd; i++) {
			if (cPage == i) {
				pageBar += "<div class='currentPage'><b>" + i + "</b></div>";
			} else {
				pageBar += "<div><a href='javascript:" + functionName + "(" + i + ")'>" + i + "</a></div>";
			}
		}

		if (pageEnd == totalPage) {
			if (cPage == totalPage) {
				pageBar += "<div><img src='/forpet/resources/images/board-arrow-right.png'></div>";
				pageBar += "<div><img src='/forpet/resources/images/board-double-arrow-right.png'></div>";

			} else {
				pageBar += "<div><a href='javascript:" + functionName + "(" + totalPage
						+ ")'><img src='/forpet/resources/images/board-arrow-right.png'></a></div>";
				pageBar += "<div><a href='javascript:" + functionName + "(" + totalPage
						+ ")'><img src='/forpet/resources/images/board-double-arrow-right.png'></a></div>";
			}
		} else {
			pageBar += "<div><a href='javascript:" + functionName + "(" + (pageEnd + 1)
					+ ")'><img src='/forpet/resources/images/board-arrow-right.png'></a></div>";
			pageBar += "<div><a href='javascript:" + functionName + "(" + totalPage
					+ ")'><img src='/forpet/resources/images/board-double-arrow-right.png'></a></div>";
		}

		pageBar += "</div>";
		pageBar += "<script>";
		pageBar += "function " + functionName + "(cPage){";
		pageBar += "location.href='" + url + "?cPage='+cPage+'" + querryStr + "'";
		pageBar += "}</script>";
		return pageBar;

	}
	
	public static String createUrl(BoardSearch bs, String url)
	{
		//cPage를 포함한 쿼리스트링 생성 로직
		String querryStr = url + "?cPage="+(bs.getcPage()==null?"1":bs.getcPage());
		if(bs.getNumPerPage() != null && bs.getNumPerPage().length()>0)
		{
			querryStr += "&numPerPage="+bs.getNumPerPage();
		}
		if(bs.getKeyword() != null && bs.getKeyword().length()>0)
		{
			querryStr += "&keyword="+bs.getKeyword(); // 검색어 쿼리스트링

		}
		if (bs.getType() != null && bs.getType().length() > 0) {
			querryStr += "&type=" + bs.getType(); // 검색타입(동적쿼리-컬럼) 쿼리스트링
		}
		if (bs.getOrder() != null && bs.getOrder().length() > 0) {
			querryStr += "&order=" + bs.getOrder(); // 정렬 쿼리스트링
		}
		
		return querryStr;
	}
}
