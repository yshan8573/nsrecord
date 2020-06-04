package com.nsrecord.model.vo;

//게시판에서 글을 보여줄 때 조건들을 저장하는 vo객체
public class BoardSearch {
	String cPage; //쿼리 스트링을 String타입으로 에러없이 받기 위한 변수
	int cPageNo; // parsing 메소드로 값 자동 대입
	String numPerPage; //쿼리 스트링을 String타입으로 에러없이 받기 위한 변수
	int numPerPageNo; // parsing 메소드로 값 자동 대입
	String keyword; // 검색어
	String type; // 검색 컬럼명
	String order; // 정렬 컬럼명 + 정렬 순서
	
	public BoardSearch() {}
	
	public void parsing() {
		try {
			cPageNo = Integer.parseInt(cPage);
			if(cPageNo<1)
			{
				cPageNo=1;
			}
		} catch(NumberFormatException e)
		{
			cPageNo=1;
		}
		try {
			numPerPageNo = Integer.parseInt(numPerPage);
			if(numPerPageNo<1)
			{
				numPerPageNo=10;
			}
		} catch(NumberFormatException e)
		{
			numPerPageNo =10;
		}
	}
	
	//한페이지 출력 횟수 사용자 설정
	public void parsing(int numPerPageNo) {
		try {
			cPageNo = Integer.parseInt(cPage);
			if(cPageNo<1)
			{
				cPageNo=1;
			}
		} catch(NumberFormatException e)
		{
			cPageNo=1;
		}
		try {
			this.numPerPageNo = Integer.parseInt(numPerPage);
			if(this.numPerPageNo<1)
			{
				this.numPerPageNo=numPerPageNo;
			}
		} catch(NumberFormatException e)
		{
			this.numPerPageNo =numPerPageNo;
		}
	}
	
	public String getcPage() {
		return cPage;
	}

	public void setcPage(String cPage) {
		this.cPage = cPage;
	}

	public int getcPageNo() {
		return cPageNo;
	}

	public void setcPageNo(int cPageNo) {
		this.cPageNo = cPageNo;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(String numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getNumPerPageNo() {
		return numPerPageNo;
	}

	public void setNumPerPageNo(int numPerPageNo) {
		this.numPerPageNo = numPerPageNo;
	}
	

}
