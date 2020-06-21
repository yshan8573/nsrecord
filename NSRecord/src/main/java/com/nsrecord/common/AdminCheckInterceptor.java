package com.nsrecord.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.nsrecord.dto.UserInfo;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		UserInfo user = (UserInfo)request.getSession().getAttribute("loginUser");
		if(user == null) {
			String msg="세션이 만료되었습니다";
			request.setAttribute("msg",msg);
			request.setAttribute("loc","/admin");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;
		}
		else if(!"admin".equals(user.getU_email()))
		{
			String msg="권한이 없습니다";
			request.setAttribute("msg",msg);
			request.setAttribute("loc","/admin");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;
		}
		
		// 아이디 admin으로 조건 분기 처리
		return super.preHandle(request, response, handler);
	}

	
}
