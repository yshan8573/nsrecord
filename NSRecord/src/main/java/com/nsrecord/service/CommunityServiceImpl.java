package com.nsrecord.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsrecord.dao.CommunityDaoImpl;
import com.nsrecord.dto.FreeBoardDto;

@Service
public class CommunityServiceImpl implements ICommunityService {

	@Autowired
	private CommunityDaoImpl communityDaoImpl;
	
	@Override
	public List<FreeBoardDto> selectFreeBoardAllList(){
		return communityDaoImpl.selectFreeBoardAllList();
	}
	
	@Override
	public FreeBoardDto selectFreeBoardContent(int b_seq) {
		return communityDaoImpl.selectFreeBoardContent(b_seq);
	}
	
	@Override
	public void freeBoardWriteEnd(HashMap<String, String> writeEnd) {
		System.out.println("writeEndService=" + writeEnd);
		communityDaoImpl.freeBoardWriteEnd(writeEnd);
	}
	
}
