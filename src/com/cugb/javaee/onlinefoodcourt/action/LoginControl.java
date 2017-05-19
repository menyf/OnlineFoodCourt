package com.cugb.javaee.onlinefoodcourt.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
