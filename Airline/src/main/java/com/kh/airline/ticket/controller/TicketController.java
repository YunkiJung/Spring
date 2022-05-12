package com.kh.airline.ticket.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.airline.ticket.service.TicketService;
import com.kh.airline.member.vo.AirMemberVO;
import com.kh.airline.ticket.vo.AirScheduleVVO;
import com.kh.airline.ticket.vo.MyGpsInfoVO;
import com.kh.airline.ticket.vo.PassengerScheduleVO;
import com.kh.airline.ticket.vo.PortInfoVO;
import com.kh.airline.ticket.vo.SearchInfoVO;


@Controller
@RequestMapping("/ticket")
public class TicketController {
	
	@Resource(name = "ticketService")
	private TicketService ticketService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@ResponseBody
	@PostMapping("/selectMyGpsAirScheduleList")
	public List<AirScheduleVVO> selectMyGpsAirScheduleList(MyGpsInfoVO myGpsInfoVO){
		
		
		return ticketService.selectAirScheduleListFromMyGps(myGpsInfoVO);
	}
	
	
	
	//to search.jsp (main) - yunki - 2022.04.19
	@GetMapping("/search")
	public String search(Model model, HttpSession session) {
		
		model.addAttribute("firstDefaultDate", getAWeekLater());
		model.addAttribute("secondDefaultDate", getTwoWeeksLater());
		System.out.println(getAWeekLater());
		System.out.println(getTwoWeeksLater());
		
		
		
		
		session.removeAttribute("searchInfo");
		session.removeAttribute("departureAirScheCode");
		session.removeAttribute("returnAirScheCode");
		session.removeAttribute("departureSelectedSeatNumList");
		session.removeAttribute("returnSelectedSeatNumList");
		session.removeAttribute("passengerScheduleList");
		session.removeAttribute("seatCountDown");
		
		
		return "ticket/search";
	}
	
	@ResponseBody
	@PostMapping("/searchPortsInfo")
	public List<PortInfoVO> searchPortsInfo(String searchCity) {
		
		
		System.out.println(ticketService.selectPortsInfo(searchCity));
		
		return ticketService.selectPortsInfo(searchCity);
	}
	
	@PostMapping("/searchAirSchedule")
	public String searchAirSchedule(Model model, SearchInfoVO searchInfoVO, HttpSession session) {
		
		//System.out.println(searchInfoVO);
		
		//System.out.println(ticketService.selectAirScheduleList(searchInfoVO));
		session.setAttribute("searchInfo", searchInfoVO);
		
		model.addAttribute("airScheduleList", ticketService.selectAirScheduleList(searchInfoVO));
		
		
		if(session.getAttribute("departureAirScheCode") != null){
			session.removeAttribute("departureAirScheCode");
		}
		
		if(session.getAttribute("returnAirScheCode") != null){
			session.removeAttribute("returnAirScheCode");
		}
		
		return "ticket/air_schedule";
	}
	
	@GetMapping("/searchReturnAirSchedule")
	public String searchReturnAirSchedule(String airScheCode, Model model, HttpSession session, SearchInfoVO returnSearchInfoVO) {
		
		//System.out.println(searchInfoVO);
		
		//System.out.println(ticketService.selectAirScheduleList(searchInfoVO));
		SearchInfoVO searchInfoVO = (SearchInfoVO)session.getAttribute("searchInfo");
		
		returnSearchInfoVO.setDeparturePortCode(searchInfoVO.getArrivalPortCode());
		returnSearchInfoVO.setArrivalPortCode(searchInfoVO.getDeparturePortCode());
		returnSearchInfoVO.setDepartureDate(searchInfoVO.getReturnDate());
		//returnSearchInfoVO.setReturnDate(searchInfoVO.getReturnDate());
		returnSearchInfoVO.setCount(searchInfoVO.getCount());
		returnSearchInfoVO.setHasReturn(searchInfoVO.getHasReturn());
		
		
		
		model.addAttribute("airScheduleList", ticketService.selectAirScheduleList(returnSearchInfoVO));
		
//		if(session.getAttribute("returnAirScheCode") != null) {
//			session.removeAttribute("returnAirScheCode");
//		}
		session.removeAttribute("returnAirScheCode");
		
		session.setAttribute("departureAirScheCode", airScheCode);
		
		
		return "ticket/air_schedule";
	}
	
