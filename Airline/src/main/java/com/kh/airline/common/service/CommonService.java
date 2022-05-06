package com.kh.airline.common.service;

import java.util.List;

import com.kh.airline.common.vo.MainMenuVO;
import com.kh.airline.ticket.vo.AirScheduleVVO;

public interface CommonService {
	// 메인 메뉴 조회
	public List<MainMenuVO> selectMainMenu();
}
