package com.cugb.javaee.onlinefoodcourt.bean;

public class OrderItem {
	private String dishID;
	private String orderID;
	private int count;
	private float finalPrice; //成交单价
	public String getDishID() {
		return dishID;
	}
	public void setDishID(String dishID) {
		this.dishID = dishID;
	}
	public String getOrderID() {
		return orderID;
	}
	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public float getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(float finalPrice) {
		this.finalPrice = finalPrice;
	}
	
	
	
	
}
