package com.nsrecord.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.GpxReplyDto;
import com.nsrecord.dto.GrcDto;
import com.nsrecord.dto.GurDto;
import com.nsrecord.dto.SearchDto;

@Repository
public class GpxDaoImpl implements GpxDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String queryprefix="gpx.";		
	
	
	
	//전체 조회
	@Override
	public List<GpxDto> selectGpxBoardAllList(BoardPager boardPager) {
	List<GpxDto> gpxDtoList = 
			new ArrayList<GpxDto>();
	
	gpxDtoList = session.selectList(queryprefix+"gpxSelectAll", boardPager);
		
		return gpxDtoList;
	}

	
	
	//글 등록
	@Override
	public int insertGpxBoard(GpxDto dto) {
		return session.insert(queryprefix+"insertGpxBoard", dto);	
	}//method end


	//글 선택조회
	@Override
	public GpxDto selectGpxBoardOne(int g_seq) {
		GpxDto GpxDto = session.selectOne(queryprefix+"selectGpxBoardOne", g_seq);
		
		
		return GpxDto;
	}


	//수정
	@Override
	public void updateGpxBoard(GpxDto dto) {
		session.update(queryprefix+"updateGpxBoard", dto);
	}



	@Override
	public void deleteGpxBoard(int g_seq) {
		session.delete(queryprefix+"deleteGpxBoard", g_seq);
		
		
	}


	//조건 조회
	@Override
	public List<GpxDto> gpxWhereList() {
		List<GpxDto> gpxWhereList = 
				new ArrayList<GpxDto>();
		
		gpxWhereList = session.selectList(queryprefix+"gpxWhereList");
		
		return gpxWhereList;
	}


	//GPX게시판 레코드 전체 갯수 가져오기
	@Override
	public int selectGpxBoardCount(SearchDto searchDto) {
		
		
		
		return session.selectOne(queryprefix+"selectGpxBoardCount", searchDto);
	}


	//댓글 등록
	@Override
	public void insertGpxReply(HashMap<String, String> paramMap) {
		session.insert(queryprefix+"insertGpxReply", paramMap);
		
	
	}


	//댓글 조회
	@Override
	public List<GpxReplyDto> selectOneReply(int g_seq) {
		
		
		
		return session.selectList(queryprefix+"selectOneReply", g_seq);
	}


	//댓글 수정
	@Override
	public void gpxReplyUpdate(HashMap<String, String> paramMap) {
	session.update(queryprefix+"gpxReplyUpdate", paramMap);
	}


	
	//댓글 삭제
	@Override
	public void deleteGpxReply(int gr_seq) {
	
		session.delete(queryprefix+"deleteGpxReply", gr_seq);
	}
	
	//조회수 증가
	@Override
	public int gpxCount(int g_seq) {
		
		
		
		return session.update(queryprefix+"gpxCount", g_seq);
	}
	
	
	//추천수 증가
	@Override
	public int gpxRecommand(int g_seq) {
		
		return session.update(queryprefix+"gpxRecommand", g_seq);
	}



	@Override
	public int selectGrcCount(SearchDto searchDto) {
		return session.selectOne(queryprefix+"selectGrcCount", searchDto);
	}

	@Override
	public List<GrcDto> selectGrcAll(BoardPager boardPager) {
		return session.selectList(queryprefix+"selectGrcAll", boardPager);
	}

	@Override
	public List<GrcDto> selectGrcAll() {
		return session.selectList(queryprefix+"selectGrcAllList");
	}

	@Override
	public int insertGrc(GrcDto grc) {
		return session.insert(queryprefix+"insertGrc", grc);
	}

	@Override
	public GrcDto selectGrcOne(GrcDto grc) {
		return session.selectOne(queryprefix+"selectGrcOne", grc);
	}

	@Override
	public int updateGrc(GrcDto grc) {
		return session.update(queryprefix+"updateGrc", grc);
	}

	@Override
	public int deleteGrc(GrcDto grc) {
		return session.delete(queryprefix+"deleteGrc", grc);
	}

	//MyGpxAllList
	@Override
	public List<GpxDto> selectMyGpxAllList(BoardPager boardPager) {
		
		List<GpxDto> myGpxDtoList = 
				new ArrayList<GpxDto>();
		
		myGpxDtoList = session.selectList(queryprefix+"myGpxAllList", boardPager);
			
		
		return myGpxDtoList;
	}

	//adminHome List
	@Override
	public List<GpxDto> selectAdminList() {
		
		List<GpxDto> gpxAdminList = 
				new ArrayList<GpxDto>();
		gpxAdminList =	 session.selectList(queryprefix+"selectGpxAdminList");
		return gpxAdminList;
	}

	@Override
	public int insertGur(GurDto gur) {
		return session.insert(queryprefix+"insertGur", gur);
	}

	@Override
	public GurDto selectGurIf(GurDto gur) {
		return session.selectOne(queryprefix+"selectGurIf", gur);
	}

	@Override
	public List<GurDto> selectGurListAdmin(GrcDto grc) {
		return session.selectList(queryprefix+"selectGurListAdmin", grc);
	}

	@Override
	public GurDto selectGurListUser(GurDto gur) {
		return session.selectOne(queryprefix+"selectGurListUser", gur);
	}

	@Override
	public GrcDto selectGrcOneMain() {
		return session.selectOne(queryprefix+"selectGrcOneMain");
	}

	@Override
	public int updateGrcStatus() {
		return session.update(queryprefix+"updateGrcStatus");
	}

}//class end
