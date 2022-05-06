package com.kh.airline.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.airline.admin.vo.AdminMenuVO;
import com.kh.airline.admin.vo.SearchVO;


@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<AdminMenuVO> selectAdminMenuList() {
		return sqlSession.selectList("adminMapper.selectAdminMenuList");
	}


}
