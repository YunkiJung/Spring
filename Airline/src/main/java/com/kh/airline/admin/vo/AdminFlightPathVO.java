package com.kh.airline.admin.vo;

public class AdminFlightPathVO {
	private String pathCode;
	private String departurePortCode;
	private String arrivalPortCode;
	private int distance;
	
	private String departurePortName;
	private String arrivalPortName;
	
	public String getPathCode() {
		return pathCode;
	}
	public void setPathCode(String pathCode) {
		this.pathCode = pathCode;
	}
	public String getDeparturePortCode() {
		return departurePortCode;
	}
	public void setDeparturePortCode(String departurePortCode) {
		this.departurePortCode = departurePortCode;
	}
	public String getArrivalPortCode() {
		return arrivalPortCode;
	}
	public void setArrivalPortCode(String arrivalPortCode) {
		this.arrivalPortCode = arrivalPortCode;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public String getDeparturePortName() {
		return departurePortName;
	}
	public void setDeparturePortName(String departurePortName) {
		this.departurePortName = departurePortName;
	}
	public String getArrivalPortName() {
		return arrivalPortName;
	}
	public void setArrivalPortName(String arrivalPortName) {
		this.arrivalPortName = arrivalPortName;
	}

}
