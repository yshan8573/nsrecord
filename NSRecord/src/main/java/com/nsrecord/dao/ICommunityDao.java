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
	
	//게시판 수정
	public void updateFreeBoardContentEnd(HashMap<String, String> paramMap);
	
	//게시판 삭제
	public void deleteFreeBoardContent(int b_seq);

	//댓글 작성
	public void insertReply(HashMap<String, String> insertReply);
	
	//댓글 내용
	public List<FreeBoardDto> replyContent(int b_seq);
	
	//댓글 삭제
	public void deleteReply(int r_seq);

	//댓글 수정
	public void updateReplyEnd(HashMap<String, String> paramMap);
	
	//자유게시판 레코드 전체 갯수 가져오기
	public int selectFreeBoardCount(SearchDto searchDto);
	
	//자유게시판 리스트 출력(공개만)
	public List<FreeBoardDto> selectFreeBoardAll(BoardPager boardPager);
	
	//자유게시판 리스트 출력(모두)
	public List<FreeBoardDto> adminSelectFreeBoardAll(BoardPager boardPager);


	//조회수
	public void boardCountUpdate(int b_seq);
	
	//댓글수
	public void countReply(int b_seq);
	public void deCountReply(int b_seq);
	
	// 공지사항 상세 보기
	public Notice selectNoticeBoardOne(Notice notice);
	
	// 공지사항 수정하기
	public int updateNoticeBoard(Notice notice);

	// 공지사항 수정하기
	public int deleteNoticeBoard(Notice notice);
	
}
