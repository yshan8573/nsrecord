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
	public void insertGpxBoard(GpxDto dto) {
	
	System.out.println(dto.toString());
	session.insert(queryprefix+"insertGpxBoard", dto);	
		
	}//method end


	//글 선택조회
	@Override
	public GpxDto selectGpxBoardOne(int g_seq) {
		System.out.println("g_seq 선택조회="+g_seq);
		GpxDto GpxDto = 
		session.selectOne(queryprefix+"selectGpxBoardOne", g_seq);
		
		
		return GpxDto;
	}


	//수정
	@Override
	public void updateGpxBoard(GpxDto dto) {
		
		System.out.println("닉네임 = "+dto.getU_nickname()+"수정파일 이름 : "+dto.getG_ori());
		session.update(queryprefix+"updateGpxBoard", dto);
	}



	@Override
	public void deleteGpxBoard(int g_seq) {
		System.out.println("DeleteGpxDao 접근");
		session.delete(queryprefix+"deleteGpxBoard", g_seq);
		
		
	}


	//조건 조회
	@Override
	public List<GpxDto> gpxWhereList() {
		System.out.println("조건조회 Dao접근");
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
	public void insertGpxReply(GpxReplyDto dtoreply) {
		
		System.out.println("댓글Dao"+dtoreply.toString());
		
		session.insert(queryprefix+"insertGpxReply", dtoreply);
		
	
	}


	//댓글 조회
	@Override
	public List<GpxReplyDto> selectOneReply(int g_seq) {
		
		
		
		return session.selectList(queryprefix+"selectOneReply", g_seq);
	}


	//댓글 수정
	@Override
	public void gpxReplyUpdate(HashMap<String, String> paramMap) {
	System.out.println("ReUpdateDao"+paramMap);
	session.update(queryprefix+"gpxReplyUpdate", paramMap);
	}


	
	//댓글 삭제
	@Override
	public void deleteGpxReply(int gr_seq) {
	System.out.println("deleteGpxReplyDao"+gr_seq);
		
		session.delete(queryprefix+"deleteGpxReply", gr_seq);
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
	
}//class end
