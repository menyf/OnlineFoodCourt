package com.cugb.javaee.onlinefoodcourt.action;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cugb.javaee.onlinefoodcourt.bean.CartItem;
import com.cugb.javaee.onlinefoodcourt.bean.Customer;
import com.cugb.javaee.onlinefoodcourt.bean.Dish;
import com.cugb.javaee.onlinefoodcourt.bean.Order;
import com.cugb.javaee.onlinefoodcourt.bean.OrderItem;
import com.cugb.javaee.onlinefoodcourt.dao.IDishDAO;
import com.cugb.javaee.onlinefoodcourt.dao.IOrderDAO;
import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;

/**
 * Servlet implementation class OrderAddControl
 */
@WebServlet("/OrderAddControl")
public class OrderAddControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderAddControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		Order order = new Order();
		
		
		//Step1. 取出所有购物车的信息
		HttpSession session = request.getSession();
		Customer cus = (Customer) session.getAttribute("loginuser");
		java.util.Date today = new java.util.Date();
		Timestamp timestamp = new Timestamp(today.getTime());
		String orderID = String.valueOf((new java.util.Date()).getTime())+cus.getUsername();
		
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		
		Map cart = (Map) session.getAttribute("shopcart");
		Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
		IDishDAO ff = null;
		float totalPrice = 0.0f;
		int count = 0;
		ArrayList<OrderItem> arr = new ArrayList<OrderItem>();
		while(it.hasNext()){
			try {
				ff = (IDishDAO)DAOFactory.newInstance("IDishDAO");
				Map.Entry entry = (Map.Entry) it.next();
				
				CartItem nc = new CartItem();
				nc = (CartItem) entry.getKey();
				Customer cuss = (Customer) session.getAttribute("loginuser");
				if (!nc.username.equals(cuss.getUsername())) {
					continue;
				}
				int dishid = nc.id;
				int disnumber = (Integer) entry.getValue();
				
				Dish cur = ff.findDish(dishid);
				count += disnumber;
				OrderItem oit = new OrderItem();
				oit.setCount(disnumber);
				oit.setDishID(dishid);
				oit.setFinalPrice(cur.getDiscount());
				oit.setOrderID(orderID);
				arr.add(oit);
				cart.remove(nc);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//Step2. 
		System.out.println("送货地址："+address);
		order.setOrderID(orderID);
		order.setUsername(cus.getUsername());
		order.setTime(timestamp);
		order.setPayStatus("未支付");
		order.setItems(arr);
		order.setTel(tel);
		order.setAddress(address);
		
		order.updateCount();
		order.updateTotalPrice();
		
		IOrderDAO orderdao;
		try {
			orderdao = (IOrderDAO) DAOFactory.newInstance("IOrderDAO");
			orderdao.addOrder(order);
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
//		request.getRequestDispatcher("mine.jsp").forward(request, response);
		response.sendRedirect("mine.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
