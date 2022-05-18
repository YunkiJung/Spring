package com.kh.airline.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.airline.admin.service.admin_air_schedule.AdminAirScheduleService;
import com.kh.airline.admin.service.admin_common.AdminCommonService;
import com.kh.airline.admin.service.admin_emp.AdminEmpService;
import com.kh.airline.admin.service.admin_flightPath.AdminFlightPathService;
import com.kh.airline.admin.service.admin_member.AdminAirMemberService;
import com.kh.airline.admin.service.admin_passengerSchedule.AdminPassengerScheduleService;
import com.kh.airline.admin.vo.AdminAirMemberVO;
import com.kh.airline.admin.vo.AdminAirScheViewVO;
import com.kh.airline.admin.vo.AdminAirScheduleVO;
import com.kh.airline.admin.vo.AdminAirplaneVO;
import com.kh.airline.admin.vo.AdminEmpVO;
import com.kh.airline.admin.vo.AdminFlightPathVO;
import com.kh.airline.admin.vo.AdminPassengerScheduleVO;
import com.kh.airline.admin.vo.SalesVO;
import com.kh.airline.admin.vo.SearchVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	// 회원 관련 관리자 서비스
	@Resource(name = "adminAirMemberService")
	private AdminAirMemberService adminAirMemberService;

	// 직원 관련 관리자 서비스
	@Resource(name = "adminEmpService")
	private AdminEmpService adminEmpService;

	// 예매 관련 관리자 서비스
	@Resource(name = "adminPassengerScheduleService")
	private AdminPassengerScheduleService apsService;

	// 경로 관련 관리자 서비스
	@Resource(name = "adminFlightPathService")
	private AdminFlightPathService afpService;

	// 비행 일정 관련 관리자 서비스
	@Resource(name = "adminAirScheduleService")
	private AdminAirScheduleService aasService;

	// 공용 정보 관련 서비스
	@Resource(name = "adminCommonService")
	private AdminCommonService adminCommonService;

	// 첫 화면 겸 매출 현황
	@GetMapping("/sales")
	public String AdminPage(Model model) {

		return "admin/sales";
	}

	
	 @ResponseBody
	 @PostMapping("/salesSumForMonth") 
	 public List<SalesVO> salesSumForMonth(){
	 return apsService.salesSumForMonth();
	 }
	

	////////////// 회원관리 기능////////////////////
	@GetMapping("/memberManage")
	public String memberManage(Model model, SearchVO searchVO) {

		// 페이징
		int listCnt = adminAirMemberService.countMemberList(searchVO);
		searchVO.setTotalCnt(listCnt);
		searchVO.setPageInfo();

		// 회원 목록
		model.addAttribute("memberList", adminAirMemberService.selectAdminMemberList(searchVO));

		// 국가 목록
		model.addAttribute("countryList", adminCommonService.selectCountry());

		return "admin/member_manage_list";
	}

	// 모달용 회원 정보 조회
	@ResponseBody
	@PostMapping("/selectMember")
	public AdminAirMemberVO selectMember(AdminAirMemberVO adminMemberVO) {

		// 회원 정보 조회
		AdminAirMemberVO adminAirMemberVO = (adminAirMemberService.selectAdminAirMember(adminMemberVO));

		return adminAirMemberVO;
	}

	// 회원 삭제
	@PostMapping("/deleteMember")
	public String deleteMember(AdminAirMemberVO adminAirMemberVO) {

		adminAirMemberService.deleteAirMember(adminAirMemberVO);

		return "redirect:/admin/memberManage";
	}

	// 회원 정보 수정
	@PostMapping("/updateMember")
	public String updateMember(AdminAirMemberVO adminAirMemberVO) {

		adminAirMemberService.updateAirMember(adminAirMemberVO);

		return "redirect:/admin/memberManage";
	}