	//항공권 선택 후 로그인 안된 사용자를 로그인 화면으로 이동
	@GetMapping("/bookingLogin")
	public String bookingLogin(Model model, String airScheCode, HttpSession session) {
		
		System.out.println(airScheCode);
		model.addAttribute("airScheCode", airScheCode);
		
		
		
		if(session.getAttribute("departureAirScheCode") == null) {
			session.setAttribute("departureAirScheCode", airScheCode);
		}
		else if(session.getAttribute("returnAirScheCode") == null && ((SearchInfoVO)session.getAttribute("searchInfo")).getHasReturn().equals("Y")){
			session.setAttribute("returnAirScheCode", airScheCode);
		}
		
		System.out.println("login d" + session.getAttribute("departureAirScheCode"));
		System.out.println("login r" + session.getAttribute("returnAirScheCode"));
		
		return "ticket/booking_login";
	}
	
	//이미 로그인 한 사용자 개인정보 입력화면으로 이동 && 비회원 예매자 개인정보 입력화면으로 이동
	@GetMapping("/passengerInfoForm")
	public String passengerInfoForm(Model model, String airScheCode, HttpSession session) {
		
		
		model.addAttribute("countryList", ticketService.selectCountryList());
		
		if(session.getAttribute("departureAirScheCode") == null) {
			session.setAttribute("departureAirScheCode", airScheCode);
		}
		else if(session.getAttribute("returnAirScheCode") == null && ((SearchInfoVO)session.getAttribute("searchInfo")).getHasReturn().equals("Y")){
			session.setAttribute("returnAirScheCode", airScheCode);
		}
		
		
		
		System.out.println("form d" + session.getAttribute("departureAirScheCode"));
		System.out.println("form r" + session.getAttribute("returnAirScheCode"));
		
		model.addAttribute("airScheCode", airScheCode);
		return "ticket/passenger_info_form";
	}
	
