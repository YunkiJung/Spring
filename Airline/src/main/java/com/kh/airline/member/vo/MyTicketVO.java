package com.kh.airline.member.vo;

import java.util.List;

import com.kh.airline.ticket.vo.AirScheduleVVO;

public class MyTicketVO{
	private String passScheCode;
	private String memId;
	private String passName;
	private String gender;
	private String birthDate;
	private String countryCode;
	private String passportNum;
	private String passEmail;
	private String passPhone;
	private String passAddr;
	private String airScheCode;
	private String seatCode;
	private int ticketPrice;
	private String orderCode;
	private String orderDate;
	private List<MyTicketVO> passengerScheduleList;
	private AirScheduleVVO airScheduleVO;
	private String departureDate;
	
	
	
	public String getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}
	public AirScheduleVVO getAirScheduleVO() {
		return airScheduleVO;
	}
	public void setAirScheduleVO(AirScheduleVVO airScheduleVO) {
		this.airScheduleVO = airScheduleVO;
	}
	public List<MyTicketVO> getPassengerScheduleList() {
		return passengerScheduleList;
	}
	public void setPassengerScheduleList(List<MyTicketVO> passengerScheduleList) {
		this.passengerScheduleList = passengerScheduleList;
	}
	public String getPassScheCode() {
		return passScheCode;
	}
	public void setPassScheCode(String passScheCode) {
		this.passScheCode = passScheCode;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getPassName() {
		return passName;
	}
	public void setPassName(String passName) {
		this.passName = passName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getPassportNum() {
		return passportNum;
	}
	public void setPassportNum(String passportNum) {
		this.passportNum = passportNum;
	}
	public String getPassEmail() {
		return passEmail;
	}
	public void setPassEmail(String passEmail) {
		this.passEmail = passEmail;
	}
	public String getPassPhone() {
		return passPhone;
	}
	public void setPassPhone(String passPhone) {
		this.passPhone = passPhone;
	}
	public String getPassAddr() {
		return passAddr;
	}
	public void setPassAddr(String passAddr) {
		this.passAddr = passAddr;
	}
	public String getAirScheCode() {
		return airScheCode;
	}
	public void setAirScheCode(String airScheCode) {
		this.airScheCode = airScheCode;
	}
	public String getSeatCode() {
		return seatCode;
	}
	public void setSeatCode(String seatCode) {
		this.seatCode = seatCode;
	}
	public int getTicketPrice() {
		return ticketPrice;
	}
	public void setTicketPrice(int ticketPrice) {
		this.ticketPrice = ticketPrice;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	@Override
	public String toString() {
		return "PassengerScheduleVO [passScheCode=" + passScheCode + ", memId=" + memId + ", passName=" + passName
				+ ", gender=" + gender + ", birthDate=" + birthDate + ", countryCode=" + countryCode + ", passportNum="
				+ passportNum + ", passEmail=" + passEmail + ", passPhone=" + passPhone + ", passAddr=" + passAddr
				+ ", airScheCode=" + airScheCode + ", seatCode=" + seatCode + ", ticketPrice=" + ticketPrice
				+ ", orderCode=" + orderCode + ", orderDate=" + orderDate + "]";
	}
	
	
	
	
	
}






