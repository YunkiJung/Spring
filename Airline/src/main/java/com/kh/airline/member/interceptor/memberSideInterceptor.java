package com.kh.airline.member.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tiles.request.Request;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.airline.common.service.CommonService;
import com.kh.airline.member.service.AirMemberService;

@Service("memberSideInterceptor")
public class memberSideInterceptor extends HandlerInterceptorAdapter {
	
	@Resource(name = "airMemberService")
	private AirMemberService airMemberService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		modelAndView.addObject("memSideMenuList", airMemberService.selectMemSide());
		
		String sideMenuCode = request.getParameter("sideMenuCode");
		
		if(modelAndView.getViewName().equals("member/mem_detail")) {
			if(sideMenuCode == null) {
				sideMenuCode = "SIDE_MENU_001";
			}
		}
		else if(modelAndView.getViewName().equals("member/ch_password_page")) {
			if(sideMenuCode == null) {
				sideMenuCode = "SIDE_MENU_002";
			}
		}
		modelAndView.addObject("selectedSideMenu", sideMenuCode);
	}
}
