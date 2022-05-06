package com.kh.airline.admin.service.admin_air_schedule;

import java.util.List;

import com.kh.airline.admin.vo.AdminAirScheduleVO;
import com.kh.airline.admin.vo.AdminSeatInfoVO;
import com.kh.airline.admin.vo.SearchVO;

public interface AdminAirScheduleService {
	
	// 비행 일정 수 조회
	int countAdminAirSchedule(SearchVO searchVO);
	
	// 비행 일정 목록 조회
	List<AdminAirScheduleVO> selectAdminAirScheduleList(SearchVO searchVO);
	
	
	// 비행 일정 정보 조회
	AdminAirScheduleVO selectAdminAirSchedule(AdminAirScheduleVO adminAirScheduleVO);
	
	// 일정 삭제
	void deleteAdminAirSchedule(AdminAirScheduleVO adminAirScheduleVO);

	// 일정 추가
	void insertAirSchedule(AdminAirScheduleVO adminAirScheduleVO);
	
	// 일정 변경
	void updateAirSchedule(AdminAirScheduleVO adminAirScheduleVO);
	
	// 좌석 조회
	List<AdminSeatInfoVO> selectSeatInfo(AdminAirScheduleVO adminAirScheduleVO);
	int selectSeatRowNum(AdminAirScheduleVO adminAirScheduleVO);
	
	// Null인 좌석 조회
	List<String> isBookedCheck(String airScheCode);
	
	
	
	
}
