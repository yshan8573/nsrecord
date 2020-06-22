package com.nsrecord.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsrecord.cotroller.GpxController;
import com.nsrecord.dao.GpxDao;
import com.nsrecord.dao.ICommunityDao;
import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.GpxReplyDto;
import com.nsrecord.dto.GrcDto;
import com.nsrecord.dto.SearchDto;

@Service
public class GpxServiceImpl implements GpxService {

	@Autowired
	private GpxDao gpxDao;
	
	@Autowired
	private HttpServletRequest request;

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
	public void deleteGpxReply(int gr_seq) {
	
	gpxDao.deleteGpxReply(gr_seq);
	}

	//조회수 증가
	@Override
	public int gpxCount(int g_seq) {
		
		
		
		return gpxDao.gpxCount(g_seq);

	}

	@Override
	public int selectGrcCount(SearchDto searchDto) {
		return gpxDao.selectGrcCount(searchDto);
	}

	@Override
	public List<GrcDto> selectGrcAll(BoardPager boardPager) {
		return gpxDao.selectGrcAll(boardPager);
	}

	@Override
	public int insertGrc(GrcDto grc) {
		return gpxDao.insertGrc(grc);
	}

	@Override
	public GrcDto selectGrcOne(GrcDto grc) {
		return gpxDao.selectGrcOne(grc);
	}

	@Override
	public int updateGrc(GrcDto grc) {
		return gpxDao.updateGrc(grc);
	}

	
	@Override
	public int deleteGrc(GrcDto grc) {
		
		int result = gpxDao.deleteGrc(grc);
		
		// 파일 삭제
		if(result > 0 ) {

			String prePath = request.getSession().getServletContext().getRealPath("/resources/data/")+"/";
			String pathGpx = prePath + "gpxRanking/gpx";
			String pathImg = prePath + "gpxRanking/img";
			
			File fileGpx = new File(pathGpx + "/" + grc.getGrc_gpxRe());
			File fileImg = new File(pathImg + "/" + grc.getGrc_imgRe());
			
			if (fileGpx.exists()) {
				fileGpx.delete();
			}
			if (fileImg.exists()) {
				fileImg.delete();
			}
		}
		
		return result;
	}

	//MyGpxAllList
	@Override
	public List<GpxDto> selectMyGpxAllList(BoardPager boardPager) {
		
		return gpxDao.selectMyGpxAllList(boardPager);
	}
	
	
	
	

}//class end
