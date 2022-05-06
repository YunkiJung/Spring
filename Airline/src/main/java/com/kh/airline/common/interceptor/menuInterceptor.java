package com.kh.airline.common.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tiles.request.Request;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.airline.common.service.CommonService;

@Service("menuInterceptor")
public class menuInterceptor extends HandlerInterceptorAdapter {
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		modelAndView.addObject("mainMenuList", commonService.selectMainMenu());
		
	}
}
