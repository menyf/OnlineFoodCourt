package com.cugb.javaee.onlinefoodcourt.biz;

import java.sql.SQLException;

import com.cugb.javaee.onlinefoodcourt.bean.Customer;
import com.cugb.javaee.onlinefoodcourt.dao.ICustomerDAO;
import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;

/**
 * 
 * @author fanleehao
 * 业务逻辑：判断用户是否存在、验证用户登录通过等
 * 2017年5月28日
 */
public class CustomerService {
	ICustomerDAO iCustomerDAO = null;
	public boolean isExistCustomer(String username) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		iCustomerDAO = (ICustomerDAO) DAOFactory.newInstance("com.cugb.javaee.onlinefoodcourt.dao.ICustomerDAO");
		Customer customer = iCustomerDAO.findCustomer(username);
		if(customer != null)
			return true;
		else return false;
	}
	public boolean validateCustomer(Customer customer) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		ICustomerDAO iCustomerDAO = (ICustomerDAO) DAOFactory.newInstance("com.cugb.javaee.onlinefoodcourt.dao.ICustomerDAO");
		Customer cus = iCustomerDAO.findCustomer(customer.getUsername());
		if(cus.getPassword().equals(customer.getPassword()))
			return true;
		else return false;
	}
}
