package com.kh.airline.admin.service;

import java.util.List;

import com.kh.airline.admin.vo.AdminMenuVO;

public interface AdminService {

	// 관리자 상단 메뉴
	List<AdminMenuVO> selectAdminMenuList();

	
}