	//로그인 하면서 개인정보 입력화면으로 이동
	@PostMapping("/passengerInfoFormLogin")
	public String passengerInfoFormLogin(Model model, String airScheCode, HttpSession session) {
		
		model.addAttribute("countryList", ticketService.selectCountryList());
		
		model.addAttribute("airScheCode", airScheCode);
		return "ticket/passenger_info_form";
	}
	
	
	@PostMapping("/selectSeat")
	public String selectSeat(Model model
							, HttpSession session
							, String[] passName
							, String[] gender
							, String[] birthDate
							, String[] countryCode
							, String[] passportNum
							, String[] passEmail
							, String[] passAddrs
							, String[] passPhones) 
	{
		
		//model.addAttribute("airScheCode", airScheCode);
		
		//ticketService.selectSeatInfoList(airScheCode);
		//model.addAttribute("seatInfoList", ticketService.selectSeatInfoList(airScheCode));
		
		SearchInfoVO searchInfoVO = (SearchInfoVO)session.getAttribute("searchInfo");
		
		int seatCountDown = ((SearchInfoVO)(session.getAttribute("searchInfo"))).getCount(); 
		
		if(searchInfoVO.getHasReturn().equals("Y")) {
			seatCountDown = seatCountDown * 2;
			session.setAttribute("returnSelectedSeatNumList", new ArrayList<String>());
		}
		
		//선택해야하는 좌석 갯수 세션에 저장
		session.setAttribute("seatCountDown", seatCountDown);
		
		//좌석 번호 담을 리스트 세션에 저장
		session.setAttribute("departureSelectedSeatNumList", new ArrayList<String>());
		
		
		model.addAttribute("seatScreenInfo", ticketService.selectSeatScreenInfo((String)session.getAttribute("departureAirScheCode")));
		
		
		List<PassengerScheduleVO> passengerScheduleList = new ArrayList<PassengerScheduleVO>();
		
		
		String departureAirScheCode = (String)session.getAttribute("departureAirScheCode");
		String returnAirScheCode = (String)session.getAttribute("returnAirScheCode");
		
		int departureBasePrice = ticketService.selectBasePrice(departureAirScheCode);
		int returnBasePrice = 0;
		if(searchInfoVO.getHasReturn().equals("Y")) {
			returnBasePrice = ticketService.selectBasePrice(returnAirScheCode);
		}
		
		
		List<String> passAddrList = new ArrayList<String>();
		for(int i = 0; i < searchInfoVO.getCount() * 4; i += 4) {
			passAddrList.add(passAddrs[i] + ", " + passAddrs[i+1] + ", " + passAddrs[i+2] + ", " + passAddrs[i+3]);
		}
		
		List<String> passPhoneList = new ArrayList<String>();
		for(int i = 0; i < searchInfoVO.getCount() * 3; i += 3) {
			passPhoneList.add(passPhones[i] + "-" + passPhones[i+1] + "-" + passPhones[i+2]);
		}
		
		//create departure ticket information
		for(int i = 0; i < searchInfoVO.getCount(); i++) {
			PassengerScheduleVO passengerScheduleVO = new PassengerScheduleVO();
			passengerScheduleVO.setPassName(passName[i]);
			passengerScheduleVO.setGender(gender[i]);
			passengerScheduleVO.setBirthDate(birthDate[i]);
			passengerScheduleVO.setCountryCode(countryCode[i]);
			passengerScheduleVO.setPassportNum(passportNum[i]);
			passengerScheduleVO.setPassEmail(passEmail[i]);
			passengerScheduleVO.setPassAddr(passAddrList.get(i));
			passengerScheduleVO.setPassPhone(passPhoneList.get(i));
			passengerScheduleVO.setAirScheCode((String)session.getAttribute("departureAirScheCode"));
			passengerScheduleVO.setTicketPrice(departureBasePrice);
			
			
			passengerScheduleList.add(passengerScheduleVO);
		}
		
		
		
		//create for return ticket information
		if(searchInfoVO.getHasReturn().equals("Y")) {
			for(int i = 0; i < searchInfoVO.getCount(); i++) {
				PassengerScheduleVO passengerScheduleVO = new PassengerScheduleVO();
				passengerScheduleVO.setPassName(passName[i]);
				passengerScheduleVO.setGender(gender[i]);
				passengerScheduleVO.setBirthDate(birthDate[i]);
				passengerScheduleVO.setCountryCode(countryCode[i]);
				passengerScheduleVO.setPassportNum(passportNum[i]);
				passengerScheduleVO.setPassEmail(passEmail[i]);
				passengerScheduleVO.setPassAddr(passAddrList.get(i));
				passengerScheduleVO.setPassPhone(passPhoneList.get(i));
				passengerScheduleVO.setAirScheCode((String)session.getAttribute("returnAirScheCode"));
				passengerScheduleVO.setTicketPrice(returnBasePrice);
				
				passengerScheduleList.add(passengerScheduleVO);
			}
		}
		
		for(int i = 0; i < passengerScheduleList.size(); i++) {
			System.out.println(passengerScheduleList.get(i));
		}
		
		session.setAttribute("passengerScheduleList", passengerScheduleList);
		
		return "ticket/select_seat";
	}
	
	@ResponseBody
	@PostMapping("/getBookedSeatList")
	public List<String> getBookedSeatList(String airScheCode) {
		
		//ticketService.selectBookedSeatList(airScheCode);
		
		return ticketService.selectBookedSeatList(airScheCode);
	}
	
