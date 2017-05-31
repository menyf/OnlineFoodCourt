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

//import edu.cugb.xg.javaee.bean.Dish;
//import edu.cugb.xg.javaee.biz.DishService;
//import edu.cugb.xg.javaee.utils.PageModel;

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
//		case "login":
//			// 登录
//			//loginCheck(request, response);
//			break;
//		case "pagelist":
//			// 分页显示
//			try {
//				//pageListView(request, response);
//			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			break;
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
			// 添加到购物车
		}

	}

//	private void loginCheck(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		logger.error(getServletName(), null);
//
//		String username = request.getParameter("loginName");
//		String password = request.getParameter("loginPass");
//		Customer loginuser = new Customer();
//		loginuser.setUsername(username);
//		loginuser.setPassword(password);
//		// 数据库验证
//		CustomerService cService = new CustomerService();
//		try {
//			if (cService.validateCustomer(loginuser)) {
//				// 验证通过
//				HttpSession session = request.getSession(true);
//				session.setAttribute("loginuser", loginuser);
//				DishService dishserv = new DishService();
//				int pageNO = 1;
//				// int pageSize = Integerprop.getProperty("pageSize");
//				PageModel<Dish> pagemodel = dishserv.findDish4PageList(pageNO, pageSize);
//				request.setAttribute("dishlist", pagemodel.getList());
//				logger.debug(pagemodel.getTotalrecords());
//				request.setAttribute("pageModel", pagemodel);
//				request.getRequestDispatcher("show.jsp").forward(request, response);
//			} else {
//				// 否则重新登录
//				response.sendRedirect("login.jsp");
//			}
//		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			System.out.println("实例化异常");
//			e.printStackTrace();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//	}

//	private void pageListView(HttpServletRequest request, HttpServletResponse response) throws ServletException,
//			IOException, InstantiationException, IllegalAccessException, ClassNotFoundException {
//		// 获取当前页号
//		// logger.debug(request.getParameter("pageNO"));
//		int pageNO = Integer.parseInt(request.getParameter("pageNO"));
//		// int pageSize = Integer.parseInt(prop.getProperty("pageSize"));
//		// 分页查询
//		// int pageSize = 6;
//		// 生成pageModel对象
//		DishService dishserv = new DishService();
//		PageModel<Dish> pagemodel = dishserv.findDish4PageList(pageNO, pageSize);
//		// 跳转到show页面
//		logger.debug(pagemodel.getList());
//		request.setAttribute("dishlist", pagemodel.getList());
//		request.setAttribute("pageModel", pagemodel);
//		RequestDispatcher rd = request
//				.getRequestDispatcher("show.jsp?pageNO=" + pageNO + "&totalpages=" + pagemodel.getTotalPages());
//		rd.forward(request, response);
//
//	}

	private void showdetial(HttpServletRequest request, HttpServletResponse response) throws InstantiationException,
		    IllegalAccessException, ClassNotFoundException, SQLException, ServletException, IOException {
		System.out.println("oooooo");
		String Did = request.getParameter("dishid");
		Dish current = new Dish();
		IDishDAO dishdao = (IDishDAO) DAOFactory.newInstance("IDishDAO");
		int id = Integer.parseInt(Did);
		current = dishdao.findDish(id);
		request.setAttribute("current", current);
		request.getRequestDispatcher("showdetails.jsp").forward(request, response);
		//response.sendRedirect("showdetails.jsp");
	}

	private void addCart(HttpServletRequest request, HttpServletResponse response) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException, ServletException, IOException {
		HttpSession session = request.getSession(true);
		CartItem nc = new CartItem();
		if (session.getAttribute("loginuser") == null) {
			//System.out.println("no user");
			//request.getRequestDispatcher("login.jsp").forward(request, response);
			response.sendRedirect("login.jsp"); 
		} else {
			String nn = (request.getParameter("number"));
			//System.out.println(nn + " fuck you in the cart");
			String Did = request.getParameter("dishID");
			// System.out.println("YYYYYYYY"+ Did);
			Dish current = new Dish();
			System.out.println(Did + " id");
			IDishDAO dishdao = (IDishDAO) DAOFactory.newInstance("IDishDAO");
			int id = Integer.parseInt(Did);
			current = dishdao.findDish(id);
			request.setAttribute("current", current);
			int number = Integer.parseInt(nn);
			Customer now = (Customer) session.getAttribute("loginuser");
			nc.username = now.getUsername();
			nc.id = id;
			System.out.println(cart.containsKey(nc));
			System.out.println(nc+"   "+nc.id);
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
			//request.getRequestDispatcher("cart.jsp").forward(request, response);
		    response.sendRedirect("cart.jsp");   
		}
	}

	private void delCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String Did = request.getParameter("dishid");
		System.out.println(Did + "fuck");
		//cart.remove(Integer.parseInt(Did));
		Customer now = (Customer) session.getAttribute("loginuser");
		session.setAttribute("shopcart", cart);
		Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
		while(it.hasNext())
		{
			Map.Entry entry = (Map.Entry) it.next();
			CartItem ncin = new CartItem();
			ncin = (CartItem)entry.getKey();
			if (ncin.id==Integer.parseInt(Did)&&ncin.username==now.getUsername()) {
				System.out.println("findout");
				cart.remove(ncin);
				break;
			   } 
			}
//		request.getRequestDispatcher("cart.jsp").forward(request, response);
		response.sendRedirect("cart.jsp");
	}

	private void addOne(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		HttpSession session = request.getSession(true);
		CartItem nc = new CartItem();
		if (session.getAttribute("loginuser") == null) {
			//System.out.println("no user");
//			request.getRequestDispatcher("login.jsp").forward(request, response);
			response.sendRedirect("login.jsp");
		} else {
			//System.out.println(nn + " fuck you in the cart");
			String Did = request.getParameter("dishid");
			// System.out.println("YYYYYYYY"+ Did);
			Dish current = new Dish();
			System.out.println(Did + " id");
			IDishDAO dishdao = (IDishDAO) DAOFactory.newInstance("IDishDAO");
			int id = Integer.parseInt(Did);
			current = dishdao.findDish(id);
			request.setAttribute("current", current);
			Customer now = (Customer) session.getAttribute("loginuser");
			nc.username = now.getUsername();
			nc.id = id;
			System.out.println(cart.containsKey(nc));
			System.out.println(nc+"   "+nc.id);
			// Object[] cs = new Object[]{now.getUsername(), id};
			Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
			int flag = 0;
			while(it.hasNext()){
			Map.Entry entry = (Map.Entry) it.next();
			CartItem ncin = new CartItem();
			ncin = (CartItem)entry.getKey();
			if (nc.id==ncin.id&&nc.username==ncin.username) {
				System.out.println("findout");
				flag = 1;
				cart.put(ncin, (Integer) cart.get(ncin) + 1);
			   } 
			}
			if(flag==0){
					cart.put(nc, 1);
			}
			session.setAttribute("shopcart", cart);
//			request.getRequestDispatcher("cart.jsp").forward(request, response);
			response.sendRedirect("cart.jsp");
		}
		
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
