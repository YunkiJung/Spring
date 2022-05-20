package com.kh.airline.admin.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.airline.admin.service.AdminService;

@Service("adminInterceptor")
public class adminInterceptor extends HandlerInterceptorAdapter{

	// 메뉴 등 기본적인 관리자 서비스
		@Resource(name = "adminService")
		private AdminService adminService;
		
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
			// 상단 메뉴
			modelAndView.addObject("menuList", adminService.selectAdminMenuList());
			Object menuCode = request.getSession().getAttribute("adminMenuCode");
			if(menuCode == null) {
				request.setAttribute("adminMenuCode", "MENU001");
			}
			else {
				request.setAttribute("adminMenuCode", menuCode);
			}
			
		}
}
