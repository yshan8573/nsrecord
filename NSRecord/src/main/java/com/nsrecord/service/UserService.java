package com.nsrecord.service;

import java.util.List;

import com.nsrecord.dto.UserInfo;

public interface UserService {
	
	public UserInfo userSelectOne(UserInfo user);
	
	public List<UserInfo> admin_userList();
}
