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
		session.insert("communityMapper.freeBoardWriteEnd", writeEnd);
	}
	
	@Override
	public void updateFreeBoardContentEnd(HashMap<String, String> paramMap) {
		session.update("communityMapper.updateFreeBoardContentEnd", paramMap);
	}
	
	@Override
	public void deleteFreeBoardContent(int b_seq){
		session.delete("communityMapper.deleteFreeBoardContent", b_seq);
	}
	
	@Override
	public void insertReply(HashMap<String, String> insertReply) {
		session.insert("communityMapper.insertReply", insertReply);
	}
	
	@Override
	public List<FreeBoardDto> replyContent(int b_seq) {
		return session.selectList("communityMapper.replyContent", b_seq);
	}
	
	@Override
	public void deleteReply(int r_seq) {
		session.delete("communityMapper.deleteReply", r_seq);
	}

	@Override
	public void updateReplyEnd(HashMap<String, String> paramMap) {
		session.update("communityMapper.updateReplyEnd", paramMap);
	}

	@Override
	public int selectFreeBoardCount(SearchDto searchDto) {
		return session.selectOne("communityMapper.selectFreeBoardCount", searchDto);
	}
	
	@Override
	public List<FreeBoardDto> selectFreeBoardAll(BoardPager boardPager){
		return session.selectList("communityMapper.selectFreeBoardAll", boardPager);
	}
	
	@Override
	public void boardCountUpdate(int b_seq) { 
		session.update("communityMapper.boardCountUpdate", b_seq); 
	}
	
		@Override
	public void countReply(int b_seq) {
		session.update("communityMapper.countReply", b_seq);
	}
	
	@Override
	public void deCountReply(int b_seq) {
		session.update("communityMapper.deCountReply", b_seq);
	}

	
	@Override
	public int selectNoticeBoardCount(SearchDto searchDto) {
		return session.selectOne(queryprefix+"selectNoticeBoardCount", searchDto);
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

	@Override
	public Notice selectNoticeBoardOne(Notice notice) {
		return session.selectOne(queryprefix+"selectNoticeBoardOne", notice);
	}

	@Override
	public int updateNoticeBoard(Notice notice) {
		return session.update(queryprefix+"updateNoticeBoard", notice);
	}

	@Override
	public int deleteNoticeBoard(Notice notice) {
		return session.delete(queryprefix+"deleteNoticeBoard", notice);
	}
	
	
}
