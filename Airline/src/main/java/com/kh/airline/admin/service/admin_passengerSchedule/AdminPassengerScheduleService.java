package com.kh.airline.admin.service.admin_passengerSchedule;

import java.util.List;

import com.kh.airline.admin.vo.AdminPassengerScheduleVO;
import com.kh.airline.admin.vo.SearchVO;


public interface AdminPassengerScheduleService {
	
	//예매 목록 조회
	List<AdminPassengerScheduleVO> selectPassengerScheduleList(SearchVO searchVO);
	
	AdminPassengerScheduleVO selectPass(AdminPassengerScheduleVO adminPassengerScheduleVO);

	int countPassengerScheduleList(SearchVO searchVO);
	
	void updatePassengerSchedule(AdminPassengerScheduleVO adminPassengerScheduleVO);
	
	void deletePassengerSchedule(AdminPassengerScheduleVO adminPassengerScheduleVO);
	
	void updatePassSeat(AdminPassengerScheduleVO adminPassengerScheduleVO);
	
	void insertPassSeat(AdminPassengerScheduleVO adminPassengerScheduleVO);
	
	
}
