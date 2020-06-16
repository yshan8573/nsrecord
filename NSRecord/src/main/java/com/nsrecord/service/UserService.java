package com.nsrecord.service;

import java.util.List;

import com.nsrecord.dto.UserInfo;

public interface UserService {
	
	public UserInfo userSelectOne(UserInfo user);
	
	// 관리자사이트 -> 회원관리 -> 회원리스트 출력
	public List<UserInfo> admin_userList();
	
	// 회원가입 insert
	public void insertUser(UserInfo user);

	// 이메일 중복체크
	public int idcheck(String u_email);
}
