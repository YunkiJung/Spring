package com.kh.airline.admin.service.admin_member;

import java.util.List;

import com.kh.airline.admin.vo.AdminAirMemberVO;
import com.kh.airline.admin.vo.SearchVO;


public interface AdminAirMemberService {
	
	//회원 추가
	void insertMember(AdminAirMemberVO adminAirMemberVO);
	
	//회원 목록 조회
	List<AdminAirMemberVO> selectAdminMemberList(SearchVO searchVO);
	
	AdminAirMemberVO selectAdminAirMember(AdminAirMemberVO adminAirMemberVO);
	
	void deleteAirMember(AdminAirMemberVO adminAirMemberVO);
	
	void updateAirMember(AdminAirMemberVO adminAirMemberVO);
	
	// 회원 수 조회
	public int countMemberList(SearchVO searchVO);
}
