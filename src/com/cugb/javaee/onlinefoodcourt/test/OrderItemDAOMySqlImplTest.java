package com.cugb.javaee.onlinefoodcourt.test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import com.cugb.javaee.onlinefoodcourt.bean.OrderItem;
import com.cugb.javaee.onlinefoodcourt.dao.IOrderItemDAO;
import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;

public class OrderItemDAOMySqlImplTest {

	IOrderItemDAO orderitemdao = null;
	@Before
	public void setUp() throws Exception {
		orderitemdao = (IOrderItemDAO) DAOFactory.newInstance("IOrderItemDAO");
	}

	@Test
	public void test() throws SQLException {
		String oid = "1496294184681manyfun711";
		ArrayList<OrderItem> oit = orderitemdao.findOrderItems(oid);
		
	}

}
