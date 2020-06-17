package com.nsrecord.service;

import java.util.HashMap;
import java.util.List;

import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.SearchDto;

public interface GpxService {
	
	
	
	//전체목록 조회
	public List<GpxDto> selectGpxBoardAllList(BoardPager boardPager);
	
	//글 쓰기
	public void insertGpxBoard(GpxDto dto);
	
	//선택 조회
	public GpxDto selectGpxBoardOne(int g_seq);
	
	//수정
	public void updateGpxBoardUpdate(GpxDto dto);
	
	//삭제
	public void deleteGpxBoard(int g_seq);
	
	//조건 조회
	public List<GpxDto> gpxWhereList();
	
	//Gpx게시판 레코드 전체 갯수 가져오기
	public int selectGpxBoardCount(SearchDto searchDto);
	
	
	
}//inter end
