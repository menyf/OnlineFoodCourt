<%@page import="com.cugb.javaee.onlinefoodcourt.bean.OrderItem"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.bean.Order"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.bean.CartItem"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.bean.Dish"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.bean.Customer"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.dao.*"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.biz.*"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.utils.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>网上订餐</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->

<body>
	 <jsp:include page="header.jsp"></jsp:include>
	

	<section id="cart_items" style="margin-bottom: 20px">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">Shopping Cart</li>
				</ol>
			</div>

			<div class="table-responsive cart_info">
				
				<table class="table table-condensed">
					<%
					Customer cus = (Customer) session.getAttribute("loginuser");
					
						IOrderDAO orderdao = (IOrderDAO) DAOFactory.newInstance("IOrderDAO");
						IDishDAO dishdao = (IDishDAO) DAOFactory.newInstance("IDishDAO");
						
						if (cus == null) {
							out.println("<tr >还没登录？<a href=\"login.jsp\">去登录</a></tr>");
						} else if (orderdao.findOrders(cus.getUsername()).size() == 0) {
							out.println("hhhhh");
							out.println("<tr >还没有下过单？<a href=\"index.jsp\">去订餐</a></tr>");
						} else {
							
							out.println("<thead align=\"center\">");
							out.println("<tr class=\"cart_menu\">");
							out.println("<td class=\"description\">订单号</td>");
							out.println("<td class=\"price\">菜&nbsp;&nbsp;品</td>");
							out.println("<td class=\"total\">总&nbsp;&nbsp;数</td>");
							out.println("<td class=\"total\">总&nbsp;&nbsp;价</td>");
							out.println("<td class=\"total\">时&nbsp;&nbsp;间</td>");
							out.println("<td class=\"total\">地&nbsp;&nbsp;址</td>");
							out.println("<td class=\"total\">电&nbsp;&nbsp;话</td>");
							out.println("<td class=\"total\">状&nbsp;&nbsp;态</td>");
							out.println("</tr>");
							out.println("</thead>");
							out.println("<tbody>");

							ArrayList<Order> arr = orderdao.findOrders(cus.getUsername());							
							
							float totalPrice = 0.0f;
							int totalNum = 0;
							for(Order order:arr) {							
								out.println("<tr align=\"center\">");
								out.println(" <td class=\"description\">");
								/* out.println("  <a href=\"\">"); */
								out.println("  <h4>");
								out.println(order.getOrderID());
								out.println("  </h4>");
								/* out.println("  </a>"); */
								out.println(" </td>");
								
								out.println(" <td class=\"price\">");
								out.println("  <h4>");
								ArrayList<OrderItem> items = order.getItems();
								
								for(OrderItem oi:items){
									String name = dishdao.findDish(oi.getDishID()).getName();
									int num = oi.getCount();
									out.println("<p>"+name+"×"+num+"</p>");
								}								
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"total\">");
								out.println("  <h4>");
								out.println(order.getCount());
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"total\">");
								out.println("  <h4>¥");
								out.println(order.getTotalPrice());
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"total\">");
								out.println("  <h4>");
								out.println(order.getTime().toString().substring(0, 19));
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"total\">");
								out.println("  <h4>");
								out.println(order.getAddress());
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"total\">");
								out.println("  <h4>");
								out.println(order.getTel());
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"total\">");
								out.println("  <h4>");
								out.println(order.getPayStatus());
								out.println("  </h4>");
								out.println(" </td>");								
								out.println("</tr>");
							}
						}
					%>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<!--/#cart_items-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>