<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.bean.Dish"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.bean.Customer"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.dao.*"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.utils.*"%>
<%@page import="java.lang.Math"%>
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
<script type="text/javascript">
	function getValue(){
		
		alert("hhhh"+document.getElementById("num").value);
	}
</script>
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
									if(cus == null){
										out.println("<li><a href=\"\">请登录</a></li>");
									}
									else{
										out.println("<li><a href=\"\"></i>欢迎："+cus.getUsername()+"</a></li>");
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

	<section style="margin-top: 0px; margin-bottom: 50px">
		<div class="product-details"
			style="margin-left: 100px; margin-right: 100px;">
			<!--product-details-->
			<div class="col-sm-5">
				<div class="view-product">
					<img src=${requestScope.current.picSize("400")} alt="" />
				</div>
				<div id="similar-product" class="carousel slide"
					data-ride="carousel">

					<a class="left item-control" href="#similar-product"
						data-slide="prev"> <i class="fa fa-angle-left"></i>
					</a> <a class="right item-control" href="#similar-product"
						data-slide="next"> <i class="fa fa-angle-right"></i>
					</a>
				</div>
			</div>
			<div class="col-sm-7">
				<div class="product-information">
					<!--/product-information-->
					<img src="images/product-details/new.jpg" class="newarrival" alt="">
					<h2>${requestScope.current.getName()}</h2>
					<p>菜品ID: ${requestScope.current.getDishID()}</p>
					<p>
						<span style="font-size: 20px"><del>￥${requestScope.current.getPrice()}</del></span>
						&nbsp;&nbsp;<span style="color: #FE980F; font-size: 22px">￥${requestScope.current.getDiscount()}</span>
					</p>
					<div class="col-sm-2">
						<p style="padding-top: 5px; font-size: 16px">数量
						<form action="action" method="POST" name="loginForm">
							</p>
					</div>
					<p class="col-sm-2" style="margin-left: -40px">

						<select class="form-control" name="number" >
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select>
					</p>
					<input type="hidden" name="dishID"
						value=${requestScope.current.getDishID()}>
					<!-- <input type="text" name="number" />	 -->

					<input type="hidden" name="actiontype" value="cart">
					<button type="submit" class="btn btn-default cart">
						<i class="fa fa-shopping-cart fa-lg"></i>&nbsp;&nbsp;&nbsp;加入购物车
					</button>
					</form>
					<p></p>
					<p>
						<b>描述:</b> ${requestScope.current.getDescription()}
					</p>
				</div>
				<%--- 
				<div class="product-information"><!--/product-information-->
					<img src="images/product-details/new.jpg" class="newarrival" alt="" />
					<h2>${requestScope.current.getName()}</h2>
					<p>菜品ID: ${requestScope.current.getDishID()}</p>					
					<p><span style="color:#FE980F;font-size:5"><del>￥${requestScope.current.getPrice()}</del></span>
						&nbsp;&nbsp;<span>￥${requestScope.current.getDiscount()}</span></p>
					<p>	<label>数量:</label>									
						<form action="logout" method="POST" name="loginForm">
							<input type="hidden"  name="dishID" value=${requestScope.current.getDishID()} />
							<!-- <input type="text" name="number" />	 -->							
							<p class="col-sm-2">
									<span>数量</span>						
									<select class="form-control" name="number">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
										<option>6</option>
									</select>
							</p>
							<input type="hidden" name="actiontype" value="cart">						
							<i class="fa fa-shopping-cart"></i>	
							<button type="submit" class="btn btn-default cart">加入购物车</button>
						</form>																			
					</p>								
					<p><b>描述:</b> ${requestScope.current.getDescription()}</p>
				</div>
				
				--%>
				<!--/product-information-->
			</div>
		</div>
		<!--/product-details-->


	</section>

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