//직원 관리 기능
	// 직원 조회 페이지
	@GetMapping("/empManage")
	public String empManage(SearchVO searchVO, Model model) {

		int listCnt = adminEmpService.countEmpList(searchVO);

		searchVO.setTotalCnt(listCnt);
		searchVO.setPageInfo();

		// 직원 목록
		model.addAttribute("empList", adminEmpService.selectAdminEmpList(searchVO));
		// DEPT LIST
		model.addAttribute("deptList", adminCommonService.selectDeptCodeList());
		// 팀 목록
		model.addAttribute("teamList", adminCommonService.selectTeamCodeList());
		// MANAGER CODE LIST
		model.addAttribute("managerList", adminCommonService.selectManagerCodeList());
		// Job Code List
		model.addAttribute("jobList", adminCommonService.selectJobCodeList());
		// 국가 목록 = nationality
		model.addAttribute("countryList", adminCommonService.selectCountry());

		return "admin/emp_manage_list";
	}

	// 모달용 직원 조회
	@ResponseBody
	@RequestMapping("/selectEmp")
	public AdminEmpVO selectEmp(AdminEmpVO adminEmpVO) {
		// 선택 직원 조회
		AdminEmpVO result = adminEmpService.selectAdminEmpInfo(adminEmpVO);

		return result;
	}

	// 직원 정보 수정
	@PostMapping("/updateEmp")
	public String updateEmp(AdminEmpVO adminEmpVO) {

		adminEmpService.updateEmp(adminEmpVO);
		return "redirect:/admin/empManage";
	}

	// 직원 추가
	@PostMapping("/insertEmp")
	public String insertEmp(AdminEmpVO adminEmpVO) {

		adminEmpService.insertEmp(adminEmpVO);
		return "redirect:/admin/empManage";
	}

	// 직원 삭제
	@PostMapping("/deleteEmp")
	public String deleteEmp(AdminEmpVO adminEmpVO) {

		// 직원 삭제
		adminEmpService.deleteEmp(adminEmpVO);
		return "redirect:/admin/empManage";
	}

//예매 관리 기능
	// 예매 현황 조회 페이지
	@GetMapping("/passengerManage")
	public String passengerManage(SearchVO searchVO, Model model) {

		int listCnt = apsService.countPassengerScheduleList(searchVO);

		searchVO.setTotalCnt(listCnt);
		searchVO.setPageInfo();

		// 예매 목록
		model.addAttribute("passList", apsService.selectPassengerScheduleList(searchVO));
		// 국가 목록
		model.addAttribute("countryList", adminCommonService.selectCountry());
		return "admin/pass_manage_list";
	}

	// 모달용 예매 상세 조회
	@ResponseBody
	@PostMapping("/selectPass")
	public AdminPassengerScheduleVO selectPass(AdminPassengerScheduleVO adminPassengerScheduleVO) {

		// 예매 정보 조회
		AdminPassengerScheduleVO passSchedule = apsService.selectPass(adminPassengerScheduleVO);

		return passSchedule;
	}

	// 예매 정보 수정
	@GetMapping("/updatePass")
	public String updatePass(AdminPassengerScheduleVO adminPassengerScheduleVO) {
		apsService.updatePassengerSchedule(adminPassengerScheduleVO);
		return "redirect:/admin/passengerManage";
	}

	// 예매 정보 삭제
	@GetMapping("/deletePass")
	public String deletePass(AdminPassengerScheduleVO adminPassengerScheduleVO) {
		apsService.deletePassengerSchedule(adminPassengerScheduleVO);
		return "redirect:/admin/passengerManage";
	}

