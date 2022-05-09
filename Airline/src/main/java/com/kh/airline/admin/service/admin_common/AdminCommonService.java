package com.kh.airline.admin.service.admin_common;

import java.util.List;

import com.kh.airline.admin.vo.AdminAirScheViewVO;
import com.kh.airline.admin.vo.AdminAirplaneVO;
import com.kh.airline.admin.vo.AdminAirportVO;
import com.kh.airline.admin.vo.AdminCountryVO;

public interface AdminCommonService {
	
	List<AdminCountryVO> selectCountry();
	
	List<String> selectPlaneCodeList();
	
	List<String> selectPathCodeList();
	
	List<String> selectTeamCodeList();
	
	List<String> selectDeptCodeList();
	
	List<String> selectManagerCodeList();
	
	List<String> selectJobCodeList();
	
	int selectCapacity(String planeCode);
	
	List<AdminAirplaneVO> selectModelNameList();
	
	List<AdminAirportVO> selectAirportList();

	List<AdminAirportVO> planeModelList(AdminAirplaneVO adminAirplaneVO);
	
	List<AdminAirScheViewVO> selectPlaneList(AdminAirScheViewVO adminAirScheViewVO);
}
