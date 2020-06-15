package com.nsrecord.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.FreeBoardDto;
import com.nsrecord.dto.Notice;
import com.nsrecord.dto.SearchDto;

@Repository
public class CommunityDaoImpl implements ICommunityDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String queryprefix = "communityMapper.";
	
	@Override
	public List<FreeBoardDto> selectFreeBoardAllList(){
		List<FreeBoardDto> FreeBoardDtoList = new ArrayList<FreeBoardDto>();
		FreeBoardDtoList = session.selectList(queryprefix+"freeBoardList");
		return FreeBoardDtoList;
	}
	
	@Override
	public FreeBoardDto selectFreeBoardContent(int b_seq) {
		FreeBoardDto FreeBoardDto = session.selectOne("communityMapper.freeBoardContent", b_seq);
		return FreeBoardDto;
	}
	
	@Override
	public void freeBoardWriteEnd(HashMap<String, String> writeEnd) {
		System.out.println("writeEndDao=" + writeEnd);
		session.insert("communityMapper.freeBoardWriteEnd", writeEnd);
	}

	@Override
	public int selectNoticeBoardCount(SearchDto searchDto) {
		return session.selectOne(queryprefix+"selectNoticeBoardCount",searchDto);
	}

	@Override
	public List<Notice> selectNoticeBoardAll(BoardPager boardPager) {
		return session.selectList(queryprefix+"selectNoticeBoardAll",boardPager);
	}

	@Override
	public int insertNoticeBoard(Notice notice) {
		System.out.println(notice.toString());
		return session.insert(queryprefix+"insertNoticeBoard", notice);
	}
	
}
