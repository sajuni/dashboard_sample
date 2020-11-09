package com.practice.hyo.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession(); // 세션 생성
		ModelMap modelMap = modelAndView.getModelMap(); // 모델 맵에 모델엔 뷰 정보 저장
		Object userVO = modelMap.get("userVO"); // 오브젝트타입 userVO에  모델맵 키 값userVO를 불러와 저장
		
		// 로그인 성공 시
		if (userVO != null) {
			logger.info("new login success");
			session.setAttribute(LOGIN, userVO); // 세션에 로그인 정보 저장
			// 아이디저장 체크박스 여부 확인
			if (request.getParameter("userCookie") != null) {
				
				logger.info("remember me.............");
				Cookie loginCookie = new Cookie("loginCookie", session.getId()); // 쿠키를 생성 세션에저장된 아이디를 이용
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(loginCookie);
			}
			
			
//			response.sendRedirect("/")
			Object dest = session.getAttribute("dest");
			logger.info("dest : " + dest);
			response.sendRedirect(dest != null ? (String)dest:"/");
		}
		
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		return true;
		
	}
	
}
