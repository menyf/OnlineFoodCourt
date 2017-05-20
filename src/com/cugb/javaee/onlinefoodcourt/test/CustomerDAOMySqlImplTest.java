package com.cugb.javaee.onlinefoodcourt.test;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.Before;
import org.junit.Test;

import com.cugb.javaee.onlinefoodcourt.bean.Customer;
import com.cugb.javaee.onlinefoodcourt.dao.ICustomerDAO;
import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;

public class CustomerDAOMySqlImplTest {

	ICustomerDAO cusDAO = null;
	
	@Before
	public void setUp() throws Exception {
		cusDAO = (ICustomerDAO)DAOFactory.newInstance("com.cugb.javaee.onlinefoodcourt.dao.ICustomerDAO");
	}

	@Test
	public void testAddCustomer() throws SQLException {
		Customer cus = new Customer();
		cus.setUserID("1004");
		cus.setUsername("root4");
		cus.setPassword("admin");
		assertEquals(1, cusDAO.addCustomer(cus));
	}

//	@Test
//	public void testRemoveCustomer() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testModifyCustomer() {
//		fail("Not yet implemented");
//	}
//	@Test
//	public void testFindCustomers() {
//		fail("Not yet implemented");
//	}

//	@Test
//	public void testFindCustomer() throws SQLException {
//		Customer cus = cusDAO.findCustomer("root");
//		System.out.println(cus.getPassword());
//		assertEquals("admin", cus.getPassword());
//	}

}
