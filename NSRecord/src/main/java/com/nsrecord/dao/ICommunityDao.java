package com.nsrecord.dao;

import java.util.HashMap;
import java.util.List;

import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.FreeBoardDto;
import com.nsrecord.dto.Notice;
import com.nsrecord.dto.SearchDto;

public interface ICommunityDao {

	//게시판 리스트
	public List<FreeBoardDto> selectFreeBoardAllList();
	
	//게시판 내용
	public FreeBoardDto selectFreeBoardContent(int b_seq);
	
	//게시판 작성
	public void freeBoardWriteEnd(HashMap<String, String> writeEnd);

	// 공지사항 레코드 전체 갯수 가져오기
	public int selectNoticeBoardCount(SearchDto searchDto);
	
	// 공지사항 리스트 출력(모두)
	public List<Notice> selectNoticeBoardAll(BoardPager boardPager);
	
	// 공지사항 작성
	public int insertNoticeBoard(Notice notice);
	
}
