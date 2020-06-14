package com.nsrecord.dao;

import java.util.HashMap;
import java.util.List;

import com.nsrecord.dto.GpxDto;

public interface GpxDao {

	//전체 조회
	public List<GpxDto> selectGpxBoardAllList();
	
	
	//등록
	public void insertGpxBoard(GpxDto dto);
	
	
	//글 선택조회
	public GpxDto selectGpxBoardOne(int g_seq);
	
	//수정
	public void updateGpxBoard(GpxDto dto);
	
	
	
}//inter end
