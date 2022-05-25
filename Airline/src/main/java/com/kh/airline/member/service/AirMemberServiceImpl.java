package com.kh.airline.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.airline.member.vo.AirMemberVO;
import com.kh.airline.member.vo.CountryVO;
import com.kh.airline.member.vo.MemImgVO;
import com.kh.airline.member.vo.MemberSideMenuVO;
import com.kh.airline.member.vo.MyTicketVO;
import com.kh.airline.ticket.vo.PassengerScheduleVO;

@Service("airMemberService")
public class AirMemberServiceImpl implements AirMemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	//회원등록
	@Override
	public void insertMember(AirMemberVO airMemberVO) {
		sqlSession.insert("memberMapper.insertMember", airMemberVO);
	}
	//회원 상세조회
	@Override
	public AirMemberVO selectMemInfo(AirMemberVO airmemberVO) {
		return sqlSession.selectOne("memberMapper.selectMemInfo", airmemberVO);
	}
	//로그인
	@Override
	public AirMemberVO login(AirMemberVO airmemberVO) {
		return sqlSession.selectOne("memberMapper.login", airmemberVO);
	}
	//비밀번호 초기화
	@Override
	public void updateMemPw(AirMemberVO airmemberVO) {
		sqlSession.update("memberMapper.updateMemPw", airmemberVO);
	}

	//나라 조회
	@Override
	public List<CountryVO> listCountry() {
		return sqlSession.selectList("memberMapper.listCountry");
	}
	//아이디 중복확인
	@Override
	public AirMemberVO idConfirm(AirMemberVO airmemberVO) {
		return sqlSession.selectOne("memberMapper.idConfirm", airmemberVO);
	}
	//멤버 사이드 메뉴 조회
	@Override
	public List<MemberSideMenuVO> selectMemSide() {
		return sqlSession.selectList("memberMapper.selectMemSide");
	}
	//아이디 조회
	@Override
	public String selectMemId(AirMemberVO airmemberVO) {
		return sqlSession.selectOne("memberMapper.selectMemId", airmemberVO);
	}
	//내정보보기 수정한 데이터 저장
	@Override
	public void updateMemInfo(AirMemberVO airmemberVO) {
		 sqlSession.update("memberMapper.updateMemInfo", airmemberVO);
	}
	//회원 이미지 번호 조회
	@Override
	public int selectNextMemImgCode() {
		return sqlSession.selectOne("memberMapper.selectNextMemImgCode");
	}
	//회원 이미지 등록
	@Override
	public void insertMemImg(MemImgVO memImgVO) {
		sqlSession.insert("memberMapper.insertMemImg", memImgVO);
	}
	//회원 이미지 조회
	@Override
	public String selectMemImg(String memId) {
		return sqlSession.selectOne("memberMapper.selectMemImg", memId);
	}
	//회원 이미지 삭제
	@Override
	public void deleteMemImg(String memId) {
		sqlSession.delete("memberMapper.deleteMemImg", memId);
	}
	//회원 예매 조회
	@Override
	public List<PassengerScheduleVO> selectMyTicket(MyTicketVO myTicketVO) {
		return sqlSession.selectList("memberMapper.selectMyTicket", myTicketVO);
	}
	//과거 회원 예매 조회
	@Override
	public List<PassengerScheduleVO> selectPastMyTicket(MyTicketVO myTicketVO) {
		return sqlSession.selectList("memberMapper.selectPastMyTicket", myTicketVO);
	}
	//비밀번호 조회
	@Override
	public String selectMemPw(String memId) {
		return sqlSession.selectOne("memberMapper.selectMemPw", memId);
	}
	//이메일조회
	@Override
	public String selectMemEmail(String memId) {
		return sqlSession.selectOne("memberMapper.selectMemEmail", memId);
	}

}
