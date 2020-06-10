package com.nsrecord.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nsrecord.dto.UserInfo;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public UserInfo userSelectOne(UserInfo user) {
		return session.selectOne("user.userSelectOne",user);
	}
	
}