// 비행 일정 관리
	// 항공기 목록
	@GetMapping("/airScheManage")
	public String airScheManage(SearchVO searchVO, Model model) {

		int listCnt = aasService.countAdminPlaneList(searchVO);

		searchVO.setTotalCnt(listCnt);
		searchVO.setPageInfo();

		model.addAttribute("planeList", aasService.selectPlaneList(searchVO));
		model.addAttribute("currentDate", getCurrentDateToString());

		return "admin/plane_list";
	}

	// 운항 리스트
	@RequestMapping("/airScheList")
	public String airScheList(SearchVO searchVO, Model model) {
		int listCnt = aasService.countAirSchedule(searchVO);

		searchVO.setTotalCnt(listCnt);
		searchVO.setPageInfo();

		model.addAttribute("airScheduleList", aasService.selectAirScheduleList(searchVO));
//		int listCnt = aasService.countAdminAirSchedule(searchVO);
//		
//		searchVO.setTotalCnt(listCnt);
//		searchVO.setPageInfo();
//		
//		// 일정 목록
//		model.addAttribute("airScheduleList", aasService.selectAdminAirScheduleList(searchVO));

		// 일반 공항 목록
		model.addAttribute("portCodeList", adminCommonService.selectAirportList());

		// 공항 목록
		model.addAttribute("portList", adminCommonService.selectAirportList());

		// 항공기 목록
		model.addAttribute("planeList", adminCommonService.selectModelNameList());

		// 경로 목록
		model.addAttribute("pathList", adminCommonService.selectPathCodeList());

		// 팀 목록
		model.addAttribute("teamList", adminCommonService.selectTeamCodeList());

		return "admin/air_schedule_manage_list";
	}

	// 모달용 비행 일정 정보 상세 조회
	@PostMapping("/selectAirSche")
	@ResponseBody
	public AdminAirScheduleVO selectAirSche(AdminAirScheduleVO adminAirScheduleVO) {
		return aasService.selectAdminAirSchedule(adminAirScheduleVO);
	}

	// 운항 추가 준비
	@ResponseBody
	@PostMapping("/setInsertAirSche")
	public Map<String, Object> setInsertAirSche(AdminAirScheduleVO adminAirScheduleVO) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("final", aasService.setInsertAirSche(adminAirScheduleVO));

		map.put("arrivalPortList", aasService.arrivalPortList(adminAirScheduleVO.getPlaneCode()));
		return map;
	}

	// 운항 추가 전 pathCode 조회
	@ResponseBody
	@PostMapping("/selectPathCode")
	public String selectPathCode(AdminFlightPathVO adminFlightPathVO) {

		return aasService.selectPathCode(adminFlightPathVO);
	}

	// 운항 추가
	@PostMapping("/insertAirSche")
	public String insertAirSche(AdminAirScheduleVO adminAirScheduleVO) {
		aasService.insertAirSchedule(adminAirScheduleVO);
		return "redirect:/admin/airScheManage";
	}

	// 운항 정보 수정
	@PostMapping("/updateAirSche")
	public String updateAirSche(AdminAirScheduleVO adminAirScheduleVO) {
		aasService.updateAirSchedule(adminAirScheduleVO);
		return "redirect:/admin/airScheManage";
	}

	// 운항 정보 삭제
	@PostMapping("/deleteAirSche")
	public String deleteAirSche(AdminAirScheduleVO adminAirScheduleVO) {
		aasService.deleteAdminAirSchedule(adminAirScheduleVO);
		return "redirect:/admin/airScheManage";
	}

	// 좌석 정보 조회
	@RequestMapping("/selectSeatInfo")
	public String selectSeatInfo(AdminAirScheduleVO adminAirScheduleVO, Model model) {
		model.addAttribute("colCode", aasService.selectSeatInfo(adminAirScheduleVO));
		model.addAttribute("rowNum", (aasService.selectSeatRowNum(adminAirScheduleVO)));
		model.addAttribute("countryList", adminCommonService.selectCountry());
		System.out.println(adminAirScheduleVO.getAirScheCode());

		System.out.println(adminAirScheduleVO);

		return "admin/admin_check_seat";
	}

	@ResponseBody
	@RequestMapping("/nullCheck")
	public List<String> nullCheck(String airScheCode) {
		System.out.println(airScheCode);
		List<String> seatCode = aasService.isBookedCheck(airScheCode);

		return seatCode;
	}

	// 좌석 정보 상세 조회
	@ResponseBody
	@PostMapping("/checkPassScheForSeat")
	public AdminPassengerScheduleVO selectPassScheForSeat(AdminPassengerScheduleVO adminPassengerScheduleVO) {
		System.out.println(adminPassengerScheduleVO.getAirScheCode());
		return apsService.selectPass(adminPassengerScheduleVO);
	}

	// 좌석 정보 수정
	@PostMapping("/updatePassSeat")
	public String updatePassSeat(AdminPassengerScheduleVO adminPassengerScheduleVO,
			AdminAirScheduleVO adminAirScheduleVO, Model model) {
		System.out.println(adminPassengerScheduleVO.getAirScheCode());

		if (adminPassengerScheduleVO.getPassName().equals("") || adminPassengerScheduleVO.getPassName() == null) {
			apsService.insertPassSeat(adminPassengerScheduleVO);

		} else {
			apsService.updatePassSeat(adminPassengerScheduleVO);
		}
		model.addAttribute("colCode", aasService.selectSeatInfo(adminAirScheduleVO));
		model.addAttribute("rowNum", (aasService.selectSeatRowNum(adminAirScheduleVO)));
		model.addAttribute("countryList", adminCommonService.selectCountry());

		return "admin/admin_check_seat";
	}

	// 일정 관리 페이지
	@GetMapping("/dateManage")
	public String dateManage() {
		return "admin/date_manage";
	}

	// 문의사항 조회 페이지
	@GetMapping("/inquire")
	public String inquire() {
		return "admin/inquire_page";
	}

	@GetMapping("/adminLogout")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "ticket/search";
	}

// 메인 페이지로 이동
	@GetMapping("/home")
	public String mainPage() {
		return "ticket/search";
	}

	public String getCurrentDateToString() {

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();

		String time1 = format1.format(time);

		return time1;
	}

}
