package com.cugb.javaee.onlinefoodcourt.bean;

public class dish {
	private String dishid;
	private String name;
	private float price;
	private String description;
	private String imgurl;
	private String discount;
	
	public String getDishid() {
		return dishid;
	}
	public void setDishid(String dishid) {
		this.dishid = dishid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	
	
}
