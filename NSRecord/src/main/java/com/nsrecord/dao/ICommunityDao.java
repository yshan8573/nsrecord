package com.nsrecord.dao;

import java.util.HashMap;
import java.util.List;

import com.nsrecord.dto.FreeBoardDto;
import com.nsrecord.dto.Notice;

public interface ICommunityDao {

	//게시판 리스트
	public List<FreeBoardDto> selectFreeBoardAllList();
	
	//게시판 내용
	public FreeBoardDto selectFreeBoardContent(int b_seq);
	
	//게시판 작성
	public void freeBoardWriteEnd(HashMap<String, String> writeEnd);

	// 공지사항 리스트 출력(모두)
	public List<Notice> selectNoticeBoardAll();
	
	// 공지사항 작성
	public int insertNoticeBoard(Notice notice);
	
}
