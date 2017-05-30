// add by menyifan

package com.cugb.javaee.onlinefoodcourt.action;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cugb.javaee.onlinefoodcourt.bean.Customer;
import com.cugb.javaee.onlinefoodcourt.bean.Dish;
import com.cugb.javaee.onlinefoodcourt.biz.CustomerService;
import com.cugb.javaee.onlinefoodcourt.biz.DishService;
import com.cugb.javaee.onlinefoodcourt.test.BaseService;
import com.cugb.javaee.onlinefoodcourt.utils.ConfigFactory;
import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;
import com.cugb.javaee.onlinefoodcourt.utils.PageModel;

/**
 * Servlet implementation class LoginContrler
 */
@WebServlet("/LoginContrler")
public class LoginContrler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginContrler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String adminUsername = ConfigFactory.readProperty("username");
		String adminPassword = ConfigFactory.readProperty("password");
		
		String username = request.getParameter("loginName");
		String password = request.getParameter("loginPass");
		Customer loginuser = new Customer();
		loginuser.setUsername(username);
		loginuser.setPassword(password);
		
		//数据库验证
		CustomerService cService = new CustomerService();
		try {
			if (username.equals(adminUsername) && password.equals(adminPassword)) {
				//管理员 验证通过
				HttpSession session = request.getSession(true);
				session.setAttribute("loginuser", loginuser);
				session.setAttribute("admin", true);
				request.getRequestDispatcher("show.jsp").forward(request, response);
			} else if (cService.validateCustomer(loginuser)) {
				//普通用户 验证通过
				HttpSession session = request.getSession(true);
				session.setAttribute("loginuser", loginuser);
				session.setAttribute("admin", false);
				request.getRequestDispatcher("show.jsp").forward(request, response);
			}
			else {
				//否则重新登录
				response.sendRedirect("login.jsp");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