	@GetMapping("/confirmSeatNum")
	public String confirmSeatNum(String seatNum, HttpSession session, Model model) {
		
		
		String url = "ticket/select_seat";
		
		SearchInfoVO searchInfoVO = (SearchInfoVO)session.getAttribute("searchInfo");
		
		
		int count = searchInfoVO.getCount();
		
		int seatCountDown = (int)session.getAttribute("seatCountDown");
		
		
		//////////////새로고침 방지///////////////
		List<String> list = new ArrayList<String>();
		
		if(searchInfoVO.getHasReturn().equals("Y")) {
			if(seatCountDown > count) {
				list = ((List<String>)session.getAttribute("departureSelectedSeatNumList"));
			}
			else if(seatCountDown > 0) {
				list = ((List<String>)session.getAttribute("returnSelectedSeatNumList"));
			}
		}
		else {
			list = ((List<String>)session.getAttribute("departureSelectedSeatNumList"));
		}
		
		boolean reload = false;
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).equals(seatNum)) {
				reload = true;
			}
		}
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + reload);
		
		////////////////////새로고침 방지 끝///////////////////
		
		
		//////////////////////선택 좌석 세션 배열에 추가//////////////////
		if(reload == true) {
			
		}
		else {
			if(searchInfoVO.getHasReturn().equals("Y")) {
				if(seatCountDown > count) {
					((List<String>)session.getAttribute("departureSelectedSeatNumList")).add(seatNum);
				}
				else if(seatCountDown > 0){
					((List<String>)session.getAttribute("returnSelectedSeatNumList")).add(seatNum);
				}
			}
			else {
				((List<String>)session.getAttribute("departureSelectedSeatNumList")).add(seatNum);
			}
			
		}
		
		//////////////////////선택 좌석 세션 배열에 추가 끝//////////////////
		
		
		
		System.out.println(count + ", " + seatCountDown);
		System.out.println(((List<String>)session.getAttribute("departureSelectedSeatNumList")).get(0));
		
		
		///////////////////////남은 선택 좌석 갯수 계산/////////////////////
		if(reload == false) {
			seatCountDown--;
		}
		
		session.setAttribute("seatCountDown", seatCountDown);
		
		System.out.println(count + ", " + (int)session.getAttribute("seatCountDown"));
		
		///////////////////////남은 선택 좌석 갯수 계산 끝/////////////////////
		
		
		
		//////////////////////다음으로 갈 페이지 정보 설정//////////////////////////
		if(searchInfoVO.getHasReturn().equals("Y")) {
			if((int)session.getAttribute("seatCountDown") > count) {
				model.addAttribute("seatScreenInfo", ticketService.selectSeatScreenInfo((String)session.getAttribute("departureAirScheCode")));
			}
			else if((int)session.getAttribute("seatCountDown") > 0) {
				model.addAttribute("seatScreenInfo", ticketService.selectSeatScreenInfo((String)session.getAttribute("returnAirScheCode")));
			}
			else {
				url = "ticket/check_order_details";
			}
		}
		else {
			if((int)session.getAttribute("seatCountDown") > 0) {
				model.addAttribute("seatScreenInfo", ticketService.selectSeatScreenInfo((String)session.getAttribute("departureAirScheCode")));
			}
			else {
				url = "ticket/check_order_details";
			}
		}
		//////////////////////다음으로 갈 페이지 정보 설정 끝//////////////////////////
		
		
		return url;
	}
	
	@ResponseBody
	@PostMapping("/getSeatNumInSession")
	public List<String> getSeatNumInSession(HttpSession session) {
		
		SearchInfoVO searchInfoVO = (SearchInfoVO)session.getAttribute("searchInfo");
		
		
		int count = searchInfoVO.getCount();
		
		int seatCountDown = (int)session.getAttribute("seatCountDown");
		
		List<String> list = new ArrayList<String>();
		
		if(searchInfoVO.getHasReturn().equals("Y")) {
			if(seatCountDown > count) {
				list = ((List<String>)session.getAttribute("departureSelectedSeatNumList"));
			}
			else if(seatCountDown > 0){
				list = ((List<String>)session.getAttribute("returnSelectedSeatNumList"));
			}
		}
		else {
			list = ((List<String>)session.getAttribute("departureSelectedSeatNumList"));
		}
		
		System.out.println();
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println("selected Seat Num is = " + list.get(i));
		}
		
		return list;
		
	}
	
	
	@GetMapping("/confirmOrder")
	public String confirmOrder(AirMemberVO airMemberVO, HttpSession session, PassengerScheduleVO PassengerScheduleDto, Model model) {
		
		AirMemberVO member = (AirMemberVO)session.getAttribute("loginInfo"); 
		
		SearchInfoVO searchInfoVO = (SearchInfoVO)session.getAttribute("searchInfo");
		
		searchInfoVO.setDepartureAirScheCode((String)session.getAttribute("departureAirScheCode"));
		
		/////////////////// 좌석 정보 티켓 객체로 전달 ///////////////////
		List<PassengerScheduleVO> passengerScheduleList = ((List<PassengerScheduleVO>)session.getAttribute("passengerScheduleList"));
		List<String> list = new ArrayList<String>();
		
		list = ((List<String>)session.getAttribute("departureSelectedSeatNumList"));
		
		String departureAirScheCode = (String)session.getAttribute("departureAirScheCode");
		
		for(int i = 0; i < list.size(); i++) {
			passengerScheduleList.get(i).setSeatCode(list.get(i));
			passengerScheduleList.get(i).setOrderCode("T_" + getCurrentDateToString());
			passengerScheduleList.get(i).setOrderDate(getCurrentDateToString());
			passengerScheduleList.get(i).setTicketPrice(ticketService.selectBasePrice(departureAirScheCode));
			passengerScheduleList.get(i).setPassScheCode("D" + departureAirScheCode.substring(1, 4) + getCurrentDateToString().substring(11, 13) + list.get(i) + departureAirScheCode.substring(9, 11));
			if(member != null) {
				passengerScheduleList.get(i).setMemId(member.getMemId());
			}
		}
		
		
		if(searchInfoVO.getHasReturn().equals("Y")) {
			searchInfoVO.setReturnAirScheCode((String)session.getAttribute("returnAirScheCode"));
			String returnAirScheCode = (String)session.getAttribute("returnAirScheCode");
			int count = searchInfoVO.getCount();
			list = ((List<String>)session.getAttribute("returnSelectedSeatNumList"));
			for(int i = 0; i < list.size(); i++) {
				passengerScheduleList.get(i + count).setSeatCode(list.get(i));
				passengerScheduleList.get(i + count).setOrderCode("T_" + getCurrentDateToString());
				passengerScheduleList.get(i + count).setOrderDate(getCurrentDateToString());
				passengerScheduleList.get(i + count).setTicketPrice(ticketService.selectBasePrice(returnAirScheCode));
				passengerScheduleList.get(i + count).setPassScheCode("R" + returnAirScheCode.substring(1, 4) + list.get(i) + getCurrentDateToString().substring(11, 13) + returnAirScheCode.substring(9, 11));
				if(member != null) {
					passengerScheduleList.get(i + count).setMemId(member.getMemId());
				}
			}
			
		}
		/////////////////// 좌석 정보 티켓 객체로 전달 끝 ///////////////////
		
		if(member != null) {
			airMemberVO.setMemId(member.getMemId());
		}
		
		////////////////// insert ticket information //////////////////
		
		PassengerScheduleDto.setPassengerScheduleList(passengerScheduleList);
		
		ticketService.bookTickets(PassengerScheduleDto, searchInfoVO, airMemberVO);
		
		//model.addAttribute("ticketInfoList", ticketService.selectOrderDetails(passengerScheduleList.get(0).getOrderCode()));
		
		//////////// 데이터 체크 /////////////////
		for(int i = 0; i < passengerScheduleList.size(); i++) {
			System.out.println(passengerScheduleList.get(i));
		}
		////////////데이터 체크 끝/////////////////
		
		model.addAttribute("orderCode", passengerScheduleList.get(0).getOrderCode());
		
		
		session.removeAttribute("searchInfo");
		session.removeAttribute("departureAirScheCode");
		session.removeAttribute("returnAirScheCode");
		session.removeAttribute("departureSelectedSeatNumList");
		session.removeAttribute("returnSelectedSeatNumList");
		session.removeAttribute("passengerScheduleList");
		session.removeAttribute("seatCountDown");
		
		/* 이메일 전송
		 * String emailAddr;
		 * 
		 * emailAddr = passengerScheduleList.get(0).getPassEmail();
		 * 
		 * if (member != null) { emailAddr =
		 * ticketService.selectMemEmail(member.getMemId()); } try { //메일보내기 MimeMessage
		 * message = mailSender.createMimeMessage(); MimeMessageHelper messageHelper;
		 * messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		 * messageHelper.setFrom("jjangsung1405@gmail.com");
		 * messageHelper.setTo(emailAddr); messageHelper.setSubject("KH Airline 예약번호");
		 * messageHelper.setText(passengerScheduleList.get(0).getOrderCode());
		 * mailSender.send(message); } catch (MessagingException e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 */
		return "ticket/confirm_order";
	}
	
	@GetMapping("/searchMyTicketForm")
	public String searchMyTicketForm() {
		
		
		return "ticket/search_ticket_form";
	}
	
	@PostMapping("/searchMyTicket")
	public String searchMyTicket(String orderCode, Model model) {
		
		model.addAttribute("ticketInfoList", ticketService.selectOrderDetails(orderCode));
		
		return "ticket/search_ticket_list";
	}
	
	@ResponseBody
	@PostMapping("/login")
	public Boolean login(AirMemberVO airMemberVO, HttpSession session) {
		
		AirMemberVO member = ticketService.login(airMemberVO);
		
		if(member != null) {
			session.setAttribute("loginInfo", member);
			return true;
		}
		else {
			return false;
		}
		
	}
	
	
	@ResponseBody
	@PostMapping("/getPoints")
	public int getPoints(HttpSession session) {
		
		String memId = ((AirMemberVO)session.getAttribute("loginInfo")).getMemId();
		
		
		return ticketService.getPoints(memId);
		
	}
	
	
	public String getCurrentDateToString() {
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMddHHmmss");
		Date time = new Date();
		
		String time1 = format1.format(time);
		
		return time1;
	}
	
	
	//to get current date - yunki - 2022.04.19
	public String getNowDateTimeToString() {
		//싱글톤 패턴
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;//1~12   0~11
		int date = cal.get(Calendar.DATE);
		int hour = cal.get(Calendar.HOUR);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		
		String nowDateTime = "" + year + month + date + hour + minute + second;
		
		return nowDateTime;
	}
	
	//to get a week later from current date - yunki - 2022.04.19
	public String getAWeekLater() {
		
		Date dDate = new Date();
		dDate = new Date(dDate.getTime()+(1000*60*60*24*7));
		SimpleDateFormat dSdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		String aWeekLater = dSdf.format(dDate);

		
		return aWeekLater;
	}
	
	//to get two weeks later from current date - yunki - 2022.04.19
	public String getTwoWeeksLater() {
		
		Date dDate = new Date();
		dDate = new Date(dDate.getTime()+(1000*60*60*24*14));
		SimpleDateFormat dSdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		String twoWeeksLater = dSdf.format(dDate);

		
		return twoWeeksLater;
	}
	
	
}
