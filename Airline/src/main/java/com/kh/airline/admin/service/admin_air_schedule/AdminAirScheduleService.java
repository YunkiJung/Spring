package com.kh.airline.admin.service.admin_air_schedule;

import java.util.List;

import com.kh.airline.admin.vo.AdminAirScheViewVO;
import com.kh.airline.admin.vo.AdminAirScheduleVO;
import com.kh.airline.admin.vo.AdminFlightPathVO;
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
	
	// planeCode 목록 조회
	int countAdminPlaneList(SearchVO searchVO);
	
	// 항공기 목록 조회
	List<AdminAirScheViewVO> selectPlaneList(SearchVO searchVO);
	
	// 운항 수
	int countAirSchedule(SearchVO searchVO);
	
	// 일정 목록 조회
	List<AdminAirScheViewVO> selectAirScheduleList(SearchVO searchVO);
	
	// 일정 추가을 위한 마지막 운항 정보
	AdminAirScheViewVO setInsertAirSche(AdminAirScheduleVO adminAirScheduleVO);
	
	// 마지막 공항에 대한 목적지 목록
	List<String> arrivalPortList(String planeCode);
	
	// pathCode 조회
	String selectPathCode(AdminFlightPathVO adminFlightPathVO);
	
}
