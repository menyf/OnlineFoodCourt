package com.cugb.javaee.onlinefoodcourt.bean;

import java.awt.event.ItemEvent;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Order {
	private String orderID;
	private String username;
	//private Date time; //成交时间
	private Timestamp time;		
	private int count;
	private float totalPrice;
	private String payStatus; //支付状态
	private String address;
	private String tel;
	private ArrayList<OrderItem> items;
	
	public String getOrderID() {
		return orderID;
	}
	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}
	
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void updateCount() {
		this.count = 0;
		ArrayList<OrderItem> items = this.getItems();
		for (int i = 0; i < items.size(); i++) {
			OrderItem item = items.get(i);
			this.count += item.getCount();
		}
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void updateTotalPrice() {
		this.totalPrice = 0.0F;
		ArrayList<OrderItem> items = this.getItems();
		for (int i = 0; i < items.size(); i++) {
			OrderItem item = items.get(i);
			this.totalPrice += item.getCount() * item.getFinalPrice();
		}
	}
	public void setTotalPrice(float totalprice) {
		this.totalPrice = totalprice;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	public ArrayList<OrderItem> getItems() {
		return items;
	}
	public void setItems(ArrayList<OrderItem> items) {
		this.items = items;
	}
}
