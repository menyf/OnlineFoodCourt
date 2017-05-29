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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cugb.javaee.onlinefoodcourt.bean.Customer;
import com.cugb.javaee.onlinefoodcourt.dao.ICustomerDAO;
import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;

//import edu.cugb.xg.javaee.bean.Dish;
//import edu.cugb.xg.javaee.biz.DishService;
//import edu.cugb.xg.javaee.utils.PageModel;

/* 门一凡注释
import edu.cugb.xg.javaee.bean.Users;
import edu.cugb.xg.javaee.biz.UserService;
*/

/**
 * Servlet implementation class LoginControl
 */
//@WebServlet("/loginControl")
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
	private int pageSize = 6;
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
		/* 门一凡注释
		//step 1 获取用户提交的用户名和口令
		String username = request.getParameter("loginName");
		String password = request.getParameter("loginPass");
		Users user = new Users();
		user.setUsername(username);
		user.setPassword(password);
		//step 2 数据库验证用户
		UserService userserv = new UserService();
		if(userserv.validateUser(user)){
			//验证通过 ，跳转到show.jsp
			request.getRequestDispatcher("show.jsp").forward(request, response);
		}else{
			//否则，重新登录
			response.sendRedirect("login.html");
//			request.getRequestDispatcher("login.html").forward(request, response);
		}
		*/
		//logger.debug(getServletConfig());;
		String actiontype = request.getParameter("actiontype");
        System.out.println(actiontype);
		switch (actiontype) {
		case "login":
			// 登录
			loginCheck(request, response);
			break;
		case "pagelist":
			System.out.println("----------------");
			// 分页显示
			try {
				pageListView(request, response);
				System.out.println("分页");
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
		try {
			ICustomerDAO  cusDAO = (ICustomerDAO)DAOFactory.newInstance("ICustomerDAO");
			Customer cus = cusDAO.findCustomer(username);
			System.out.println(username);
			String pwd = cus.getPassword();
			//System.out.println("233333333");
			if (pwd.equals(password)) {
				DishService dishserv = new DishService();
				int pageNO = 1;
				//int pageSize = Integerprop.getProperty("pageSize");
				PageModel<Dish> pagemodel = dishserv.findDish4PageList(pageNO, pageSize);
				System.out.println("ok");
				request.setAttribute("dishlist", pagemodel.getList());
				logger.debug(pagemodel.getTotalrecords());
				System.out.println(pagemodel.getTotalrecords()+" 全部记录");
				request.setAttribute("pageModel", pagemodel);
				request.getRequestDispatcher("show2.jsp").forward(request, response);
			}
			else {
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
		System.out.println(pagemodel.getList().get(1).getDescription()+"   FUCK YOU");
		request.setAttribute("dishlist", pagemodel.getList());
		request.setAttribute("pageModel", pagemodel);
		RequestDispatcher rd = request
				.getRequestDispatcher("show2.jsp?pageNO=" + pageNO + "&totalpages=" + pagemodel.getTotalPages());
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
