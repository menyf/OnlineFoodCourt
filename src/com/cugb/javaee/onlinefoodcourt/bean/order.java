package com.cugb.javaee.onlinefoodcourt.bean;

import java.sql.Date;

public class order {
	private String orderid;
	private String userid;
	private Date time; //成交时间
	private int count;
	private float totalptice;
	private String paystatus; //支付状态
	
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public float getTotalptice() {
		return totalptice;
	}
	public void setTotalptice(float totalptice) {
		this.totalptice = totalptice;
	}
	public String getPaystatus() {
		return paystatus;
	}
	public void setPaystatus(String paystatus) {
		this.paystatus = paystatus;
	}
	
	
}
