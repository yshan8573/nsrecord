package com.nsrecord.dao;

import java.util.HashMap;
import java.util.List;

import com.nsrecord.dto.FreeBoardDto;

public interface ICommunityDao {

	//게시판 리스트
	public List<FreeBoardDto> selectFreeBoardAllList();
	
	//게시판 내용
	public FreeBoardDto selectFreeBoardContent(int b_seq);
	
	//게시판 작성
	public void freeBoardWriteEnd(HashMap<String, String> writeEnd);
	
	//게시판 수정
	public void updateFreeBoardContentEnd(HashMap<String, String> paramMap);
	
	//게시판 삭제
	public void deleteFreeBoardContent(int b_seq);

	//댓글 작성
	public void insertReply(HashMap<String, String> insertReply);
	
	//댓글 내용
	public List<FreeBoardDto> replyContent(int b_seq);
}
