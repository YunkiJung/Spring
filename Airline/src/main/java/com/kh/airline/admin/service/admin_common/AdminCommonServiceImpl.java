package com.kh.airline.admin.service.admin_common;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.airline.admin.vo.AdminAirScheViewVO;
import com.kh.airline.admin.vo.AdminAirplaneVO;
import com.kh.airline.admin.vo.AdminAirportVO;
import com.kh.airline.admin.vo.AdminCountryVO;
import com.kh.airline.admin.vo.SearchVO;

@Service("adminCommonService")
public class AdminCommonServiceImpl implements AdminCommonService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<AdminCountryVO> selectCountry() {
		return sqlSession.selectList("adminMapper.selectCountry");
	}

	@Override
	public List<String> selectPlaneCodeList() {
		return sqlSession.selectList("adminMapper.selectPlaneCodeList");
	}

	@Override
	public List<String> selectPathCodeList() {
		return sqlSession.selectList("adminMapper.selectPathCodeList");
	}

	@Override
	public List<String> selectTeamCodeList() {
		return sqlSession.selectList("adminMapper.selectTeamCodeList");
	}

	@Override
	public List<String> selectDeptCodeList() {
		return sqlSession.selectList("adminMapper.selectDeptCodeList");
	}

	@Override
	public List<String> selectManagerCodeList() {
		return sqlSession.selectList("adminMapper.selectManagerCodeList");
	}

	@Override
	public List<String> selectJobCodeList() {
		return sqlSession.selectList("adminMapper.selectJobCodeList");
	}

	@Override
	public int selectCapacity(String planeCode) {
		return sqlSession.selectOne("adminMapper.selectCapacity", planeCode);
	}

	@Override
	public List<String> selectAirportList() {
		return sqlSession.selectList("adminMapper.selectAirportList");
	}

	@Override
	public List<AdminAirplaneVO> selectModelNameList() {
		return sqlSession.selectList("adminMapper.selectModelNameList");
	}
	
	@Override
	public List<AdminAirportVO> planeModelList(AdminAirplaneVO adminAirplaneVO) {
		return sqlSession.selectList("adminMapper.planeModelList", adminAirplaneVO);
	}

	/*
	 * @Override public List<String> portList() { return
	 * sqlSession.selectList("adminMapper.portList"); }
	 */

	
	
	

}
