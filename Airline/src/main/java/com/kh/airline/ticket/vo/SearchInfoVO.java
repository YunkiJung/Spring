package com.kh.airline.ticket.vo;

public class SearchInfoVO {
	private String departurePortCode;
	private String arrivalPortCode;
	private String departureDate;
	private String returnDate;
	private int count;
	private String hasReturn;
	private String departureAirScheCode;
	private String returnAirScheCode;
	
	
	
	public String getDepartureAirScheCode() {
		return departureAirScheCode;
	}
	public void setDepartureAirScheCode(String departureAirScheCode) {
		this.departureAirScheCode = departureAirScheCode;
	}
	public String getReturnAirScheCode() {
		return returnAirScheCode;
	}
	public void setReturnAirScheCode(String returnAirScheCode) {
		this.returnAirScheCode = returnAirScheCode;
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
	public String getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getHasReturn() {
		return hasReturn;
	}
	public void setHasReturn(String hasReturn) {
		this.hasReturn = hasReturn;
	}
	
	@Override
	public String toString() {
		return "SearchInfoVO [departPortCode=" + departurePortCode + ", arrivalPortCode=" + arrivalPortCode
				+ ", departureDate=" + departureDate + ", returnDate=" + returnDate + ", count=" + count
				+ ", hasReturn=" + hasReturn + "]";
	}
	
	
	
}
