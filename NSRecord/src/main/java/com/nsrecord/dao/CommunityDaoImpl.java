package com.nsrecord.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nsrecord.dto.FreeBoardDto;

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
		System.out.println("댓글 오류" + insertReply.toString());
		session.insert("communityMapper.insertReply", insertReply);
	}
	
	@Override
	public List<FreeBoardDto> replyContent(int b_seq) {
		return session.selectList("communityMapper.replyContent", b_seq);
	}
}
