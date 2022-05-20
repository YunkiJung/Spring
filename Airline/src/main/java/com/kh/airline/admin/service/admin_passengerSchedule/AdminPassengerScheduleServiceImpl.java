package com.kh.airline.admin.service.admin_passengerSchedule;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.airline.admin.vo.AdminPassengerScheduleVO;
import com.kh.airline.admin.vo.SalesVO;
import com.kh.airline.admin.vo.SearchVO;

@Service("adminPassengerScheduleService")
public class AdminPassengerScheduleServiceImpl implements AdminPassengerScheduleService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<AdminPassengerScheduleVO> selectPassengerScheduleList(
			SearchVO searchVO) {
		return sqlSession.selectList("adminMapper.selectPassengerScheduleList", searchVO);
	}


	@Override
	public AdminPassengerScheduleVO selectPass(AdminPassengerScheduleVO adminPassengerScheduleVO) {
		return sqlSession.selectOne("adminMapper.selectPassengerSchedule", adminPassengerScheduleVO);
	}


	@Override
	public int countPassengerScheduleList(SearchVO searchVO) {
		return sqlSession.selectOne("adminMapper.countPassengerScheduleList", searchVO);
	}


	@Override
	public void updatePassengerSchedule(AdminPassengerScheduleVO adminPassengerScheduleVO) {
		sqlSession.update("adminMapper.updatePassengerSchedule", adminPassengerScheduleVO);
	}


	@Override
	public void deletePassengerSchedule(AdminPassengerScheduleVO adminPassengerScheduleVO) {
		sqlSession.delete("adminMapper.deletePassengerSchedule", adminPassengerScheduleVO);
	}


	@Override
	public void updatePassSeat(AdminPassengerScheduleVO adminPassengerScheduleVO) {
		sqlSession.update("adminMapper.updateSeatNull", adminPassengerScheduleVO);
		sqlSession.update("adminMapper.updatePassSeat", adminPassengerScheduleVO);
		sqlSession.update("adminMapper.updateSeatNum", adminPassengerScheduleVO);
	}


	@Override
	public void insertPassSeat(AdminPassengerScheduleVO adminPassengerScheduleVO) {
		sqlSession.insert("adminMapper.insertPassSeat", adminPassengerScheduleVO);
	}


	@Override
	public List<SalesVO> salesSumForMonth(String selectedYear) {
		return sqlSession.selectList("adminMapper.salesSumForMonth", selectedYear);
	}

}
