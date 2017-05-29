package com.cugb.javaee.onlinefoodcourt.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cugb.javaee.onlinefoodcourt.bean.Customer;
import com.cugb.javaee.onlinefoodcourt.dao.ICustomerDAO;
import com.cugb.javaee.onlinefoodcourt.test.BaseService;
import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;

@WebServlet("/modifyCusControl")
public class ModifyCusControl extends BaseService {

	public ModifyCusControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		//获取参数
		//String username = req.getParameter("modifyName");
		HttpSession session = req.getSession(true);
		Customer customer = new Customer();		
		customer = (Customer) session.getAttribute("loginuser");
		
		String password = req.getParameter("modifyPass");
		String nickname = req.getParameter("modifyEmail");
		
		customer.setPassword(password);
		customer.setNickname(nickname);		
				
		try {
			ICustomerDAO iCustomerDAO = (ICustomerDAO) DAOFactory.newInstance("com.cugb.javaee.onlinefoodcourt.dao.ICustomerDAO");
			iCustomerDAO.modifyCustomer(customer);
			resp.sendRedirect("show.jsp");
			
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
}
