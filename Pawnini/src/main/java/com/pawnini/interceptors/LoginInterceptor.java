package com.pawnini.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pawnini.model.member.MemberDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		if(memberDTO == null) {
			response.sendRedirect("main.do");
			return false;
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
							ModelAndView mav) throws Exception{
		super.postHandle(request, response, handler, mav);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) throws Exception{
		super.afterCompletion(request, response, handler, ex);
	}

}
