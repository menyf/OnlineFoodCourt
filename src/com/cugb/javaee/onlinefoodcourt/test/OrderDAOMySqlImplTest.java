package com.cugb.javaee.onlinefoodcourt.test;

import static org.junit.Assert.*;

import java.util.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import com.cugb.javaee.onlinefoodcourt.bean.Order;
import com.cugb.javaee.onlinefoodcourt.bean.OrderItem;
import com.cugb.javaee.onlinefoodcourt.dao.IOrderDAO;
import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;

public class OrderDAOMySqlImplTest{
	
	IOrderDAO orderdao = null;
	@Before
	public void setUp() throws Exception {
		orderdao = (IOrderDAO) DAOFactory.newInstance("com.cugb.javaee.onlinefoodcourt.dao.IOrderDAO");
	}

//	@Test
//	public void testAddOrder() throws SQLException {
//		Order order = new Order();
//		order.setAddress("beijing");
//		order.setOrderID("ddd");
//		order.setUsername("men");
//		java.util.Date today = new java.util.Date();
//		Timestamp timestamp = new Timestamp(today.getTime());
//				
//		order.setTime(timestamp);
//		order.setPayStatus("Paid");
//		order.setTel("123456");
//		
//		
//		ArrayList<OrderItem> arrayList = new ArrayList<OrderItem>();
//		OrderItem xx = new OrderItem();
//		xx.setCount(1);
//		xx.setDishID(123);
//		xx.setFinalPrice(5.00f);
//		xx.setOrderID("ddd");
//		
//		OrderItem yy = new OrderItem();
//		yy.setCount(3);
//		yy.setDishID(124);
//		yy.setFinalPrice(5.00f);
//		yy.setOrderID("ddd");
//		
//		arrayList.add(yy);
//		arrayList.add(xx);
//		
//		order.setItems(arrayList);
//		order.setCount();
//		order.setTotalPrice();
//		orderdao.addOrder(order);
//	}

	/*@Test
	public void testModifyOrder() {
		fail("Not yet implemented");
	}*/

	@Test
	public void testFindOrders() throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		//fail("Not yet implemented");
		ArrayList<Order> arrayList = null;
		arrayList = orderdao.findOrders("1001");
		for(Order order: arrayList){
		}
		
		
	}
}
