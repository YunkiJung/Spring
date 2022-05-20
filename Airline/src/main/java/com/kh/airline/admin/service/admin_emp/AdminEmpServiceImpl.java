package com.kh.airline.admin.service.admin_emp;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.airline.admin.vo.AdminEmpVO;
import com.kh.airline.admin.vo.SearchVO;


@Service("adminEmpService")
public class AdminEmpServiceImpl implements AdminEmpService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<AdminEmpVO> selectAdminEmpList(SearchVO searchVO) {
		return sqlSession.selectList("adminMapper.selectEmpList", searchVO);
	}

	@Override
	public AdminEmpVO selectAdminEmpInfo(AdminEmpVO adminEmpVO) {
		return sqlSession.selectOne("adminMapper.selectEmp", adminEmpVO);
	}

	@Override
	public void updateEmp(AdminEmpVO adminEmpVO) {
		sqlSession.update("adminMapper.updateEmp", adminEmpVO);
	}
	
	@Override
	public void insertEmp(AdminEmpVO adminEmpVO) {
		sqlSession.insert("adminMapper.insertEmp", adminEmpVO);
	}

	@Override
	public void deleteEmp(AdminEmpVO adminEmpVO) {
		sqlSession.delete("adminMapper.deleteEmpImage", adminEmpVO);
		sqlSession.delete("adminMapper.deleteEmp", adminEmpVO);
	}

	@Override
	public int countEmpList(SearchVO searchVO) {
		return sqlSession.selectOne("adminMapper.countEmpList", searchVO);
	}


}
