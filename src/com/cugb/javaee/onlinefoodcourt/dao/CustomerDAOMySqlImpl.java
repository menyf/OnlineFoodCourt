package com.cugb.javaee.onlinefoodcourt.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.onlinefoodcourt.bean.Customer;

public class CustomerDAOMySqlImpl extends baseDAO implements ICustomerDAO {

	@Override
	public int addCustomer(Customer customer) throws SQLException {
		String sql = "insert into Customer values(?, ?, ?)";
		Object[] params = {customer.getUserID(), customer.getUsername(), customer.getPassword()};
		return modifyObj(sql, params);
	}

	@Override
	public int removeCustomer(String string) throws SQLException {
		String sql = "delete from Customer where id = ?";
		Object[] params = {string};
		return modifyObj(sql, params);
	}

	@Override
	public int modifyCustomer(Customer customer) throws SQLException {
		String sql = "update Customer set  password = ? where username = ?";
		Object[] params = {customer.getPassword(), customer.getUsername()} ;
		return modifyObj(sql, params);
	}

	@Override
	public ArrayList findCustomers() throws SQLException {
		String sql = "select userid UserID, username Username, password Password from Customer";
		return findObjs(sql, Customer.class);
	}

	@Override
	public Customer findCustomer(String string) throws SQLException {
		String sql = "select userid UserID, username Username, password Password from Customer where username = ?";
		Object[] params = {string};
		return (Customer) findObj(sql, params, Customer.class);
	}

}
