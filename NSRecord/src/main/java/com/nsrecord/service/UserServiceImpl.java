package com.nsrecord.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsrecord.dao.UserDao;
import com.nsrecord.dto.UserInfo;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;

	@Override
	public UserInfo userSelectOne(UserInfo user) {
		return dao.userSelectOne(user);
	}
	
	public List<UserInfo> admin_userList() {
		
		return dao.admin_userList();
	}
	
	@Override
	public void insertUser(UserInfo user) {
		dao.insertUser(user);
	}
	
	public int idcheck(String u_email) {
		return dao.idcheck(u_email);
	}
}
