package com.nsrecord.dao;

import java.util.List;

import com.nsrecord.dto.BoardPager;
import com.nsrecord.dto.SearchDto;
import com.nsrecord.dto.UserInfo;

public interface UserDao {

	public UserInfo userSelectOne(UserInfo user);
	
	// 회원 리스트 출력
	public List<UserInfo> admin_userList(BoardPager boardPager) throws Exception;
	
	// 회원 추가
	public void insertUser(UserInfo user) throws Exception;

	// 이메일 중복체크
	public int idcheck(String u_email) throws Exception;

	// 닉네임 중복체크
	public int nickcheck(String u_nickname) throws Exception;

	// 회원 정보 수정
	public void updateUser(UserInfo user) throws Exception;

	// 회원 정보 삭제
	public void deleteUser(UserInfo user) throws Exception;
	
	// 회원 리스트 전체 레코드 카운트
	public int selectUserListCount(SearchDto searchDto);

}
