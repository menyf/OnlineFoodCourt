<%@page import="com.cugb.javaee.onlinefoodcourt.utils.JSPOutput"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.utils.*"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.bean.*"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.dao.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Checkout | E-Shopper</title>
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
	<header id="header"> <!--header-->
	<div class="header_top">
		<!--header_top-->
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="contactinfo">
						<ul class="nav nav-pills">
							<li><a href=""><i class="fa fa-phone"></i> +2 95 01 88
									821</a></li>
							<li><a href=""><i class="fa fa-envelope"></i>
									info@domain.com</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="social-icons pull-right">
						<ul class="nav navbar-nav">
							<li><a href=""><i class="fa fa-facebook"></i></a></li>
							<li><a href=""><i class="fa fa-twitter"></i></a></li>
							<li><a href=""><i class="fa fa-linkedin"></i></a></li>
							<li><a href=""><i class="fa fa-dribbble"></i></a></li>
							<li><a href=""><i class="fa fa-google-plus"></i></a></li>
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
						<a href="index.html"><img src="images/home/logo.png" alt=""></a>
					</div>
					<div class="btn-group pull-right">
						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle usa"
								data-toggle="dropdown">
								USA <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="">Canada</a></li>
								<li><a href="">UK</a></li>
							</ul>
						</div>

						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle usa"
								data-toggle="dropdown">
								DOLLAR <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="">Canadian Dollar</a></li>
								<li><a href="">Pound</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="shop-menu pull-right">
						<ul class="nav navbar-nav">
							<li><a href=""><i class="fa fa-user"></i> Account</a></li>
							<li><a href=""><i class="fa fa-star"></i> Wishlist</a></li>
							<li><a href="checkout.html" class="active"><i
									class="fa fa-crosshairs"></i> Checkout</a></li>
							<li><a href="cart.html"><i class="fa fa-shopping-cart"></i>
									Cart</a></li>
							<li><a href="login.html"><i class="fa fa-lock"></i>
									Login</a></li>
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
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="mainmenu pull-left">
						<ul class="nav navbar-nav collapse navbar-collapse">
							<li><a href="index.html">Home</a></li>
							<li class="dropdown"><a href="#">Shop<i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="shop.html">Products</a></li>
									<li><a href="product-details.html">Product Details</a></li>
									<li><a href="checkout.html" class="active">Checkout</a></li>
									<li><a href="cart.html">Cart</a></li>
									<li><a href="login.html">Login</a></li>
								</ul></li>
							<li class="dropdown"><a href="#">Blog<i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="blog.html">Blog List</a></li>
									<li><a href="blog-single.html">Blog Single</a></li>
								</ul></li>
							<li><a href="404.html">404</a></li>
							<li><a href="contact-us.html">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="search_box pull-right">
						<input type="text" placeholder="Search">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-bottom--> </header>
	<!--/header-->

	<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<ol class="breadcrumb">
				<li><a href="#">Admin</a></li>
				<li class="active">菜品管理</li>
				<li class="active">删除菜品信息</li>
			</ol>
		</div>
		<!--/breadcrums-->

		<!-- <div class="step-one">
				<h2 class="heading">菜品管理</h2>
			</div> -->
		<!--/checkout-options-->

		<!--/register-req-->


		<div class="review-payment">
			<h2>菜品管理</h2>
		</div>
		<div class="step-one">
			<h2 class="heading">删除菜品信息</h2>
		</div>
		
		<div class="register-req" style="background-color:#FFC0CB;">
			<p class="bg-danger"><%
				String check = request.getParameter("check");
				if(check == null){
					out.println("请注意，删除之后菜品信息无法恢复");
				}
				else{
					out.println("已删除");
				}
			%></p>
		</div>
		<div class="table-responsive cart_info">


			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-5">
						<div class="shopper-info">
						 <br>
							<p>菜品信息</p>
							<form action="dishDelete.jsp" method="post">
								<%
									Customer admin = (Customer)session.getAttribute("loginuser") ;
									if(admin == null || !admin.getUsername().equals(ConfigFactory.readProperty("username"))){
										response.sendRedirect("login.jsp");
									}
									String id = request.getParameter("dishid");
									if(id == null) response.sendRedirect("dishManage.jsp");
									IDishDAO disDAO = (IDishDAO) DAOFactory.newInstance("com.cugb.javaee.onlinefoodcourt.dao.IDishDAO");
									Dish dish = disDAO.findDish(Integer.parseInt(id));
									JSPOutput.outputDishDelete(out, dish);
								%>
								
								<%-- <div class="form-group">
									<label for="exampleInputEmail1">菜品ID</label> <input
										type="email" class="form-control" name="dishID"
										placeholder="菜品ID" readonly="true" value="${dish_1.dishID}">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">菜品名称</label> <input
										type="text" class="form-control" name="name" placeholder="菜品名称">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">价格</label> <input
										type="text" class="form-control" name="price" placeholder="价格">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">描述</label>
									<textarea class="form-control" rows="3" placeholder="描述" name="description"></textarea>
									<!-- <input type="text" class="form-control" id="description"
										placeholder="描述" rows="3"> -->
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">图片地址</label> <input
										type="text" class="form-control" name="imgURL"
										placeholder="http://">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">菜品折扣</label> <input
										type="text" class="form-control" name="discount"
										placeholder="1.00">
								</div> --%>

								<input name="check" value="1" hidden=1></input>
								
								<%
								if(check == null){
									out.println("<button type=\"submit\" class=\"btn btn-danger\" width=\"80\" padding=\"20\">确认删除</button>");
								}
								else{
									disDAO.removeDish(dish.getDishID());
								}
								%>
								
							</form>


							<br>
						</div>
					</div>
					<div class="col-sm-1"></div>
					<div class="col-sm-4">
						<div class="order-message">
						 
							<br>
							<p>图片预览</p>
							<img
								<%
									out.println("src="+dish.getImgURL().substring(0, 93)+"335x335");
								%>
								height="335" width="335">


						</div>
					</div>


				</div>
			</div>



		</div>

	</div>
	</section>
	<!--/#cart_items-->



	<footer id="footer"> <!--Footer-->
	<div class="footer-top">
		<div class="container">
			<div class="row">
				<div class="col-sm-2">
					<div class="companyinfo">
						<h2>
							<span>e</span>-shopper
						</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing
							elit,sed do eiusmod tempor</p>
					</div>
				</div>
				<div class="col-sm-7">
					<div class="col-sm-3">
						<div class="video-gallery text-center">
							<a href="#">
								<div class="iframe-img">
									<img src="images/home/iframe1.png" alt="">
								</div>
								<div class="overlay-icon">
									<i class="fa fa-play-circle-o"></i>
								</div>
							</a>
							<p>Circle of Hands</p>
							<h2>24 DEC 2014</h2>
						</div>
					</div>

					<div class="col-sm-3">
						<div class="video-gallery text-center">
							<a href="#">
								<div class="iframe-img">
									<img src="images/home/iframe2.png" alt="">
								</div>
								<div class="overlay-icon">
									<i class="fa fa-play-circle-o"></i>
								</div>
							</a>
							<p>Circle of Hands</p>
							<h2>24 DEC 2014</h2>
						</div>
					</div>

					<div class="col-sm-3">
						<div class="video-gallery text-center">
							<a href="#">
								<div class="iframe-img">
									<img src="images/home/iframe3.png" alt="">
								</div>
								<div class="overlay-icon">
									<i class="fa fa-play-circle-o"></i>
								</div>
							</a>
							<p>Circle of Hands</p>
							<h2>24 DEC 2014</h2>
						</div>
					</div>

					<div class="col-sm-3">
						<div class="video-gallery text-center">
							<a href="#">
								<div class="iframe-img">
									<img src="images/home/iframe4.png" alt="">
								</div>
								<div class="overlay-icon">
									<i class="fa fa-play-circle-o"></i>
								</div>
							</a>
							<p>Circle of Hands</p>
							<h2>24 DEC 2014</h2>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="address">
						<img src="images/home/map.png" alt="">
						<p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer-widget">
		<div class="container">
			<div class="row">
				<div class="col-sm-2">
					<div class="single-widget">
						<h2>Service</h2>
						<ul class="nav nav-pills nav-stacked">
							<li><a href="">Online Help</a></li>
							<li><a href="">Contact Us</a></li>
							<li><a href="">Order Status</a></li>
							<li><a href="">Change Location</a></li>
							<li><a href="">FAQ’s</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="single-widget">
						<h2>Quock Shop</h2>
						<ul class="nav nav-pills nav-stacked">
							<li><a href="">T-Shirt</a></li>
							<li><a href="">Mens</a></li>
							<li><a href="">Womens</a></li>
							<li><a href="">Gift Cards</a></li>
							<li><a href="">Shoes</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="single-widget">
						<h2>Policies</h2>
						<ul class="nav nav-pills nav-stacked">
							<li><a href="">Terms of Use</a></li>
							<li><a href="">Privecy Policy</a></li>
							<li><a href="">Refund Policy</a></li>
							<li><a href="">Billing System</a></li>
							<li><a href="">Ticket System</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="single-widget">
						<h2>About Shopper</h2>
						<ul class="nav nav-pills nav-stacked">
							<li><a href="">Company Information</a></li>
							<li><a href="">Careers</a></li>
							<li><a href="">Store Location</a></li>
							<li><a href="">Affillate Program</a></li>
							<li><a href="">Copyright</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-3 col-sm-offset-1">
					<div class="single-widget">
						<h2>About Shopper</h2>
						<form action="#" class="searchform">
							<input type="text" placeholder="Your email address">
							<button type="submit" class="btn btn-default">
								<i class="fa fa-arrow-circle-o-right"></i>
							</button>
							<p>
								Get the most recent updates from <br>our site and be
								updated your self...
							</p>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights
					reserved.</p>
				<p class="pull-right">
					Designed by <span><a target="_blank"
						href="http://www.themeum.com">Themeum</a></span>
				</p>
			</div>
		</div>
	</div>

	</footer>
	<!--/Footer-->



	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>

</body>
</html>