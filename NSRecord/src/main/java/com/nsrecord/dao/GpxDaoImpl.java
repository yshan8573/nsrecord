package com.nsrecord.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nsrecord.dto.GpxDto;

@Repository
public class GpxDaoImpl implements GpxDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String queryprefix="gpx.";		
	
	//전체 조회
	@Override
	public List<GpxDto> selectGpxBoardAllList() {
	List<GpxDto> gpxDtoList = 
			new ArrayList<GpxDto>();
	
	gpxDtoList = session.selectList(queryprefix+"gpxSelectAll");
		
		return gpxDtoList;
	}

	
	
	//글 등록
	@Override
	public void insertGpxBoard(GpxDto dto) {
	
	System.out.println(dto.getU_nickname());
	session.insert(queryprefix+"insertGpxBoard", dto);	
		
	}//method end


	//글 선택조회
	@Override
	public GpxDto selectGpxBoardOne(int g_seq) {
		System.out.println("g_seq"+g_seq);
		GpxDto GpxDto = 
		session.selectOne(queryprefix+"selectGpxBoardOne", g_seq);
		
		
		return GpxDto;
	}
	
	
	
	
	
	
	
}//class end
