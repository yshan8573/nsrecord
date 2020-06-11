package com.nsrecord.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	@Override
	public List<UserInfo> admin_userList() {
		List<UserInfo> userList = 
				new ArrayList<UserInfo>();
		
		userList =
				session.selectList("user.userSelectOne");
		
		return userList;
		
	}
	
}
