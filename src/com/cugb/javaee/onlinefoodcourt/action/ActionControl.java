package com.cugb.javaee.onlinefoodcourt.action;

import com.cugb.javaee.onlinefoodcourt.test.*;
import com.cugb.javaee.onlinefoodcourt.bean.*;
import com.cugb.javaee.onlinefoodcourt.biz.*;
import com.cugb.javaee.onlinefoodcourt.dao.IDishDAO;
import com.cugb.javaee.onlinefoodcourt.utils.*;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.DefaultCaret;
import javax.websocket.Session;

import org.apache.catalina.filters.AddDefaultCharsetFilter;
import org.eclipse.jdt.internal.compiler.env.IGenericField;
import org.omg.CORBA.INTERNAL;

import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;
import com.sun.xml.internal.ws.resources.HttpserverMessages;


/**
 * Servlet implementation class ActionControl
 */
public class ActionControl extends BaseService {
	private static final long serialVersionUID = 1L;
	private static Properties prop = null;
	private Map cart = new HashMap();
	private int pageSize = 10;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ActionControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// logger.debug(getServletConfig());;
		String actiontype = request.getParameter("actiontype");
		switch (actiontype) {
		case "detail":
			System.out.println("oooooo");
			try {
				showdetial(request, response);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		// 显示某一个菜品的详细信息
		case "cart":
			System.out.println("add");
			try {
				addCart(request, response);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "del":
			delCart(request, response);
		    break;
		case "addone":
			try {
				addOne(request, response);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "goCart":
			goCart(request,response);
			break;
			// 添加到购物车
		case "logOut":
			logOut(request,response);
			break;
		}

	}

	private void showdetial(HttpServletRequest request, HttpServletResponse response) throws InstantiationException,
		    IllegalAccessException, ClassNotFoundException, SQLException, ServletException, IOException {
		//System.out.println("oooooo");
		String Did = request.getParameter("dishid");
		Dish current = new Dish();
		IDishDAO dishdao = (IDishDAO) DAOFactory.newInstance("IDishDAO");
		int id = Integer.parseInt(Did);
		current = dishdao.findDish(id);
		request.setAttribute("current", current);
		request.getRequestDispatcher("showdetails.jsp").forward(request, response);
	}

	private void addCart(HttpServletRequest request, HttpServletResponse response) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException, ServletException, IOException {
		HttpSession session = request.getSession(true);
		CartItem nc = new CartItem();
		if (session.getAttribute("loginuser") == null) {
			response.sendRedirect("login.jsp"); 
		} else {
			String nn = (request.getParameter("number"));
			String Did = request.getParameter("dishID");
			Dish current = new Dish();
			//System.out.println(Did + " id");
			IDishDAO dishdao = (IDishDAO) DAOFactory.newInstance("IDishDAO");
			int id = Integer.parseInt(Did);
			current = dishdao.findDish(id);
			request.setAttribute("current", current);
			int number = Integer.parseInt(nn);
			Customer now = (Customer) session.getAttribute("loginuser");
			nc.username = now.getUsername();
			nc.id = id;
			Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
			int flag = 0;
			while(it.hasNext()){
			Map.Entry entry = (Map.Entry) it.next();
			CartItem ncin = new CartItem();
			ncin = (CartItem)entry.getKey();
			if (nc.id==ncin.id&&nc.username==ncin.username) {
				System.out.println("findout");
				flag = 1;
				cart.put(ncin, (Integer) cart.get(ncin) + number);
			   } 
			}
			if(flag==0){
					cart.put(nc, number);
			}
			session.setAttribute("shopcart", cart);
		    response.sendRedirect("cart.jsp");   
		}
	}

	private void delCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String Did = request.getParameter("dishid");
		Customer now = (Customer) session.getAttribute("loginuser");
		session.setAttribute("shopcart", cart);
		Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
		while(it.hasNext())
		{
			Map.Entry entry = (Map.Entry) it.next();
			CartItem ncin = new CartItem();
			ncin = (CartItem)entry.getKey();
			if (ncin.id==Integer.parseInt(Did)&&ncin.username==now.getUsername()) {
				//System.out.println("findout");
				cart.remove(ncin);
				break;
			   } 
			}
		response.sendRedirect("cart.jsp");
	}

	private void addOne(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		HttpSession session = request.getSession(true);
		CartItem nc = new CartItem();
		if (session.getAttribute("loginuser") == null) {
			response.sendRedirect("login.jsp");
		} else {
			String Did = request.getParameter("dishid");
			Dish current = new Dish();
			IDishDAO dishdao = (IDishDAO) DAOFactory.newInstance("IDishDAO");
			int id = Integer.parseInt(Did);
			current = dishdao.findDish(id);
			request.setAttribute("current", current);
			Customer now = (Customer) session.getAttribute("loginuser");
			nc.username = now.getUsername();
			nc.id = id;
			Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
			int flag = 0;
			while(it.hasNext()){
			Map.Entry entry = (Map.Entry) it.next();
			CartItem ncin = new CartItem();
			ncin = (CartItem)entry.getKey();
			if (nc.id==ncin.id&&nc.username==ncin.username) {
				flag = 1;
				cart.put(ncin, (Integer) cart.get(ncin) + 1);
			   } 
			}
			if(flag==0){
					cart.put(nc, 1);
			}
			session.setAttribute("shopcart", cart);
			response.sendRedirect("cart.jsp");
		}
		
	}
	private void goCart(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession(true);
		if(session.getAttribute("loginuser")==null){
			response.sendRedirect("login.jsp");
		}
		else{
			response.sendRedirect("cart.jsp");
		}
	}
	private void logOut(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession(true);
		Customer cus = (Customer)session.getAttribute("loginuser");
		Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
		while(it.hasNext()){
			Map.Entry entry = (Map.Entry) it.next();
			CartItem ncin = new CartItem();
			if (cus.getUsername()==ncin.username) {
				cart.remove(ncin);
			   } 
		}
		session.removeAttribute("loginuser");
		response.sendRedirect("index.jsp");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
