package com.cugb.javaee.onlinefoodcourt.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cugb.javaee.onlinefoodcourt.bean.Customer;
import com.cugb.javaee.onlinefoodcourt.dao.ICustomerDAO;
import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;

/* 门一凡注释
import edu.cugb.xg.javaee.bean.Users;
import edu.cugb.xg.javaee.biz.UserService;
*/

/**
 * Servlet implementation class LoginControl
 */
@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		
		String username = request.getParameter("loginName");
		String password = request.getParameter("loginPass");
		try {
			System.out.println("进入try");
			ICustomerDAO  cusDAO = (ICustomerDAO)DAOFactory.newInstance("com.cugb.javaee.onlinefoodcourt.dao.ICustomerDAO");
			System.out.println("实例化完成cusDAO");
			
//			Customer cus = cusDAO.findCustomer("root");
			Customer cus = cusDAO.findCustomer(username);
			String pwd = cus.getPassword();
			
//			String pwd = "admin";
			System.out.println("密码为"+pwd);
			if (pwd.equals(password)) {
				request.getRequestDispatcher("show.html").forward(request, response);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
