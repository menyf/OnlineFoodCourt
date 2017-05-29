package com.cugb.javaee.onlinefoodcourt.action;

import com.cugb.javaee.onlinefoodcourt.test.*;
import com.cugb.javaee.onlinefoodcourt.bean.*;
import com.cugb.javaee.onlinefoodcourt.biz.*;
import com.cugb.javaee.onlinefoodcourt.utils.*;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cugb.javaee.onlinefoodcourt.bean.Customer;
import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;

//import edu.cugb.xg.javaee.bean.Dish;
//import edu.cugb.xg.javaee.biz.DishService;
//import edu.cugb.xg.javaee.utils.PageModel;

/**
 * Servlet implementation class LoginControl
 */
public class LoginControl extends BaseService {
	private static final long serialVersionUID = 1L;
	private static Properties prop = null;
	static{
		InputStream in = DAOFactory.class.getClassLoader().getResourceAsStream("dao.properties");
		prop = new Properties();
		try {
			prop.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	private int pageSize = 10;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//logger.debug(getServletConfig());;
		String actiontype = request.getParameter("actiontype");
		switch (actiontype) {
		case "login":
			// 登录
			loginCheck(request, response);
			break;
		case "pagelist":
			// 分页显示
			try {
				pageListView(request, response);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "detail":
			// 显示某一个菜品的详细信息
		case "cart":
			// 添加到购物车
		}
		
		
	}
	
	private void loginCheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.error(getServletName(), null);
		
		String username = request.getParameter("loginName");
		String password = request.getParameter("loginPass");
		Customer loginuser = new Customer();
		loginuser.setUsername(username);
		loginuser.setPassword(password);
		//数据库验证
		CustomerService cService = new CustomerService();
		try {
			if (cService.validateCustomer(loginuser)) {
				//验证通过
				HttpSession session = request.getSession(true);
				session.setAttribute("loginuser", loginuser);
				DishService dishserv = new DishService();
				int pageNO = 1;
				//int pageSize = Integerprop.getProperty("pageSize");
				PageModel<Dish> pagemodel = dishserv.findDish4PageList(pageNO, pageSize);
				request.setAttribute("dishlist", pagemodel.getList());
				logger.debug(pagemodel.getTotalrecords());
				request.setAttribute("pageModel", pagemodel);
				request.getRequestDispatcher("show.jsp").forward(request, response);
			}
			else {
				//否则重新登录
				response.sendRedirect("login.html");
			}
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("实例化异常");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	private void pageListView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		// 获取当前页号
		//logger.debug(request.getParameter("pageNO"));
		int pageNO = Integer.parseInt(request.getParameter("pageNO"));
		//int pageSize = Integer.parseInt(prop.getProperty("pageSize"));
		// 分页查询
		// int pageSize = 6;
		// 生成pageModel对象
		DishService dishserv = new DishService();
		PageModel<Dish> pagemodel = dishserv.findDish4PageList(pageNO, pageSize);
		// 跳转到show页面
		logger.debug(pagemodel.getList());
		request.setAttribute("dishlist", pagemodel.getList());
		request.setAttribute("pageModel", pagemodel);
		RequestDispatcher rd = request
				.getRequestDispatcher("show.jsp?pageNO=" + pageNO + "&totalpages=" + pagemodel.getTotalPages());
		rd.forward(request, response);

	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
