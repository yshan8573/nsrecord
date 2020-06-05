package com.nsrecord.common;

public class PageBarFactoryAjax {

	public static String getPageBar(int total, int cPage, int numPerPage, String url) {
		String pageBar = "";
		int totalPage = (int) Math.ceil((double) total / numPerPage);
		int pageBarSize = 5;
		int pageStart = Math.max(1, cPage - (pageBarSize - 1) / 2);
		int pageEnd = Math.min(totalPage, pageStart + pageBarSize - 1);
		pageStart = Math.max(1, pageEnd - pageBarSize + 1);

		pageBar = "<div class='pagebar'>";
		
		if(pageStart==1)
		{
			if(cPage == 1)
			{
				pageBar+="<div><img src='/forpet/resources/images/board-double-arrow-left.png'></div>";
				pageBar+="<div><img src='/forpet/resources/images/board-arrow-left.png'></div>";
			
			}
			else
			{
				pageBar+="<div><a href='javascript:fn_paging("+1+")'><img src='/forpet/resources/images/board-double-arrow-left.png'></a></div>";
				pageBar+="<div><a href='javascript:fn_paging("+1+")'><img src='/forpet/resources/images/board-arrow-left.png'></a></div>";
			}
		}
		else
		{
			pageBar+="<div><a href='javascript:fn_paging("+1+")'><img src='/forpet/resources/images/board-double-arrow-left.png'></a></div>";
			pageBar+="<div><a href='javascript:fn_paging("+(pageStart-1)+")'><img src='/forpet/resources/images/board-arrow-left.png'></a></div>";
		}
		
		
		
		
		for(int i=pageStart; i<=pageEnd;i++)
		{
			if(cPage ==i)
			{
				pageBar+="<div class='currentPage'><b>"+i+"</b></div>";
			}
			else
			{
				pageBar+="<div><a href='javascript:fn_paging("+i+")'>"+i+"</a></div>";
			}
		}
		
		if(pageEnd == totalPage)
		{
			if(cPage == totalPage)
			{
				pageBar+="<div><img src='/forpet/resources/images/board-arrow-right.png'></div>";
				pageBar+="<div><img src='/forpet/resources/images/board-double-arrow-right.png'></div>";
			
			}
			else
			{
				pageBar+="<div><a href='javascript:fn_paging("+totalPage+")'><img src='/forpet/resources/images/board-arrow-right.png'></a></div>";
				pageBar+="<div><a href='javascript:fn_paging("+totalPage+")'><img src='/forpet/resources/images/board-double-arrow-right.png'></a></div>";
			}
		}
		else
		{
			pageBar+="<div><a href='javascript:fn_paging("+(pageEnd+1)+")'><img src='/forpet/resources/images/board-arrow-right.png'></a></div>";
			pageBar+="<div><a href='javascript:fn_paging("+totalPage+")'><img src='/forpet/resources/images/board-double-arrow-right.png'></a></div>";
		}
		
		pageBar += "</div>";
		
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage){";
		pageBar += "listfunc(cPage);";// ajax호출
		pageBar += "}</script>";

		return pageBar;
	}
}
