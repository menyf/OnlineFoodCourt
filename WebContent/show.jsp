<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.bean.Dish"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.bean.Customer"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.dao.*"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.biz.*"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.utils.*"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.utils.ConfigFactory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%

if(session.getAttribute("pageSize") == null){
	// 第一次访问该页面
	session.setAttribute("pageSize", ConfigFactory.readProperty("pageSize"));
}
if(request.getParameter("pageNO") == null){
	request.setAttribute("pageNO", "1");
}
else{
	request.setAttribute("pageNO", request.getParameter("pageNO"));
}


//根据页码生成相应的dishlist
int pageNO = Integer.parseInt((String)request.getAttribute("pageNO"));
int pageSize = Integer.parseInt((String)session.getAttribute("pageSize"));
DishService dishserv = new DishService();
PageModel<Dish> pagemodel = dishserv.findDish4PageList(pageNO, pageSize);
request.setAttribute("dishlist", pagemodel.getList());
request.setAttribute("pageModel", pagemodel); 

System.out.println("pageSize:"+String.valueOf(pageSize));

%>

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
										out.println("<li><a href=\"\"><i class=\"fa fa-phone\"></i>请登录 用户名</a></li>");
										out.println("<li><a href=\"\"><i class=\"fa fa-envelope\"></i>请登录 邮箱</a></li>");
									}
									else{
										out.println("<li><a href=\"\"><i class=\"fa fa-phone\"></i>"+cus.getUsername()+"</a></li>");
										out.println("<li><a href=\"\"><i class=\"fa fa-envelope\"></i>"+cus.getNickname()+"</a></li>");
									}
								%>
								<!-- <li><a href=""><i class="fa fa-phone"></i>这里应该显示用户名</a></li>
								<li><a href=""><i class="fa fa-envelope"></i>这里应该显示邮箱</a></li> -->
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
							<a href="index.html"><img src="images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="me.html">我的</a></li>
								<li><a href="checkout.html">去下单</a></li>
								<li><a href="cart.html">我的购物车</a></li>
								<li><a href="login.html" class="active">登录</a></li>
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
								<li><a href="index.html">首页</a></li>
								<li class="dropdown"><a href="#">购物</a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="shop.html"></a></li>
										<li><a href="product-details.html">菜品详情</a></li> 
										<li><a href="checkout.html">去下单</a></li> 
										<li><a href="cart.html">购物车</a></li> 
										<li><a href="login.html" class="active">登录</a></li> 
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="#">动态</i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="blog.html">动态列表</a></li>
										<li><a href="blog-single.html">个人动态</a></li>
                                    </ul>
                                </li> 
								<li><a href="contact-us.html">联系我们</a></li>
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
	<!-- 
	 <section style="margin-top:0px; margin-bottom:50px">
		<div class="container">
			<TABLE cellSpacing=2 cellPadding=1 width="100%" align=center border=0>
				<TBODY>
					<c:forEach var="currentdish" items="${requestScope.dishlist}"
						varStatus="status">
						<c:if test="${status.index%2==0}">
							<tr>
						</c:if>
						<td>
							<TABLE height="100%" cellSpacing=1 cellPadding=2 border=0>
								<TBODY>
									<TR>
										<TD vAlign=top width=90 height=90>
											<A	href=showdetail?dishid=${currentdish.getDishID()}
												target=_blank><IMG height=100 alt=点击图片查看内容
												src=${currentdish.getImgURL() } width=100 border=0>
											</A>
										</TD>
										<TD vAlign=top>
											<TABLE cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
												<TBODY>
													<TR>
														<TD>
															<A href=# target=_blank>
																<STRONG>${currentdish.getName()}</STRONG>
															</A>
														</TD>
													</TR>
													<TR>
														<TD height=21>
															<FONT color=#ff0000>现价：人民币${currentdish.getPrice()}元</FONT>
															<BR> ${currentdish.getDescription()}
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</td>
						<c:if test="${status.index%2!=0}">
							</tr>
						</c:if>
					</c:forEach>
					<tr>
						<td height="2">
							<div align="center">
								<font color="#000000">&nbsp;共&nbsp;${requestScope.pageModel.bottomPageNO}&nbsp;页</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<font color="#000000">当前第</font>&nbsp;<font color="#000000">${param.pageNO}</font>&nbsp;
								<font color="#000000">页</font>
							</div>
						</td>
						<td>
							<div align="center">
								<a name="btnTopPage" id="btnTopPage" href="show.jsp?pageNO=1" title="首页">
									|&lt;&lt;
								</a>&nbsp;
								<a name="btnPreviousPage" id="btnPreviousPage"
									href="show.jsp?pageNO=${requestScope.pageModel.prevPageNO}" title="上页">
									 &lt; 
								</a>&nbsp; 
								<a name="btnNextPage" id="btnNextPage"
									href="show.jsp?pageNO=${requestScope.pageModel.nextPageNO}" title="下页">
									 &gt; 
								</a>&nbsp; 
								<a name="btnBottomPage"	id="btnBottomPage"
									href="show.jsp?pageNO=${requestScope.pageModel.bottomPageNO}"
									title="尾页">
								 	&gt;&gt;|
								</a>
							</div>
						</td>
					</tr>
				</TBODY>
			</TABLE>

		</div>
	</section>
  -->
 	
 <section>
		<div class="container">
			<div class="row">
				
				
				<div class="col-sm-12 padding-right">
					<!--features_items-->
					
					<div class="category-tab"><!--category-tab-->
						
						<div class="tab-content">


							<div class="tab-pane fade active in">

								<c:forEach items="${requestScope.dishlist}" var="currentdish"
									varStatus="status">
									<div class="col-sm-3">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<a  href="action?actiontype=detail&dishid=${currentdish.getDishID()}"><img src="${currentdish.picSize("256")}" alt=""></a>													
													<h2>¥${currentdish.getPrice()}</h2>
													<a href="action?actiontype=detail&dishid=${currentdish.getDishID()}"><p>${currentdish.getName()}</p></a>
													<a href="action?actiontype=detail&dishid=${currentdish.getDishID()}" class="btn btn-default add-to-cart"><i class="fa fa-eye"></i>详情</a>
													&nbsp;
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>购物车</a>
												</div>

											</div>
										</div>
									</div>
								</c:forEach>


								<!-- <div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery1.jpg" alt="">
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div> -->


							</div>

						</div>
					</div><!--/category-tab-->
					
					<div class="col-sm-12">
						<table>
						
					<tr>
					<ul class="pager">
					<li><a name="btnTopPage" id="btnTopPage" href="show.jsp?pageNO=1">首页</a></li>
    <li><a name="btnPreviousPage" id="btnPreviousPage"
									href="show.jsp?pageNO=${requestScope.pageModel.prevPageNO}">上一页</a></li>
    <li class="disabled"><a href="#">${requestScope.pageModel.getPageNO()} / ${requestScope.pageModel.bottomPageNO}
</a></li>
    <li><a name="btnNextPage" id="btnNextPage"
									href="show.jsp?pageNO=${requestScope.pageModel.nextPageNO}" >下一页</a></li>
    <li><a name="btnBottomPage"	id="btnBottomPage"
									href="show.jsp?pageNO=${requestScope.pageModel.bottomPageNO}">尾页</a></li>
</ul>
					</tr>
						</table>
					
					</div>
					<%--- 
				 	<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">recommended items</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active left">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="">
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="">
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="">
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>
								<div class="item next left">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="">
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="">
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="">
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>
							</div>
							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							  </a>
							  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
								<i class="fa fa-angle-right"></i>
							  </a>			
						</div>
					</div><!--/recommended_items-->
					 --%>
				</div>
			</div>
		</div>
	</section>
  
	<footer id="footer"><!--Footer-->				
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2017 JAVA EE课程实践. All rights reserved.</p>
					<p class="pull-right">Designed by <span>DU/MEN/FAN</span></p>
				</div>
			</div>
		</div>		
	</footer><!--/Footer-->  
   
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>