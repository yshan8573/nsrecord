package com.nsrecord.dao;

import java.util.List;

import com.nsrecord.dto.UserInfo;

public interface UserDao {

	public UserInfo userSelectOne(UserInfo user);
	
	public List<UserInfo> admin_userList();
	
	public void insertUser(UserInfo user);

	public int idcheck(String u_email);

	

}
