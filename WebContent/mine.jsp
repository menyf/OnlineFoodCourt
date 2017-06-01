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
	<header id="header">
		<!--header-->
		<div class="header_top">
			<!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<%
									Customer cus = (Customer) session.getAttribute("loginuser");
									if (cus == null) {
										out.println("<li><a href=\"\">请登录</a></li>");
									} else {
										out.println("<li><a href=\"\"></i>欢迎：" + cus.getUsername() + "</a></li>");
									}
								%>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header_top-->

		<div class="header-middle">
			<!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.html"><img src="images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="me.jsp">我的</a></li>
								<li><a href="checkout.html">去下单</a></li>
								<li><a href="cart.html">我的购物车</a></li>
								<li><a href="login.jsp" class="active">登录</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-middle-->

		<div class="header-bottom">
			<!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.html">首页</a></li>
								<li class="dropdown"><a href="#">购物</a>
									<ul role="menu" class="sub-menu">
										<li><a href="shop.html"></a></li>
										<li><a href="product-details.html">菜品详情</a></li>
										<li><a href="checkout.html">去下单</a></li>
										<li><a href="cart.html">购物车</a></li>
										<li><a href="login.jsp" class="active">登录</a></li>
									</ul></li>
								<li class="dropdown"><a href="#">动态</i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="blog.html">动态列表</a></li>
										<li><a href="blog-single.html">个人动态</a></li>
									</ul></li>
								<li><a href="contact-us.html">联系我们</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="搜索美味" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-bottom-->
	</header>
	<!--/header-->

	<section id="cart_items" style="margin-bottom: 20px">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">Shopping Cart</li>
				</ol>
			</div>

			<div class="table-responsive cart_info">
				<%--- <table class="table table-condensed"  align="center" border="0">
					<thead>
						<tr class="cart_menu">
							<td class="image" width="23%" align="center">菜品</td>
							<td class="price" width="20%" align="center">价格</td>
							<td class="quantity" width="18%" align="center">数量</td>
							<td class="total" width="20%" align="center">总价</td>
							<td class="total"  width="19%" align="center"></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<Table border="0"  align="center">
						<% 
						float sum = 0;
						int counts = 0;
						Map cart = (Map) session.getAttribute("shopcart");
						Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
						while(it.hasNext()){
							Map.Entry entry = (Map.Entry) it.next();
							IDishDAO ff = (IDishDAO)DAOFactory.newInstance("IDishDAO");
							out.println("<tr>");
							int dishid = (Integer)entry.getKey();
							int disnumber = (Integer)entry.getValue();
							counts+=disnumber;
							Dish cur = ff.findDish(dishid);
							sum+=disnumber * cur.getPrice();
							out.println("<td>");
							out.println("<table border=\"0\" cellpadding=\"75\" cellspacing=\"0\" height=\"100%\">");
							out.println("<tbody>");
							out.println("<tr>");							
							out.println("<td height=\"100\" align=\"center\" valign=\"top\" width=\"25%\">");	
							out.println("<a href =logout?actiontype=detail&dishid=" + dishid + ">");
							out.println("<strong>");
							out.println(cur.getName());
							out.println("</strong>");
							out.println("</a>");
							out.println("<a href =logout?actiontype=detail&dishid=" + dishid + ">");
							out.println("<img alt=\"点击图片查看内容\" border=\"0\" height=\"100\" src=\""+cur.getImgURL()+"\" width=\"100\"/>");
							out.println("</a>");
							out.println("</td>");
							out.println("<td height=\"21\" align=\"center\" width=\"20%\" >");
							out.println("<font size=\"5\" color=\"#ff0000\">");
							out.println("￥:"+String.valueOf(cur.getPrice()));
							out.println("</font>");
							out.println("</td>");

							out.println("<td height=\"21\" align=\"center\"  width=\"20%\">");
							out.println("<font size=\"5\" color=\"#ff0000\">");
							out.println(disnumber);
							out.println("</font>");
							out.println("</td>");
							
							out.println("<td height=\"21\" align=\"center\"  width=\"20%\">");
							out.println("<font size=\"5\" color=\"#ff0000\">");
							out.print("￥:");
							out.println(disnumber * cur.getPrice() * cur.getDiscount());
							out.println("</font>");
							out.println("</td>");
							
							out.println("<td font-size=\"5\" height=\"21\" align=\"center\"  width=\"15%\">");
                            out.println("<a type = \"submit\" href = logout?actiontype=del&dishid=" + dishid + " class=\"btn btn-default cart\" value = \"我不饿\">删除</a>");
							out.println("</td>");
							
							out.println("</tr>");
							out.println("</tbody>");
							out.println("</table>");
							out.println("</td>");
						} 
						
						
						%>
						</Table>
					</tbody>
					
				</table>--%>
				<table class="table table-condensed">
					<%
						IOrderDAO orderdao = (IOrderDAO) DAOFactory.newInstance("IOrderDAO");
						IDishDAO dishdao = (IDishDAO) DAOFactory.newInstance("IDishDAO");
						if (cus == null) {
							out.println("<tr >还没登录？<a href=\"login.jsp\">去登录</a></tr>");
						} else if (orderdao.findOrders(cus.getUsername()).size() == 0) {
							System.out.println("hhhhh");
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
								out.println("<tr>");
								
								out.println(" <td class=\"cart_product\">");
								out.println("  <a href=\"\">");
								out.println("  <h4>");
								out.println(order.getOrderID());
								out.println("  </h4>");
								out.println("  </a>");
								out.println(" </td>");
								
								out.println(" <td class=\"cart_product\">");
								out.println("  <h4>");
								ArrayList<OrderItem> items = order.getItems();
								for(OrderItem oi:items){
									String name = dishdao.findDish(oi.getDishID()).getName();
									int num = oi.getCount();
									out.println("<p>"+name+"×"+num+"</p>");
								}								
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"cart_product\">");
								out.println("  <h4>");
								out.println(order.getCount());
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"cart_product\">");
								out.println("  <h4>¥");
								out.println(order.getTotalPrice());
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"cart_product\">");
								out.println("  <h4>");
								out.println(order.getTime());
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"cart_product\">");
								out.println("  <h4>");
								out.println(order.getAddress());
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"cart_product\">");
								out.println("  <h4>");
								out.println(order.getTel());
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"cart_product\">");
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
	<footer id="footer">
		<!--Footer-->
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2017 JAVA EE课程实践. All rights
						reserved.</p>
					<p class="pull-right">
						Designed by <span>DU/MEN/FAN</span>
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!--/Footer-->

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>