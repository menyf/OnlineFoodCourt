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
	<div class="header_top">
		<!--header_top-->
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="contactinfo">
						<ul class="nav nav-pills">
							<%
									Customer cuss = (Customer) session.getAttribute("loginuser");
									if(cuss == null){
										out.println("<li><a href=\"login.jsp\">请登录</a></li>");
									}
									else{
										out.println("<li><a href=\"\"></i>欢迎："+cuss.getUsername()+"</a></li>");
									}
								%>
						</ul>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="social-icons pull-right">
						<ul class="nav navbar-nav">
							<li><a href=""><i class="fa fa-weibo"></i></a></li>
							<li><a href=""><i class="fa fa-renren"></i></a></li>
							<li><a href="https://github.com/menyf/OnlineFoodCourt"><i
									class="fa fa-github active"></i></a></li>

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
						<a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="shop-menu pull-right">
						<ul class="nav navbar-nav">
							<!-- <li><a href="me.jsp">我的</a></li> -->
							<!-- <li><a href="checkout.jsp">去下单</a></li>-->
							<li><a href="action?actiontype=goCart">我的购物车</a></li>
							<%
									//Customer cus = (Customer) session.getAttribute("loginuser");
									if(cuss == null){
										out.println("<li><a href=\"login.jsp\">请登录</a></li>");
									}
									else{
										out.println("<li><a href=\"action?actiontype=logOut\"></i>注销</a></li>");
									}
								%>
							<!--  <li><a href="login.jsp" class="active">登录</a></li>-->
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
							<li><a href="index.jsp">首页</a></li>
							<li class="dropdown"><a href="#">购物</a>
								<ul role="menu" class="sub-menu">
									<li><a href="shop.jsp"></a></li>
									<li><a href="index.jsp">菜品详情</a></li>
									<!--<li><a href="checkout.jsp">去下单</a></li>-->
									<li><a href="action?actiontype=goCart">购物车</a></li>
									<%
									//Customer cus = (Customer) session.getAttribute("loginuser");
									if(cuss == null){
										out.println("<li><a href=\"\">请登录</a></li>");
									}
									else{
										out.println("<li><a href=\"action?actiontype=logOut\"></i>注销</a></li>");
									}
								%>
								</ul></li>
							<li><a href="mine.jsp">我的订单</a></li>
							<li><a href="me.jsp">修改信息</a></li>
							<li class="dropdown"><a href="#">联系作者</i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="mailto:menyifan0001@gmail.com">门一凡</a></li>
									<li><a href="mailto:dukanghui@gmail.com">杜康晖</a></li>
									<li><a href="mailto:fanleehao@gmail.com">樊利豪</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
				<!-- <div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="来点什么？"/>
						</div>
					</div> -->
				<div class="col-sm-3">
					<div class="search_box pull-right">
						<input type="text" placeholder="来点什么？" id="query" oninput="$('#search').attr('href', 'search.jsp?q='+this.value)">&nbsp; <a href="search.jsp?q="
							class="btn btn-default get" style="margin-top: 0px" id="search"><i
							class="fa fa-search"></i> 搜索 </a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-bottom--> </header>
	<!--/header-->
</body>
</html>