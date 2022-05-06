package com.kh.airline.admin.service.admin_member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.airline.admin.vo.AdminAirMemberVO;
import com.kh.airline.admin.vo.SearchVO;

@Service("adminAirMemberService")
public class AdminAirMemberServiceImpl implements AdminAirMemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void insertMember(AdminAirMemberVO adminAirMemberVO) {
		sqlSession.insert("adminMapper.insertAirMember", adminAirMemberVO);
	}

	@Override
	public List<AdminAirMemberVO> selectAdminMemberList(SearchVO searchVO) {
		return sqlSession.selectList("adminMapper.selectAdminMemberList", searchVO);
	}

	@Override
	public AdminAirMemberVO selectAdminAirMember(AdminAirMemberVO adminAirMemberVO) {
		return sqlSession.selectOne("adminMapper.selectAdminMember", adminAirMemberVO);
	}

	@Override
	public void deleteAirMember(AdminAirMemberVO adminAirMemberVO) {
		sqlSession.delete("adminMapper.deleteAirMember", adminAirMemberVO);
	}

	@Override
	public void updateAirMember(AdminAirMemberVO adminAirMemberVO) {
		sqlSession.update("adminMapper.updateAirMember", adminAirMemberVO);
	}

	@Override
	public int countMemberList(SearchVO searchVO) {
		return sqlSession.selectOne("adminMapper.countMemberList", searchVO);
	}


}
