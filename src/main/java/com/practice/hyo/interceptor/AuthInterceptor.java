package com.practice.hyo.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.practice.hyo.domain.UserVO;
import com.practice.hyo.service.UserService;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Autowired
	private UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		
		HttpSession session = request.getSession();
		
		// 세션에 로그인 값이 없을 시
		if (session.getAttribute("login") == null) {
			
			logger.info("current user is not logined");
			
			saveDest(request);
			// 쿠키에 로그인 정보 저장
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			// 쿠키에 저장된 로그인 정보 확인 후 저장 되어있으면 로그인 처리
			if (loginCookie != null) {
				logger.info("check loginCookie........");
				UserVO userVO = service.checkLoginBefore(loginCookie.getValue());
				
				logger.info("USERVO: " + userVO);
				
				if (userVO != null) {
					session.setAttribute("login", userVO);
					return true;
				}
				
			}
			
			response.sendRedirect("/user/login");
			return false;
		}
		return true;
	}

	
	// 로그인 페이지 이동 전 페이지 저장 (로그인 후 로그인 요청 페이지로 이동 시키기 위한 데이터)
	private void saveDest(HttpServletRequest req) {
		
		// 요청이 들어온 URI(이동전 URI)
		String uri = req.getRequestURI();
		
		String query = req.getQueryString();
		
		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		if (req.getMethod().equals("GET")) {
			logger.info("dest: " + (uri + query));
			req.getSession().setAttribute("dest", uri + query);
		}
	}
	
}
