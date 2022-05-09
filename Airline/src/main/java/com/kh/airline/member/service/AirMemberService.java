package com.kh.airline.member.service;

import java.util.List;

import com.kh.airline.member.vo.AirMemberVO;
import com.kh.airline.member.vo.CountryVO;
import com.kh.airline.member.vo.MemImgVO;
import com.kh.airline.member.vo.MemberSideMenuVO;
import com.kh.airline.member.vo.MyTicketVO;
import com.kh.airline.ticket.vo.PassengerScheduleVO;

public interface AirMemberService {
	//회원등록
	void insertMember(AirMemberVO airmemberVO);
	//회원 상세조회
	AirMemberVO selectMemInfo(AirMemberVO airmemberVO);
	//로그인
	AirMemberVO login(AirMemberVO airmemberVO);
	//비밀번호 초기화
	void updateMemPw(AirMemberVO airmemberVO);
	//나라 조회
	List<CountryVO> listCountry();
	//아이디 중복확인
	AirMemberVO idConfirm(AirMemberVO airmemberVO);
	//멤버 사이드 메뉴 조회
	List<MemberSideMenuVO> selectMemSide();
	//아이디 조회
	String selectMemId(AirMemberVO airmemberVO);
	//내정보보기 수정한 데이터 저장
	void updateMemInfo(AirMemberVO airmemberVO);
	//다음에 들어갈 회원 이미지 조회
	int selectNextMemImgCode();
	//회원 이미지 등록
	void insertMemImg(MemImgVO memImgVO);
	//회원 이미지 조회
	String selectMemImg(String memId);
	//회원 이미지 삭제
	void deleteMemImg(String memId);
	//회원 예매 조회
	List<PassengerScheduleVO> selectMyTicket(MyTicketVO myTicketVO);
	//과거 회원 예매 조회
	List<PassengerScheduleVO> selectPastMyTicket(MyTicketVO myTicketVO);
	//비밀번호 조회
	String selectMemPw(String memId);
}
