package com.nsrecord.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsrecord.dao.CommunityDaoImpl;
import com.nsrecord.dao.ICommunityDao;
import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.FreeBoardDto;
import com.nsrecord.dto.Notice;
import com.nsrecord.dto.SearchDto;

@Service
public class CommunityServiceImpl implements ICommunityService {

	@Autowired
	private ICommunityDao iCommunityDao;
	
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
		communityDaoImpl.freeBoardWriteEnd(writeEnd);
	}

	@Override
	public int selectNoticeBoardCount(SearchDto searchDto) {
		return iCommunityDao.selectNoticeBoardCount(searchDto);
	}

	@Override
	public List<Notice> selectNoticeBoardAll(BoardPager boardPager) {
		return iCommunityDao.selectNoticeBoardAll(boardPager);
	}

	@Override
	public int insertNoticeBoard(Notice notice) {
		return iCommunityDao.insertNoticeBoard(notice);
	}
	
	@Override
	public void updateFreeBoardContentEnd(HashMap<String, String> paramMap) {
		communityDaoImpl.updateFreeBoardContentEnd(paramMap);
	}
	
	@Override
	public void deleteFreeBoardContent(int b_seq) {
		communityDaoImpl.deleteFreeBoardContent(b_seq);
	}
	
	@Override
	public void insertReply(HashMap<String, String> insertReply) {
		communityDaoImpl.insertReply(insertReply);
	}
	
	@Override
	public List<FreeBoardDto> replyContent(int b_seq) {
		return communityDaoImpl.replyContent(b_seq);
	}
	
	@Override
	public void deleteReply(int r_seq) {
		communityDaoImpl.deleteReply(r_seq);
	}

	@Override
	public Notice selectNoticeBoardOne(Notice notice) {
		return iCommunityDao.selectNoticeBoardOne(notice);
	}

	@Override
	public int updateNoticeBoard(Notice notice) {
		return iCommunityDao.updateNoticeBoard(notice);
	}

	@Override
	public int deleteNoticeBoard(Notice notice) {
		return iCommunityDao.deleteNoticeBoard(notice);
	}
	
}
