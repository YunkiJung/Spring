package com.kh.airline.ticket.service;

import java.util.List;

import com.kh.airline.member.vo.AirMemberVO;
import com.kh.airline.ticket.vo.AirScheduleVVO;
import com.kh.airline.ticket.vo.MyGpsInfoVO;
import com.kh.airline.ticket.vo.PassengerScheduleVO;
import com.kh.airline.ticket.vo.PortInfoVO;
import com.kh.airline.ticket.vo.SearchInfoVO;
import com.kh.airline.ticket.vo.SeatInfoVO;
import com.kh.airline.ticket.vo.SeatScreenInfoVO;

public interface TicketService {
	
	//get airports info with city name and country name
	List<PortInfoVO> selectPortsInfo(String searchCity);
	
	//search air schedule list
	List<AirScheduleVVO> selectAirScheduleList(SearchInfoVO searchInfoVO);
	
	//국가 리스트 가져오는 메소드
	List<PortInfoVO> selectCountryList();	
	
	//좌석에 대한 모든정보 가져오는 메소드
	List<SeatInfoVO> selectSeatInfoList(String airScheCode);
	
	//좌석 구조 그리기 위해 필요한 정보 가져오는 메소드
	SeatScreenInfoVO selectSeatScreenInfo(String airScheCode);
	
	//예매된 좌석 목록 가져오는 메소드
	List<String> selectBookedSeatList(String airScheCode);
	
	//선택된 항공편 기본 티켓가격 가져오는 메소드
	int selectBasePrice(String airScheCode);
	
	//예매 하는 메소드
	void bookTickets(PassengerScheduleVO passengerScheduleDto, SearchInfoVO searchInfoVO, AirMemberVO airMemberVO);
	
	//구매한 티켓 정보 가져오는 메소드
	List<PassengerScheduleVO> selectOrderDetails(String orderCode);
	
	//로그인
	AirMemberVO login(AirMemberVO airMemberVO);
	
	//포인트 정보 가져오는 메소드
	int getPoints(String memId);
	
	//이메일 조회
	String selectMemEmail(String memId);
	
	List<AirScheduleVVO> selectAirScheduleListFromMyGps(MyGpsInfoVO myGpsInfoVO);
	
	
}
