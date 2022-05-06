package com.kh.airline.ticket.vo;

public class SeatInfoVO {
	private String seatCode;
	private String airScheCode;
	private String colCode;
	private int rowNum;
	private String seatClass;
	private String isBooked;
	
	
	
	public String getSeatCode() {
		return seatCode;
	}
	public void setSeatCode(String seatCode) {
		this.seatCode = seatCode;
	}
	public String getAirScheCode() {
		return airScheCode;
	}
	public void setAirScheCode(String airScheCode) {
		this.airScheCode = airScheCode;
	}
	public String getColCode() {
		return colCode;
	}
	public void setColCode(String colCode) {
		this.colCode = colCode;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public String getSeatClass() {
		return seatClass;
	}
	public void setSeatClass(String seatClass) {
		this.seatClass = seatClass;
	}
	public String getIsBooked() {
		return isBooked;
	}
	public void setIsBooked(String isBooked) {
		this.isBooked = isBooked;
	}
	
	
	
}
