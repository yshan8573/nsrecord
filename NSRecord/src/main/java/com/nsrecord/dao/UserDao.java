package com.nsrecord.dao;

import java.util.List;

import com.nsrecord.dto.UserInfo;

public interface UserDao {

	public UserInfo userSelectOne(UserInfo user);
	
	public List<UserInfo> admin_userList() throws Exception;
	
	public void insertUser(UserInfo user) throws Exception;

	// 이메일 중복체크
	public int idcheck(String u_email) throws Exception;

	// 닉네임 중복체크
	public int nickcheck(String u_nickname);

}
