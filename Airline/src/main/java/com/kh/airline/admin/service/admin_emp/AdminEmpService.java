package com.kh.airline.admin.service.admin_emp;

import java.util.List;

import com.kh.airline.admin.vo.AdminEmpVO;
import com.kh.airline.admin.vo.SearchVO;

public interface AdminEmpService {
	
	// 직원 목록 조회
	List<AdminEmpVO> selectAdminEmpList(SearchVO searchVO);

	// 직원 정보 조회
	AdminEmpVO selectAdminEmpInfo(AdminEmpVO adminEmpVO);
	
	// 직원 정보 수정
	void updateEmp(AdminEmpVO adminEmpVO);
	
	// 직원 추가
	void insertEmp(AdminEmpVO adminEmpVO);
	
	// 직원 정보 삭제
	void deleteEmp(AdminEmpVO adminEmpVO);
	
	int countEmpList(SearchVO searchVO);
}
