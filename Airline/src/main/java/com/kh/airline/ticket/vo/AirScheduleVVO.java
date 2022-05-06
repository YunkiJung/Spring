package com.kh.airline.ticket.vo;

public class AirScheduleVVO {
	private String airScheCode;
	private String departureDate;
	private String boardingDate;
	private String departurePortCode;
	private String arrivalDate;
	private String arrivalPortCode;
	private String dportName;
	private String dcityName;
	private String dcountryName;
	private String aportName;
	private String acityName;
	private String acountryName;
	private int gateNum;
	private int basePrice;
	private int spareSeat;
	private int distance;
	private int highestSpeed;
	private String hrs;
	
	
	
	public String getAirScheCode() {
		return airScheCode;
	}
	public void setAirScheCode(String airScheCode) {
		this.airScheCode = airScheCode;
	}
	public String getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}
	
	public String getBoardingDate() {
		return boardingDate;
	}
	public void setBoardingDate(String boardingDate) {
		this.boardingDate = boardingDate;
	}
	public String getDeparturePortCode() {
		return departurePortCode;
	}
	public void setDeparturePortCode(String departurePortCode) {
		this.departurePortCode = departurePortCode;
	}
	public String getArrivalDate() {
		return arrivalDate;
	}
	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
	public String getArrivalPortCode() {
		return arrivalPortCode;
	}
	public void setArrivalPortCode(String arrivalPortCode) {
		this.arrivalPortCode = arrivalPortCode;
	}
	public String getDportName() {
		return dportName;
	}
	public void setDportName(String dportName) {
		this.dportName = dportName;
	}
	public String getDcityName() {
		return dcityName;
	}
	public void setDcityName(String dcityName) {
		this.dcityName = dcityName;
	}
	public String getDcountryName() {
		return dcountryName;
	}
	public void setDcountryName(String dcountryName) {
		this.dcountryName = dcountryName;
	}
	public String getAportName() {
		return aportName;
	}
	public void setAportName(String aportName) {
		this.aportName = aportName;
	}
	public String getAcityName() {
		return acityName;
	}
	public void setAcityName(String acityName) {
		this.acityName = acityName;
	}
	public String getAcountryName() {
		return acountryName;
	}
	public void setAcountryName(String acountryName) {
		this.acountryName = acountryName;
	}
	public int getGateNum() {
		return gateNum;
	}
	public void setGateNum(int gateNum) {
		this.gateNum = gateNum;
	}
	public int getBasePrice() {
		return basePrice;
	}
	public void setBasePrice(int basePrice) {
		this.basePrice = basePrice;
	}
	public int getSpareSeat() {
		return spareSeat;
	}
	public void setSpareSeat(int spareSeat) {
		this.spareSeat = spareSeat;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public int getHighestSpeed() {
		return highestSpeed;
	}
	public void setHighestSpeed(int highestSpeed) {
		this.highestSpeed = highestSpeed;
	}
	public String getHrs() {
		return hrs;
	}
	public void setHrs(String hrs) {
		this.hrs = hrs;
	}
	
	@Override
	public String toString() {
		return "AirScheduleVVO [airScheCode=" + airScheCode + ", departureDate=" + departureDate + ", boardingDate="
				+ boardingDate + ", departurePortCode=" + departurePortCode + ", arrivalDate=" + arrivalDate
				+ ", arrivalPortCode=" + arrivalPortCode + ", dportName=" + dportName + ", dcityName=" + dcityName
				+ ", dcountryName=" + dcountryName + ", aportName=" + aportName + ", acityName=" + acityName
				+ ", acountryName=" + acountryName + ", gateNum=" + gateNum + ", basePrice=" + basePrice
				+ ", spareSeat=" + spareSeat + ", distance=" + distance + ", highestSpeed=" + highestSpeed + ", hrs="
				+ hrs + "]";
	}
	
	
	
	
	
	
	
}
