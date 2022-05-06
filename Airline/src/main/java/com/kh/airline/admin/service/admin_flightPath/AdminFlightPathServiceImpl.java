package com.kh.airline.admin.service.admin_flightPath;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.airline.admin.vo.AdminFlightPathVO;
import com.kh.airline.admin.vo.SearchVO;

@Service("adminFlightPathService")
public class AdminFlightPathServiceImpl implements AdminFlightPathService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<AdminFlightPathVO> selectFlightPathList(SearchVO searchVO) {
		return sqlSession.selectList("adminMapper.selectFlightPathList", searchVO);
	}

	@Override
	public int countFlightPathList(SearchVO searchVO) {
		return sqlSession.selectOne("adminMapper.countFlightPathList", searchVO);
	}

	@Override
	public AdminFlightPathVO selectFlightPath(AdminFlightPathVO adminFlightPathVO) {
		return sqlSession.selectOne("adminMapper.selectFlightPath", adminFlightPathVO);
	}

	@Override
	public void updateFlightPath(AdminFlightPathVO adminFlightPathVO) {
		sqlSession.update("adminMapper.updateFlightPath", adminFlightPathVO);
	}

	@Override
	public void deletePathCode(AdminFlightPathVO adminFlightPathVO) {
		sqlSession.delete("adminMapper.deletePathCode", adminFlightPathVO);
		
	}
	
	

}
