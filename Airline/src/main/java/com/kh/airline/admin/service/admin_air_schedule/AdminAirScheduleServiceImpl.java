package com.kh.airline.admin.service.admin_air_schedule;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.airline.admin.vo.AdminAirScheViewVO;
import com.kh.airline.admin.vo.AdminAirScheduleVO;
import com.kh.airline.admin.vo.AdminFlightPathVO;
import com.kh.airline.admin.vo.AdminSeatInfoVO;
import com.kh.airline.admin.vo.SearchVO;

@Service("adminAirScheduleService")
public class AdminAirScheduleServiceImpl implements AdminAirScheduleService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int countAdminAirSchedule(SearchVO searchVO) {
		return sqlSession.selectOne("adminMapper.countAirSchedule", searchVO);
	}

	@Override
	public List<AdminAirScheduleVO> selectAdminAirScheduleList(SearchVO searchVO) {
		return sqlSession.selectList("adminMapper.selectAirScheduleList", searchVO);
	}

	@Override
	public AdminAirScheduleVO selectAdminAirSchedule(AdminAirScheduleVO adminAirScheduleVO) {
		return sqlSession.selectOne("adminMapper.selectAirSchedule", adminAirScheduleVO);
	}

	@Override
	public void deleteAdminAirSchedule(AdminAirScheduleVO adminAirScheduleVO) {
		sqlSession.delete("adminMapper.deleteSeatInfo", adminAirScheduleVO);
		sqlSession.delete("adminMapper.deleteAdminAirSchedule", adminAirScheduleVO);
	}

	@Override
	public void insertAirSchedule(AdminAirScheduleVO adminAirScheduleVO) {
		sqlSession.insert("adminMapper.insertAirSchedule", adminAirScheduleVO);
		
		sqlSession.insert("adminMapper.insertSeatInfo");
	}

	@Override
	public void updateAirSchedule(AdminAirScheduleVO adminAirScheduleVO) {
		sqlSession.update("adminMapper.updateAirSchedule", adminAirScheduleVO);
	}

	@Override
	public List<AdminSeatInfoVO> selectSeatInfo(AdminAirScheduleVO adminAirScheduleVO) {
		return sqlSession.selectList("adminMapper.selectSeatColCode", adminAirScheduleVO);
	}

	@Override
	public int selectSeatRowNum(AdminAirScheduleVO adminAirScheduleVO) {
		return sqlSession.selectOne("adminMapper.selectSeatRowNum", adminAirScheduleVO);
	}

	@Override
	public List<String> isBookedCheck(String airScheCode) {
		return sqlSession.selectList("adminMapper.isBookedCheck", airScheCode);
	}

	@Override
	public int countAdminPlaneList(SearchVO searchVO) {
		return sqlSession.selectOne("adminMapper.countAdminPlaneList", searchVO);
	}


	@Override
	public List<AdminAirScheViewVO> selectPlaneList(SearchVO searchVO) {
		return sqlSession.selectList("adminMapper.selectPlaneList", searchVO);
	}

	@Override
	public int countAirSchedule(SearchVO searchVO) {
		return sqlSession.selectOne("adminMapper.countAirSchedule", searchVO);
	}
	
	@Override
	public List<AdminAirScheViewVO> selectAirScheduleList(SearchVO searchVO) {
		return sqlSession.selectList("adminMapper.selectAirScheduleList", searchVO);
	}

	@Override
	public AdminAirScheViewVO setInsertAirSche(AdminAirScheduleVO adminAirScheduleVO) {
		return sqlSession.selectOne("adminMapper.setInsertAirSche", adminAirScheduleVO);
	}

	@Override
	public List<String> arrivalPortList(String planeCode) {
		return sqlSession.selectList("adminMapper.arrivalPortList", planeCode);
	}

	@Override
	public String selectPathCode(AdminFlightPathVO adminFlightPathVO) {
		return sqlSession.selectOne("adminMapper.selectPathCode", adminFlightPathVO);
	}

	

}
