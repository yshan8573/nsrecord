package com.nsrecord.dao;

import java.util.HashMap;
import java.util.List;

import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.GpxReplyDto;
import com.nsrecord.dto.SearchDto;

public interface GpxDao {

	//전체 조회
	public List<GpxDto> selectGpxBoardAllList(BoardPager boardPager);
	
	
	//등록
	public void insertGpxBoard(GpxDto dto);
	
	
	//글 선택조회
	public GpxDto selectGpxBoardOne(int g_seq);
	
	//수정
	public void updateGpxBoard(GpxDto dto);
	
	//삭제
	public void deleteGpxBoard(int g_seq);
	
	//조건 조회
	public List<GpxDto> gpxWhereList();
	
	//GPX게시판 레코드 전체 갯수 가져오기
	public int selectGpxBoardCount(SearchDto searchDto);
	
	//댓글등록
	public void insertGpxReply(GpxReplyDto dtoreply);
	
	//댓글 내용
	public List<GpxReplyDto> selectOneReply(int g_seq);
	
	//댓글 수정
	public void gpxReplyUpdate(HashMap<String, String> paramMap);
	
	
}//inter end
