<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.bean.Customer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
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
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="me.jsp">我的</a></li>
								<li><a href="checkout.jsp">去下单</a></li>
								<li><a href="cart.jsp">我的购物车</a></li>
								<li><a href="login.jsp" class="active">登录</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.jsp">首页</a></li>
								<li class="dropdown"><a href="#">购物</a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="shop.jsp"></a></li>
										<li><a href="product-details.jsp">菜品详情</a></li> 
										<li><a href="checkout.jsp">去下单</a></li> 
										<li><a href="cart.jsp">购物车</a></li> 
										<li><a href="login.jsp" class="active">登录</a></li> 
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="#">动态</i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="blog.jsp">动态列表</a></li>
										<li><a href="blog-single.jsp">个人动态</a></li>
                                    </ul>
                                </li> 
								<li><a href="contact-us.jsp">联系我们</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="搜索美味"/>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
</body>
</html>