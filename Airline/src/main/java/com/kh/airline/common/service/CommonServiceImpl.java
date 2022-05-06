package com.kh.airline.common.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.airline.common.vo.MainMenuVO;
import com.kh.airline.ticket.vo.AirScheduleVVO;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//메인 메뉴 조회
	@Override
	public List<MainMenuVO> selectMainMenu() {
		return sqlSession.selectList("commonMapper.selectMainMenu");
	}

}
