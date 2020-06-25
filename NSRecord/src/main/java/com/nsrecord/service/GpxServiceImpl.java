package com.nsrecord.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsrecord.common.GurData;
import com.nsrecord.dao.GpxDao;
import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.GpxReplyDto;
import com.nsrecord.dto.GrcDto;
import com.nsrecord.dto.GurDto;
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
		
		int result = gpxDao.insertGpxBoard(dto);
		
		// 랭킹 시스템 등록
		if(result > 0) {
			
			String prePath = request.getSession().getServletContext().getRealPath("/resources/data/")+"/";
			String pathGpx = prePath + "gpx/gpx";
			
			// grc 리스트 가져오기 (gpx코스 정보 가져오기)
			List<GrcDto> grcList = gpxDao.selectGrcAll();
			
			//랭킹 데이터 출력 클래스
			List<GurDto> gurList = GurData.read(pathGpx,dto,grcList);
			
			GurDto gur = new GurDto();
			for(int i=0;i<gurList.size();i++) {
				gur = gurList.get(i);
				
				// gur 중복 검사
				GurDto gurResult = gpxDao.selectGurIf(gur);
				
				if(gurResult == null) {
					int gurIntResult = gpxDao.insertGur(gur);
				}
			}
		}
		
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
	
	
	//추천수 증가
	@Override
	public int gpxRecommand(int g_seq) {
		
		
		
		return gpxDao.gpxRecommand(g_seq);
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
		
		if(grc.getGrc_status().equals("M")) {
			int result = gpxDao.updateGrcStatus();
		}
		
		return gpxDao.insertGrc(grc);
	}

	@Override
	public GrcDto selectGrcOne(GrcDto grc) {
		return gpxDao.selectGrcOne(grc);
	}

	@Override
	public int updateGrc(GrcDto grc) {
		
		if(grc.getGrc_status().equals("M")) {
			int result = gpxDao.updateGrcStatus();
		}
		
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

	//adminHome GpxList
	@Override
	public List<GpxDto> selectAdminList() {
		
		return gpxDao.selectAdminList();
	}

	@Override
	public List<GurDto> selectGurListAdmin(GrcDto grc) {
		return gpxDao.selectGurListAdmin(grc);
	}

	@Override
	public GurDto selectGurListUser(GurDto gur) {
		return gpxDao.selectGurListUser(gur);
	}

	@Override
	public GrcDto selectGrcOneMain() {
		return gpxDao.selectGrcOneMain();
	}

	@Override
	public int selectGpxCount() {
		return gpxDao.selectGpxCount();
	}

}//class end
