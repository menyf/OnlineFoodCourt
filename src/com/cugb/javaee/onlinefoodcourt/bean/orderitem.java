package com.cugb.javaee.onlinefoodcourt.bean;

public class orderitem {
	private String dishid;
	private String orderid;
	private int count;
	private float finalprice; //成交单价
	
	
	public String getDishid() {
		return dishid;
	}
	public void setDishid(String dishid) {
		this.dishid = dishid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public float getFinalprice() {
		return finalprice;
	}
	public void setFinalprice(float finalprice) {
		this.finalprice = finalprice;
	}
	
	
}
