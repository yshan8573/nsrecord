package com.nsrecord.dao;

import java.util.List;

import com.nsrecord.dto.UserInfo;

public interface UserDao {

	public UserInfo userSelectOne(UserInfo user);
	
	public List<UserInfo> admin_userList();
	
	public void insertUser(UserInfo user);

	// 이메일 중복체크
	public int idcheck(String u_email);

	// 닉네임 중복체크
	public int nickcheck(String u_nickname);

}
