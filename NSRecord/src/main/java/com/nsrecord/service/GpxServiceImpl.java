package com.nsrecord.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsrecord.dao.ICommunityDao;

@Service
public class GpxServiceImpl implements GpxService {

	@Autowired
	private ICommunityDao dao;
	
}
