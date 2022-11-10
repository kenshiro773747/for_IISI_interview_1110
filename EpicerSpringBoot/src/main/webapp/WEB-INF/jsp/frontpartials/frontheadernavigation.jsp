<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.cart.*"%>
<%@page import="java.math.BigDecimal"%>
<%@ page import="java.util.*,org.hibernate.Session, org.hibernate.SessionFactory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- ******************  超級重要!!!!Navbar!!!! 聯絡電話 ********************** --> 
<!-- ******************  超級重要!!!!Navbar!!!! 購物車 scroll********************** -->  
<!-- ******************  超級重要!!!!Navbar!!!! 商品搜尋 ********************** -->     

<!-- Start Top Header Bar -->
<section class="top-header">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-xs-12 col-sm-4">
				<div class="contact-number">
					<i class="tf-ion-ios-telephone"></i>
					<span>02 6631 6588</span>
				</div>
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
			
				<!-- Site Logo -->
				<div class="logo text-center">
					<a href="http://localhost:8091/homepage">
						<!-- replace logo here 重放專案logo(待改) -->
						<img width="150px" class="logo" src="./source/images/epicerlogowhite.jpg" alt="logo" />
					</a>
<!-- 					http://www.w3.org/2000/svg -->
				</div>
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
			
				<!-- Cart -->
				
				<ul class="top-menu text-right list-inline">
					<li class="dropdown cart-nav dropdown-slide">	
						<a href="queryusercart"><i
								class="tf-ion-android-cart"></i>購物車</a>
<!-- 						<div class="dropdown-menu cart-dropdown"> -->
						
<!-- 						Cart Item -->
<!-- 							<div class="media"> -->
<!-- 								<a class="pull-left" href="#!"> -->
<!-- 									<img class="media-object" src="./source/images/shop/cart/cart-2.jpg" alt="image" /> -->
<!-- 								</a> -->
<!-- 								<div class="media-body"> -->
<!-- 									<h4 class="media-heading"><a href="#!">Ladies Bag</a></h4> -->
<!-- 									<div class="cart-price"> -->
<!-- 										<span>1 x</span> -->
<!-- 										<span>1250.00</span> -->
<!-- 									</div> -->
<!-- 									<h5><strong>$1200</strong></h5> -->
<!-- 								</div> -->
<!-- 								<a href="#!" class="remove"><i class="tf-ion-close"></i></a> -->
<!-- 							</div>/ Cart Item -->
						
							<!-- Cart Item (購物車添增商品連動) -->
<!-- 				<form name="Form" action="queryById" method="get"> -->
<%-- 				<% --%>
<!--  					List<CartOfProduct> headCart = (List<CartOfProduct>) request.getAttribute("queryById"); -->
<!--  					session.getAttribute("userId"); -->
<!--  					for (CartOfProduct c : headCart) { -->
<%-- 				%>  --%>
<!-- 							<div class="media"> -->
<!-- 								<a class="pull-left" href="#!"> -->
<%-- 									<img class="media-object" src="<%=c.getCartProduct().getProductImage()%>" alt="image" /> --%>
<!-- 								</a> -->
<!-- 								<div class="media-body"> -->
<%-- 									<h4 class="media-heading"><a href="#!"><%=c.getCartProduct().getProductName()%></a></h4> --%>
<!-- 									<div class="cart-price"> -->
<%-- 										<span><%=c.getQuantity()%> x <%=c.getCartProduct().getProductPrice() %></span> --%>
<!-- 									</div> -->
<%-- 									<h5><strong>$<%=c.getCartProduct().getProductPrice() * c.getQuantity()%></strong></h5> --%>
<!-- 								</div> -->
<!-- 								<a href="#!" class="remove"><i class="tf-ion-close"></i></a> -->
<!-- 							</div> -->
<%-- 							 <% --%>
<!--  								} -->
<%-- 								%> --%>
<!-- 							/ Cart Item -->
							

<!-- 							<div class="cart-summary"> -->
<!-- 								<span>Total</span> -->
<%-- 								<span class="total-price">$ ${tPrice} </span> --%>
<!-- 							</div> -->
<!-- 							<ul class="text-center cart-buttons"> -->
<!-- 								<li><a href="queryusercart" class="btn btn-small">進入購物車</a></li> -->
<!-- 								<li><a href="ordercheck" class="btn btn-small btn-solid-border">結帳</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->

					</li>
					
					<!-- / Cart 購物車結束 -->

					<!-- Search 搜尋 -->
<!-- 					<li class="dropdown search dropdown-slide"> -->
<!-- 						<a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><i -->
<!-- 								class="tf-ion-ios-search-strong"></i> Search</a> -->
<!-- 						<ul class="dropdown-menu search-dropdown"> -->
<!-- 							<li> -->
<!-- 								<form action="post"><input type="search" class="form-control" placeholder="Search..."></form> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</li> -->
					<!-- / Search -->

							<!-- Languages 語文 -->
						<a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
							role="button" aria-haspopup="true" aria-expanded="false"><img id="useravatar" style="width:50px;height:50px; border-radius: 50%;"><span
								class="tf-ion-ios-arrow-down"></span></a>
						<ul  class="dropdown-menu search-dropdown" id="userselect">
						</ul>
					

				</ul><!-- / .nav .navbar-nav .navbar-right -->
			</div>
		</div>
	</div>
</section><!-- End Top Header Bar -->


