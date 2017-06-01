package com.cugb.javaee.onlinefoodcourt.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import org.hamcrest.StringDescription;

import com.cugb.javaee.onlinefoodcourt.bean.Order;
import com.cugb.javaee.onlinefoodcourt.bean.OrderItem;
import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;

public class OrderDAOMySqlImpl extends baseDAO implements IOrderDAO {

	@Override
	public int addOrder(Order order) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into Orders values (?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] params = {order.getOrderID(), order.getUsername(), order.getTime(), order.getCount(), order.getTotalPrice(), 
				order.getPayStatus(), order.getAddress(), order.getTel()};
		try {
			IOrderItemDAO orderItemDAO = (IOrderItemDAO) DAOFactory.newInstance("com.cugb.javaee.onlinefoodcourt.dao.IOrderItemDAO");
			ArrayList<OrderItem> items = order.getItems();
			for (int i = 0; i < items.size(); i++) {
				OrderItem item = items.get(i);
				orderItemDAO.addOrderItem(item);
			}
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return modifyObj(sql, params);
	}

	@Override
	public int modifyOrder(String orderId, String paystatus) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update Orders set paystatus = ? where orderid = ?";
		Object[] params = {paystatus, orderId};
		return modifyObj(sql, params);
	}

	@Override
	public ArrayList findOrders(String userId) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		// TODO Auto-generated method stub
		String sql = "select orderid OrderID,  username Username, time Time, count Count, totalprice TotalPrice, paystatus PayStatus,"
				+ "address Address, tel Tel from Orders where username = \"" + userId + "\" order by time DESC";
		
		ArrayList<Order> arr = findObjs(sql, Order.class);
		for(int i = 0; i < arr.size(); i++){
			Order ord = arr.get(i);
			IOrderItemDAO orderitemdao = (IOrderItemDAO) DAOFactory.newInstance("IOrderItemDAO");
			ArrayList<OrderItem> oit = orderitemdao.findOrderItems(ord.getOrderID());
			arr.get(i).setItems(oit);
		}
		return arr;
	}

}
