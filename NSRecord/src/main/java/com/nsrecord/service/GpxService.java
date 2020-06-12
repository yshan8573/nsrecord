package com.nsrecord.service;

import java.util.HashMap;
import java.util.List;

import com.nsrecord.dto.GpxDto;

public interface GpxService {
	
	
	
	//전체목록 조회
	public List<GpxDto> selectGpxBoardAllList();
	
	//글 쓰기
	public void insertGpxBoard(GpxDto dto);
	
	//선택 조회
	public GpxDto selectGpxBoardOne(int g_seq);
	
	
	
}//inter end
