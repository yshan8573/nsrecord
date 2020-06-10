package com.nsrecord.service;

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
	
}
