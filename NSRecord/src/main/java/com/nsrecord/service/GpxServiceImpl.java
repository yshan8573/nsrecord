package com.nsrecord.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsrecord.dao.GpxDao;
import com.nsrecord.dao.ICommunityDao;
import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.GpxReplyDto;
import com.nsrecord.dto.SearchDto;

@Service
public class GpxServiceImpl implements GpxService {

	@Autowired
	private GpxDao gpxDao;
	
	@Autowired
	private ICommunityDao dao;

	//전체 조회
	@Override
	public List<GpxDto> selectGpxBoardAllList(BoardPager boardPager) {


		return gpxDao.selectGpxBoardAllList(boardPager);
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
	
	
	//수정
	@Override
	public void updateGpxBoardUpdate(GpxDto dto) {
		
	gpxDao.updateGpxBoard(dto);
		
	}

	//삭제
	@Override
	public void deleteGpxBoard(int g_seq) {
		
		gpxDao.deleteGpxBoard(g_seq);
	}
	
	//조건 조회
	@Override
	public List<GpxDto> gpxWhereList() {
		
		
		return gpxDao.gpxWhereList();
	}
	
	
	//GPX게시판 레코드 전체 갯수 가져오기
	@Override
	public int selectGpxBoardCount(SearchDto searchDto) {
		
		return gpxDao.selectGpxBoardCount(searchDto);
	}

	
	//댓글등록
	@Override
	public void insertGpxReply(GpxReplyDto dtoreply) {
		
		gpxDao.insertGpxReply(dtoreply);
	}

	
	//댓글 내용
	@Override
	public List<GpxReplyDto> selectOneReply(int g_seq) {
		
		
		
		return  gpxDao.selectOneReply(g_seq);
	}

	
	//댓글 수정
	@Override
	public void gpxReplyUpdate(HashMap<String, String> paramMap) {
		
	gpxDao.gpxReplyUpdate(paramMap);
		
	}
	
	
	
	
	//댓글 삭제
	@Override
	public void deleteGpxReply(int g_seq) {
	
	gpxDao	.deleteGpxReply(g_seq);	
	}

	

	
	
	
	
	
	
	
}//class end
