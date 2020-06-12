package com.nsrecord.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nsrecord.dao.GpxDao;
import com.nsrecord.dto.GpxDto;

@Service
public class GpxServiceImpl implements GpxService {

	@Autowired
	private GpxDao gpxDao;
	
	
	//전체 조회
	@Override
	public List<GpxDto> selectGpxBoardAllList() {
		
		return gpxDao.selectGpxBoardAllList();
	}

	//글 등록
	@Override
	public void insertGpxBoard(GpxDto dto) {
		
	gpxDao.insertGpxBoard(dto);		
		
	}//method end
	
	
	//글 선택조회
	@Override
	public GpxDto selectGpxBoardOne(int g_seq) {
		
		return gpxDao.selectGpxBoardOne(g_seq);
	}
	
	
	
	
	
	
	
}
