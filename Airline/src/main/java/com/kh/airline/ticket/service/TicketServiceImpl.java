package com.kh.airline.ticket.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.airline.member.vo.AirMemberVO;
import com.kh.airline.ticket.vo.AirScheduleVVO;
import com.kh.airline.ticket.vo.MyGpsInfoVO;
import com.kh.airline.ticket.vo.PassengerScheduleVO;
import com.kh.airline.ticket.vo.PortInfoVO;
import com.kh.airline.ticket.vo.SearchInfoVO;
import com.kh.airline.ticket.vo.SeatInfoVO;
import com.kh.airline.ticket.vo.SeatScreenInfoVO;

@Service("ticketService")
public class TicketServiceImpl implements TicketService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<PortInfoVO> selectPortsInfo(String searchCity) {
		return sqlSession.selectList("ticketMapper.selectPortsInfo", searchCity);
	}

	@Override
	public List<AirScheduleVVO> selectAirScheduleList(SearchInfoVO searchInfoVO) {
		return sqlSession.selectList("ticketMapper.selectAirScheduleList", searchInfoVO);
	}
	
	@Override
	public List<PortInfoVO> selectCountryList() {
		return sqlSession.selectList("ticketMapper.selectCountryList");
	}
	

	@Override
	public List<SeatInfoVO> selectSeatInfoList(String airScheCode) {
		return sqlSession.selectList("ticketMapper.selectSeatInfoList", airScheCode);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public SeatScreenInfoVO selectSeatScreenInfo(String airScheCode) {
		
		int maxRowNum = sqlSession.selectOne("ticketMapper.selectSeatMaxRowNum", airScheCode);
		
		List<String> colCodeList = sqlSession.selectList("ticketMapper.selectSeatColCodeList", airScheCode);
		
		SeatScreenInfoVO seatScreenInfoVO = new SeatScreenInfoVO();
		seatScreenInfoVO.setMaxRowNum(maxRowNum);
		seatScreenInfoVO.setColCodeList(colCodeList);
		
		return seatScreenInfoVO;
	}

	@Override
	public List<String> selectBookedSeatList(String airScheCode) {
		
		return sqlSession.selectList("ticketMapper.selectBookedSeatList", airScheCode);
	}

	@Override
	public int selectBasePrice(String airScheCode) {
		return sqlSession.selectOne("ticketMapper.selectBasePrice", airScheCode);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void bookTickets(PassengerScheduleVO passengerScheduleDto, SearchInfoVO searchInfoVO, AirMemberVO airMemberVO) {
		sqlSession.insert("ticketMapper.bookTickets", passengerScheduleDto);
		sqlSession.update("ticketMapper.bookSeats", passengerScheduleDto);
		sqlSession.update("ticketMapper.updateSpareSeats", searchInfoVO);
		if(airMemberVO.getMemId() != null) {
			sqlSession.update("ticketMapper.updatePoints", airMemberVO);
			List<PassengerScheduleVO> list = passengerScheduleDto.getPassengerScheduleList();
			int total = 0;
			for(int i = 0; i < list.size(); i++) {
				total += list.get(i).getTicketPrice();
			}
			
			total = (int)(total * 0.05);
			airMemberVO.setPoints(total);
			sqlSession.update("ticketMapper.plusPoints", airMemberVO);
		}
		
		
		
		
	}

	@Override
	public List<PassengerScheduleVO> selectOrderDetails(String orderCode) {
		return sqlSession.selectList("ticketMapper.selectOrderDetails", orderCode);
	}

	@Override
	public AirMemberVO login(AirMemberVO airMemberVO) {
		return sqlSession.selectOne("ticketMapper.login", airMemberVO);
	}

	@Override
	public int getPoints(String memId) {
		return sqlSession.selectOne("ticketMapper.getPoints", memId);
	}

	@Override
	public String selectMemEmail(String memId) {
		return sqlSession.selectOne("ticketMapper.selectMemEmail", memId);
	}

	@Override
	public List<AirScheduleVVO> selectAirScheduleListFromMyGps(MyGpsInfoVO myGpsInfoVO) {
		return sqlSession.selectList("ticketMapper.selectAirScheduleListFromMyGps", myGpsInfoVO);
	}

	/*
	 * @Override public AirScheduleVVO selectTripInfo(AirScheduleVVO airScheduleVVO)
	 * { return sqlSession.selectList("ticketMapper.selectTripInfo",
	 * airScheduleVVO); }
	 */

	

	

}
