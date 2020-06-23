package com.nsrecord.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.SearchDto;
import com.nsrecord.dto.UserInfo;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String queryprefix="user.";

	@Override
	public UserInfo userSelectOne(UserInfo user) {
		return session.selectOne(queryprefix+"userSelectOne",user);
	}
	
	// 전체 회원 리스트 출력
	@Override
	public List<UserInfo> admin_userList(BoardPager boardPager) throws Exception {
		List<UserInfo> userInfoList =
				new ArrayList<UserInfo>();
		userInfoList = session.selectList("user.admin_userList", boardPager);
		return userInfoList;
	}
	
	// 회원 추가
	@Override
	public void insertUser(UserInfo user) throws Exception {
		System.out.println(user.toString());
		session.insert("user.insertUser", user);
	}
	
	// 회원 정보 수정(마이페이지)
	@Override
	public void updateUser(UserInfo user) throws Exception{
		session.update("user.updateUser", user);
	}
	
	// 회원 정보 삭제
	@Override
	public void deleteUser(UserInfo user) throws Exception {
		
		session.delete("user.deleteUser", user);
	}
	
	// 이메일 중복체크
	@Override
	public int idcheck(String u_email) throws Exception{
		
		return session.selectOne("user.idcheck", u_email); 
	}
	
	// 닉네임 중복체크
	@Override
	public int nickcheck(String u_nickname) {
		
		return session.selectOne("user.nickcheck", u_nickname); 
	}
	
	// 회원 리스트 전체 레코드 카운트
	@Override
	public int selectUserListCount(SearchDto searchDto) {
		// 
		return session.selectOne(queryprefix+"selectUserListCount", searchDto);
	}
	
	
}
