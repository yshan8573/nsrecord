package com.nsrecord.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsrecord.dao.UserDao;
import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.SearchDto;
import com.nsrecord.dto.UserInfo;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;

	@Override
	public UserInfo userSelectOne(UserInfo user) {
		return dao.userSelectOne(user);
	}
	
	// 전체 회원 목록
	public List<UserInfo> admin_userList(BoardPager boardPager) throws Exception{
		
		return dao.admin_userList(boardPager);
	}
	
	// 회원가입
	@Override
	public void insertUser(UserInfo user) throws Exception{
		dao.insertUser(user);
	}
	
	//회원 정보 수정
	@Override
	public void updateUser(UserInfo user) throws Exception {
		dao.updateUser(user);
	}
	
	//회원 정보 삭제
	@Override
	public void deleteUser(UserInfo user) throws Exception {
		dao.deleteUser(user);
	}
	
	// 이메일 중복확인
	public int idcheck(String u_email) throws Exception{
		return dao.idcheck(u_email);
	}
	
	// 닉네임 중복확인
	public int nickcheck(String u_nickname) throws Exception{
		return dao.nickcheck(u_nickname);
	}
	
//	회원 리스트 전체 레코드 카운트
	@Override
	public int selectUserListCount(SearchDto searchDto) {
	
		return dao.selectUserListCount(searchDto);
	}

	@Override
	public int selectUserCount() {
		return dao.selectUserCount();
	}
	
	
}
