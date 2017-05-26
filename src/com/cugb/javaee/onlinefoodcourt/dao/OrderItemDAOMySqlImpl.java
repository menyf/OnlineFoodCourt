package com.cugb.javaee.onlinefoodcourt.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.onlinefoodcourt.bean.OrderItem;

public class OrderItemDAOMySqlImpl extends baseDAO implements IOrderItemDAO {

	@Override
	public int addOrderItem(OrderItem orderItem) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into OrderItem values(?, ?, ?, ?)";
		Object[] params = {orderItem.getDishID(),orderItem.getOrderID(),orderItem.getCount(),orderItem.getFinalPrice()};
		return modifyObj(sql, params);
	}

	@Override
	public ArrayList findOrderItems(String orderId) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select dishid DishID, orderid OrderID, count Count, finalPrice FinalPrice from OrderItem where orderid = ?";
		Object[] params = {orderId};
		return findObjs(sql, OrderItem.class);
	}

}
