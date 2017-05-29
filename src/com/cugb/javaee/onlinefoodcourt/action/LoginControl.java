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
import javax.servlet.http.HttpSession;

import com.cugb.javaee.onlinefoodcourt.bean.Customer;
import com.cugb.javaee.onlinefoodcourt.biz.CustomerService;
import com.cugb.javaee.onlinefoodcourt.dao.ICustomerDAO;
import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;



/* 门一凡注释
import edu.cugb.xg.javaee.bean.Users;
import edu.cugb.xg.javaee.biz.UserService;
*/

/**
 * Servlet implementation class LoginControl
 */
@WebServlet("/loginControl")
public class LoginControl extends BaseService {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControl() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void loginCheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// step 1 获取用户提交的用户名和口令
		String username = request.getParameter("loginName");
		String password = request.getParameter("loginPass");
		Customer customer = new Customer();
		customer.setUsername(username);
		customer.setPassword(password);
		// step 2 数据库验证用户
		CustomerService cuService = new CustomerService();
		RequestDispatcher rd = null;
		if (cuService.validateCustomer(customer)) {
			// 验证通过 ，跳转到show.jsp
			HttpSession session = request.getSession(true);
			session.setAttribute("loginuser", customer);
			DishService dishserv = new DishService();
			// int pageSize = 6;
			int pageNO = 1;
			PageModel<Dish> pagemodel = dishserv.findDish4PageList(pageNO, pageSize);
			request.setAttribute("dishlist", pagemodel.getList());
			logger.debug(pagemodel.getTotalrecords());
			request.setAttribute("pageModel", pagemodel);
			// rd = request.getRequestDispatcher("show.jsp");
			rd = request.getRequestDispatcher("show.jsp?pageNO=1&totalpages=" + pagemodel.getTotalPages());
			rd.forward(request, response);
		} else {
			// 否则，重新登录
			response.sendRedirect("login.html");
			// request.getRequestDispatcher("login.html").forward(request,
			// response);
		}
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//logger.debug(getServletConfig());;
		//logger.error(getServletName(), null);;
		String actiontype = request.getParameter("actiontype");
		switch (actiontype) {
		case "login":
			// 登录
			loginCheck(request, response);
			break;
		case "pagelist":
			// 分页显示
			pageListView(request, response);
			break;
		case "detail":
			// 显示某一个菜品的详细信息
		case "cart":
			// 添加到购物车
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
