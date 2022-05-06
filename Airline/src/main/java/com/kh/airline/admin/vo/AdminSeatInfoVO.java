package com.kh.airline.admin.vo;

import java.util.Arrays;

public class AdminSeatInfoVO extends AdminAirScheduleVO{
	private String seatCode;
    private String airScheCode;
    private String colCode;
    private int rowNum;
    private String seatClass;
    private String isBooked;
    private String[] colArray = {"A", "B", "C", "D", "E", "F"};
    
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
	public String[] getColArray() {
		return colArray;
	}
	public void setColArray(String[] colArray) {
		this.colArray = colArray;
	}
	@Override
	public String toString() {
		return "AdminSeatInfoVO [seatCode=" + seatCode + ", airScheCode=" + airScheCode + ", colCode=" + colCode
				+ ", rowNum=" + rowNum + ", seatClass=" + seatClass + ", isBooked=" + isBooked + ", colArray="
				+ Arrays.toString(colArray) + "]";
	}
    
	
    

}
