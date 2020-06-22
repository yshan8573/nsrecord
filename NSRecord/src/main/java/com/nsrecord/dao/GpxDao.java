package com.nsrecord.dao;

import java.util.HashMap;
import java.util.List;

import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.GpxReplyDto;
import com.nsrecord.dto.GrcDto;
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
	
	//댓글 삭제
	public void deleteGpxReply(int gr_seq);

	//GPX 코스 레코드 전체 갯수 가져오기
	public int selectGrcCount(SearchDto searchDto);
	
	//GPX 코스 리스트 가져오기
	public List<GrcDto> selectGrcAll(BoardPager boardPager);
	
	// GRC 등록
	public int insertGrc(GrcDto grc);

	// GRC 레코드 한개 가져오기
	public GrcDto selectGrcOne(GrcDto grc);
	
	// GRC 수정
	public int updateGrc(GrcDto grc);
	
	// GRC 삭제
	public int deleteGrc(GrcDto grc);
	
	//조회수 증가
	public int gpxCount(int g_seq);
	
	//추천수 증가
	public int gpxRecommand(int g_seq);
	
	//MyGpxAllList
	public List<GpxDto> selectMyGpxAllList(BoardPager boardPager);
	
	
}//inter end
