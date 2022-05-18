package com.kh.airline.admin.vo;

public class SalesVO {
	private String orderDate;
	private int totalIncome;
	
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getTotalIncome() {
		return totalIncome;
	}
	public void setTotalIncome(int totalIncome) {
		this.totalIncome = totalIncome;
	}
	
	@Override
	public String toString() {
		return "SalesVO [orderDate=" + orderDate + ", totalIncome=" + totalIncome + "]";
	}

	
	
}
