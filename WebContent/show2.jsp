<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.bean.Dish"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.dao.*"%>
<%@page import="com.cugb.javaee.onlinefoodcourt.utils.*"%>
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
<title>Home | E-Shopper</title>
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
								<li><a href="#"><i class="fa fa-phone"></i> +2 95 01 88
										821</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i>
										info@domain.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
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
						<div class="btn-group pull-right">
							<div class="btn-group">
								<button type="button"
									class="btn btn-default dropdown-toggle usa"
									data-toggle="dropdown">
									USA <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Canada</a></li>
									<li><a href="#">UK</a></li>
								</ul>
							</div>

							<div class="btn-group">
								<button type="button"
									class="btn btn-default dropdown-toggle usa"
									data-toggle="dropdown">
									DOLLAR <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Canadian Dollar</a></li>
									<li><a href="#">Pound</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-user"></i> Account</a></li>
								<li><a href="#"><i class="fa fa-star"></i> Wishlist</a></li>
								<li><a href="checkout.html"><i class="fa fa-crosshairs"></i>
										Checkout</a></li>
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
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.html" class="active">Home</a></li>
								<li class="dropdown"><a href="#">Shop<i
										class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="shop.html">Products</a></li>
										<li><a href="product-details.html">Product Details</a></li>
										<li><a href="checkout.html">Checkout</a></li>
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
							<input type="text" placeholder="Search" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-bottom-->
	</header>
	<!--/header-->

	<section>
		<div class="container">
		<TABLE cellSpacing=2 cellPadding=1 width="100%" align=center
										border=0>
										<TBODY>

											
											  <!--          
												IDishDAO disDAO = (IDishDAO) DAOFactory.newInstance("com.cugb.javaee.onlinefoodcourt.dao.IDishDAO");
												ArrayList<Dish> arr = disDAO.findDishs();
												 for (int i = 0; i < arr.size(); i++) {
													if(i % 2 == 0){
														out.println("<tr>");
													}
													Dish dish = arr.get(i);
													
													out.println("<td>");
													out.println("<table border=\"0\" cellpadding=\"2\" cellspacing=\"1\" height=\"100%\">");
													out.println("<tbody>");
													out.println("<tr>");
													out.println("<td height=\"90\" valign=\"top\" width=\"90\">");
													out.println("<a href=\"#\" target=\"_blank\">");
													out.println("<img alt=\"点击图片查看内容\" border=\"0\" height=\"80\" src=\""+dish.getImgURL()+"\" width=\"80\"/>");
													out.println("</a>");
													out.println("</td>");
													out.println("<td valign=\"top\">");
													out.println("<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" width=\"100%\">");
													out.println("<tbody>");
													out.println("<tr>");
													out.println("<td>");
													out.println("<a href=\"#\" target=\"_blank\">");
													out.println("<strong>");
													out.println(dish.getName());
													out.println("</strong>");
													out.println("</a>");
													out.println("</td>");
													out.println("</tr>");
													out.println("<tr>");
													out.println("<td height=\"21\">");
													out.println("<font color=\"#ff0000\">");
													out.println("现价：人民币"+String.valueOf(dish.getPrice())+"元");
													out.println("</font>");
													out.println("<br>");
													out.println("<a href=\"#\">");
													if(dish.getDescription().length() < 20){
														out.println(dish.getDescription());	
													}
													else{
														out.println(dish.getDescription().substring(0, 20)+"...");
													}
													out.println("</a>");
													out.println("</br>");
													out.println("</td>");
													out.println("</tr>");
													out.println("</tbody>");
													out.println("</table>");
													out.println("</td>");
													out.println("</tr>");
													out.println("<tr>");
													out.println("<td height=\"28\">");
													out.println("编号: "+String.valueOf(dish.getDishID())+"");
													out.println("</td>");
													out.println("<td>");
													out.println("<table border=\"0\" cellpadding=\"0\" cellspacing=\"1\" width=\"145\">");
													out.println("<tbody>");
													out.println("<tr>");
													out.println("<td align=\"middle\" width=\"70\">");
													out.println("<a href=\"#\">");
													out.println("<img border=\"0\" height=\"20\" longdesc=\"shoppingCart.html\" src=\"images/buy_cn.gif\" width=\"60\">");
													out.println("</img>");
													out.println("</a>");
													out.println("</td>");
													out.println("<td align=\"middle\" width=\"70\">");
													out.println("<a href=\"#\" target=\"_blank\">");
													out.println("<img border=\"0\" height=\"20\" src=\"images/detail_cn.gif\" width=\"60\"/>");
													out.println("</a>");
													out.println("</td>");
													out.println("</tr>");
													out.println("</tbody>");
													out.println("</table>");
													out.println("</td>");
													out.println("</tr>");
													out.println("</tbody>");
													out.println("</table>");
													out.println("</td>");

													if(i % 2 == 1){
														out.println("</tr>");
													}
												} 
											-->
							<c:forEach var="currentdish" items="${requestScope.dishlist}" varStatus="status" >								
								<c:if test="${status.index%2==0}">
								<tr>
								</c:if>
									<td>
										
											<TABLE height="100%" cellSpacing=1 cellPadding=2 border=0>
												<TBODY>
													<TR>
														<TD vAlign=top width=90 height=90>
															<A href=showdetail?dishid=${currentdish.getDishID()} target=_blank><IMG height=100 alt=点击图片查看内容
																	src= ${currentdish.getImgURL()} width=100 border=0 > </A>
																 
														</TD>
														<TD vAlign=top>
															<TABLE cellSpacing=1 cellPadding=0 width="100%"
																align=center border=0>
																<TBODY>
																	<TR>
																		<TD>
																			<A href=# target=_blank><STRONG>${currentdish.getName()}</STRONG> </A>
																		</TD>
																	</TR>
																	<TR>
																		<TD height=21>
																			<FONT color=#ff0000>现价：人民币${currentdish.getPrice()}元</FONT>
																			<BR>
																			${currentdish.getDescription()}
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
									<td  height="2">
										<div align="center">
											<font color="#000000">&nbsp;共&nbsp${param.totalpages}&nbsp页</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<font color="#000000">当前第</font>&nbsp
											<font color="#000000">${param.pageNO}</font>&nbsp
											<font color="#000000">页</font>
										</div>
									</td>
									<td  >
										<div align="left">
											<a name="btnTopPage"  id="btnTopPage" href="login?actiontype=pagelist&pageNO=1" title="首页">|&lt;&lt; </a>&nbsp;
											<a name="btnPreviousPage"  id="btnPreviousPage" href="login?actiontype=pagelist&pageNO=${requestScope.pageModel.prevPageNO}" title="上页"> &lt;  </a>&nbsp;
											<a name="btnNextPage"  id="btnNextPage" href="login?actiontype=pagelist&pageNO=${requestScope.pageModel.nextPageNO}" title="下页">  &gt; </a>&nbsp;
											<a name="btnBottomPage"  id="btnBottomPage" href="login?actiontype=pagelist&pageNO=${requestScope.pageModel.bottomPageNO}" title="尾页"> &gt;&gt;|</a>
											
										</div>
									</td>
								</tr>
										</TBODY>
									</TABLE>
								
			</div>
	</section>


	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>