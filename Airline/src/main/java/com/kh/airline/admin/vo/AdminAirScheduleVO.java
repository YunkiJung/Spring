package com.kh.airline.admin.vo;

public class AdminAirScheduleVO {
	private String airScheCode;
	private String planeCode;
	private String pathCode;
	private String teamCode;
	private String departureDate;
	private int gateNum;
	private int basePrice;
	private int spareSeat;
	private String modelCode;
	
	public String getAirScheCode() {
		return airScheCode;
	}
	public void setAirScheCode(String airScheCode) {
		this.airScheCode = airScheCode;
	}
	public String getPlaneCode() {
		return planeCode;
	}
	public void setPlaneCode(String planeCode) {
		this.planeCode = planeCode;
	}
	public String getPathCode() {
		return pathCode;
	}
	public void setPathCode(String pathCode) {
		this.pathCode = pathCode;
	}
	public String getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}
	public String getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
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
	
	public String getModelCode() {
		return modelCode;
	}
	public void setModelCode(String modelCode) {
		this.modelCode = modelCode;
	}
	@Override
	public String toString() {
		return "AdminAirScheduleVO [airScheCode=" + airScheCode + ", planeCode=" + planeCode + ", pathCode=" + pathCode
				+ ", teamCode=" + teamCode + ", departureDate=" + departureDate + ", gateNum=" + gateNum
				+ ", basePrice=" + basePrice + ", spareSeat=" + spareSeat + ", modelCode=" + modelCode + "]";
	}
	
	

}
