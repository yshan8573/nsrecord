package com.nsrecord.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsrecord.dao.CommunityDao;

@Service
public class GpxServiceImpl implements GpxService {

	@Autowired
	private CommunityDao dao;
	
}
