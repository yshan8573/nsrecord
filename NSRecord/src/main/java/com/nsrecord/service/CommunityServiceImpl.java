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
	public void updateReplyEnd(HashMap<String, String> paramMap) {
		communityDaoImpl.updateReplyEnd(paramMap);
	}
	
	@Override
	public int selectFreeBoardCount(SearchDto searchDto) {
		return communityDaoImpl.selectFreeBoardCount(searchDto);
	}
	
	@Override
	public List<FreeBoardDto> selectFreeBoardAll(BoardPager boardPager){
		return communityDaoImpl.selectFreeBoardAll(boardPager);
	}
	
	@Override
	public List<FreeBoardDto> adminSelectFreeBoardAll(BoardPager boardPager){
		return communityDaoImpl.adminSelectFreeBoardAll(boardPager);
	}
	
	@Override
	public void boardCountUpdate(int b_seq) {
		communityDaoImpl.boardCountUpdate(b_seq);
	}
	
	@Override
	public void countReply(int b_seq) {
		communityDaoImpl.countReply(b_seq);
	}
	
	@Override
	public void deCountReply(int b_seq) {
		communityDaoImpl.deCountReply(b_seq);
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
	
	@Override
	public List<FreeBoardDto> myFreeBoardList(BoardPager boardPager){
		return communityDaoImpl.myFreeBoardList(boardPager);
	}

	@Override
	public int mySelectFreeBoardCount(SearchDto searchDto) {
		return iCommunityDao.mySelectFreeBoardCount(searchDto);
	}
	
	@Override
	public int mySelectReplyCount(SearchDto searchDto) {
		return communityDaoImpl.mySelectReplyCount(searchDto);
	}
	
	@Override
	public List<FreeBoardDto> myReplyList(BoardPager boardPager){
		return communityDaoImpl.myReplyList(boardPager);
	}

	@Override
	public int noticeCountUp(Notice notice) {
		return iCommunityDao.noticeCountUp(notice);
	}
	
}
