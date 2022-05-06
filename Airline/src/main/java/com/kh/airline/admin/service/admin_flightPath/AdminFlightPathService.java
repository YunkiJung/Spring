package com.kh.airline.admin.service.admin_flightPath;

import java.util.List;

import com.kh.airline.admin.vo.AdminFlightPathVO;
import com.kh.airline.admin.vo.SearchVO;

public interface AdminFlightPathService {

	// 경로 목록 조회
	List<AdminFlightPathVO> selectFlightPathList(SearchVO searchVO);
	
	// 경로 수 조회
	int countFlightPathList(SearchVO searchVO);
	
	// 경로 상세 조회
	AdminFlightPathVO selectFlightPath(AdminFlightPathVO adminFlightPathVO);
	
	// 경로 내용 수정
	void updateFlightPath(AdminFlightPathVO adminFlightPathVO);
	
	// 경로 삭제
	void deletePathCode(AdminFlightPathVO adminFlightPathVO);
}
