package com.nsrecord.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsrecord.dao.MemberDao;
import com.nsrecord.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;

	@Override
	public Member memberSelectOne(Member member) {
		return dao.memberSelectOne(member);
	}
	
}
