package com.nsrecord.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nsrecord.dao.GpxDao;
import com.nsrecord.dto.GpxDto;

@Service
public class GpxServiceImpl implements GpxService {

	@Autowired
	private GpxDao gpxDao;

	@Override
	public List<GpxDto> selectGpxBoardAllList() {
		
		return gpxDao.selectGpxBoardAllList();
	}
	
	
	
	
	
	
	
}
