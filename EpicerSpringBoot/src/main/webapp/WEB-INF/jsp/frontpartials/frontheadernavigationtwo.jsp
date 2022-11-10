<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style>
/*  .h3, h3 { */
/*     font-size: 24px; */
/*     margin-left: 40px; */
/* } */
 
 </style>
<!-- ******************  超級重要!!!!Navbar 2!!!! 首頁連動 ********************** --> 
<!-- ******************  超級重要!!!!Navbar 2!!!! 大家串聯在這********************** -->  
<!-- ******************  超級重要!!!!Navbar 2!!!! 最最後要討論串連的地方!!!! ********************** --> 
<!-- ******************  目前先做為大家查找相關html/jsp地方 ********************** -->    
    
<!-- Main Menu Section -->
<section class="menu">
	<nav class="navbar navigation">
		<div class="container">
			<div class="navbar-header">
				<h2 class="menu-title">主頁</h2>
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
					aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>

			</div><!-- / .navbar-header -->

			<!-- Navbar Links -->
			<div id="navbar" class="navbar-collapse collapse text-center">
				<ul class="nav navbar-nav">

					<!-- Home 首頁 -->
<!-- 					<li class="dropdown "> -->
<!-- 						<a href="index.html">HOME</a> -->
<!-- 					</li> -->
					<!-- / Home -->


					<!-- TEST -->
<!-- 					<li class="dropdown "> -->
<!-- 						<a href="http://localhost:8091/testbar">測試</a> -->
<!-- 					</li> -->
					<!-- / TEST -->
					
					
					<!-- Home 首頁 -->
					<li class="dropdown ">
						<h3 style=" margin-left: 40px;"><a href="homepage">首頁</a></h3>
					</li><!-- / Home -->
					

					<!-- ----- Recipe 食譜 (逢時) 各項分頁 ------- -->
					<li class="dropdown ">
						<h3 style=" margin-left: 40px;"><a href="${pageContext.request.contextPath}/recipe">食譜</a></h3>
					</li>
					<!-- / Recipe -->
					
					<!-- ----- Shop 商品 (Sunny) ------- -->
					<li class="dropdown ">
						<h3 style=" margin-left: 40px;"><a href="product">商品</a></h3>
					</li><!-- / Shop -->
					
					<!-- ----- Course 課程 (羿翔) ------- -->
					<li class="dropdown ">
						<h3 style=" margin-left: 40px;"><a href="555">課程</a></h3>
					</li>
					<!-- / Course -->
					
					<!-- ----- Forum 論壇 (昌鴻) ------- -->
					<li class="dropdown ">
						<h3 style=" margin-left: 40px;"><a href="formFirstFrontIndex">論壇</a></h3>
					</li><!-- / Forum -->
					
					<!-- ----- Cart 購物車(欣蓓) ------- -->
					<li class="dropdown dropdown-slide">
						<h3 style=" margin-left: 40px;"><a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
							role="button" aria-haspopup="true" aria-expanded="false">購物車<span
								class="tf-ion-ios-arrow-down"></span></a></h3>
						<div class="dropdown-menu">
							<div class="row">

								<!-- Basic -->
								<div class="col-lg-6 col-md-6 mb-sm-3">
									<ul>
										<li class="dropdown-header">商品</li>
										<li role="separator" class="divider"></li>
<!-- 										<li><a href="queryallproductmenu">搜全部商品</a></li> -->
										<li><a href="queryusercart">商品購物車</a></li>
										<li><a href="userorderqueryall">我的訂單</a></li>
										<li><a href="adminorderquery">管理員商品訂單</a></li>

									</ul>
								</div>

								<!-- Layout -->
								<div class="col-lg-6 col-md-6 mb-sm-3">
									<ul>
										<li class="dropdown-header">課程</li>
										<li role="separator" class="divider"></li>
<!-- 										<li><a href="queryallcoursemenu">搜全部課程</a></li> -->
<!-- 										<li><a href="http://localhost:8091/queryusercartcourse">課程購物車</a></li> -->
										<li><a href="usercoursequeryall">我的課程</a></li>
										<li><a href="admincoursequery">管理員課程訂單</a></li>

									</ul>
								</div>

							</div><!-- / .row -->
						</div><!-- / .dropdown-menu -->
					</li><!-- / Cart -->
					
					<!-- ----- Member center 會員中心(綜合) ------- -->
					<li class="dropdown dropdown-slide">
						<h3 style=" margin-left: 40px;"><a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
							role="button" aria-haspopup="true" aria-expanded="false">會員中心<span
								class="tf-ion-ios-arrow-down"></span></a></h3>
						<div class="dropdown-menu">
							<div class="row">

								<!-- Basic -->
								<div class="col-lg-6 col-md-6 mb-sm-3">
									<ul>
										<li class="dropdown-header">會員資料</li>
										<li role="separator" class="divider"></li>
<!-- 										<li><a href="dashboard.jsp">Dashboard</a></li> -->
<li>
										<form name=usermanagement method="post" action='${pageContext.request.contextPath}/usermanagement'>
										<a href="javascript:document.usermanagement.submit();">會員中心</a>
										</form>
										</li>
										<li><a href="HelloTeacher/221">我的課程</a></li>
										<li><a href="${pageContext.request.contextPath}/frontpartial">我的食譜</a></li>
										<li><a href="http://localhost:8091/forntForumAdd">發表文章</a></li>
										<li><a href="userorderqueryall">訂單專區</a></li>
<!-- 										<li><a href="confirmation.html">個人訂單維護</a></li> -->

									</ul>
								</div>

								<!-- Layout -->
								<div class="col-lg-6 col-md-6 mb-sm-3">
									<ul>
										<li class="dropdown-header">我的收藏</li>
										<li role="separator" class="divider"></li>
										<li><a href="userCollection/1002">食譜收藏</a></li>
										<li><a href="productLike">收藏商品</a></li>
<!-- 										<li><a href="shop-sidebar.html">收藏課程</a></li> -->
										<li><a href="http://localhost:8091/forumUser">收藏文章</a></li>

									</ul>
								</div>

							</div><!-- / .row -->
						</div><!-- / .dropdown-menu -->
					</li><!-- / Member center -->
					
					<!-- //////////////////以下為範本區 /////////////// -->

<!-- 					Shop 商品&購物分頁 -->
<!-- 					<li class="dropdown dropdown-slide"> -->
<!-- 						<a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" -->
<!-- 							role="button" aria-haspopup="true" aria-expanded="false">SHOP<span -->
<!-- 								class="tf-ion-ios-arrow-down"></span></a> -->
<!-- 						<div class="dropdown-menu"> -->
<!-- 							<div class="row"> -->

<!-- 								Basic -->
<!-- 								<div class="col-lg-6 col-md-6 mb-sm-3"> -->
<!-- 									<ul> -->
<!-- 										<li class="dropdown-header">Pages</li> -->
<!-- 										<li role="separator" class="divider"></li> -->
<!-- 										<li><a href="shop.html">Shop</a></li> -->
<!-- 										<li><a href="checkout.html">Checkout</a></li> -->
<!-- 										<li><a href="cart.html">Cart</a></li> -->
<!-- 										<li><a href="pricing.html">Pricing</a></li> -->
<!-- 										<li><a href="confirmation.html">Confirmation</a></li> -->

<!-- 									</ul> -->
<!-- 								</div> -->

<!-- 								Layout -->
<!-- 								<div class="col-lg-6 col-md-6 mb-sm-3"> -->
<!-- 									<ul> -->
<!-- 										<li class="dropdown-header">Layout</li> -->
<!-- 										<li role="separator" class="divider"></li> -->
<!-- 										<li><a href="product-single.html">Product Details</a></li> -->
<!-- 										<li><a href="shop-sidebar.html">Shop With Sidebar</a></li> -->

<!-- 									</ul> -->
<!-- 								</div> -->

<!-- 							</div>/ .row -->
<!-- 						</div>/ .dropdown-menu -->
<!-- 					</li>/ Shop -->


<!-- 					Pages 各項分頁 -->
<!-- 					<li class="dropdown full-width dropdown-slide"> -->
<!-- 						<a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" -->
<!-- 							role="button" aria-haspopup="true" aria-expanded="false">Pages <span -->
<!-- 								class="tf-ion-ios-arrow-down"></span></a> -->
<!-- 						<div class="dropdown-menu"> -->
<!-- 							<div class="row"> -->

<!-- 								Introduction -->
<!-- 								<div class="col-sm-3 col-xs-12"> -->
<!-- 									<ul> -->
<!-- 										<li class="dropdown-header">Introduction</li> -->
<!-- 										<li role="separator" class="divider"></li> -->
<!-- 										<li><a href="contact.html">Contact Us</a></li> -->
<!-- 										<li><a href="about.html">About Us</a></li> -->
<!-- 										<li><a href="404.html">404 Page</a></li> -->
<!-- 										<li><a href="coming-soon.html">Coming Soon</a></li> -->
<!-- 										<li><a href="faq.html">FAQ</a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->

<!-- 								Contact -->
<!-- 								<div class="col-sm-3 col-xs-12"> -->
<!-- 									<ul> -->
<!-- 										<li class="dropdown-header">Dashboard</li> -->
<!-- 										<li role="separator" class="divider"></li> -->
<!-- 										<li><a href="dashboard.html">User Interface</a></li> -->
<!-- 										<li><a href="order.html">Orders</a></li> -->
<!-- 										<li><a href="address.html">Address</a></li> -->
<!-- 										<li><a href="profile-details.html">Profile Details</a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->

<!-- 								Utility -->
<!-- 								<div class="col-sm-3 col-xs-12"> -->
<!-- 									<ul> -->
<!-- 										<li class="dropdown-header">Utility</li> -->
<!-- 										<li role="separator" class="divider"></li> -->
<!-- 										<li><a href="login.html">Login Page</a></li> -->
<!-- 										<li><a href="signin.html">Signin Page</a></li> -->
<!-- 										<li><a href="forget-password.html">Forget Password</a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->

<!-- 								Mega Menu -->
<!-- 								<div class="col-sm-3 col-xs-12"> -->
<!-- 									<a href="shop.html"> -->
<!-- 										<img class="img-responsive" src="./source/images/shop/header-img.jpg" alt="menu image" /> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div>/ .row -->
<!-- 						</div>/ .dropdown-menu -->
<!-- 					</li>/ Pages -->



<!-- 					Blog 文章頁面 -->
<!-- 					<li class="dropdown dropdown-slide"> -->
<!-- 						<a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" -->
<!-- 							role="button" aria-haspopup="true" aria-expanded="false">Blog <span -->
<!-- 								class="tf-ion-ios-arrow-down"></span></a> -->
<!-- 						<ul class="dropdown-menu"> -->
<!-- 							<li><a href="blog-left-sidebar.html">Blog Left Sidebar</a></li> -->
<!-- 							<li><a href="blog-right-sidebar.html">Blog Right Sidebar</a></li> -->
<!-- 							<li><a href="blog-full-width.html">Blog Full Width</a></li> -->
<!-- 							<li><a href="blog-grid.html">Blog 2 Columns</a></li> -->
<!-- 							<li><a href="blog-single.html">Blog Single</a></li> -->
<!-- 						</ul> -->
<!-- 					</li>/ Blog -->

<!-- 					Elements 元素區 -->
<!-- 					<li class="dropdown dropdown-slide"> -->
<!-- 						<a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" -->
<!-- 							role="button" aria-haspopup="true" aria-expanded="false">Elements <span -->
<!-- 								class="tf-ion-ios-arrow-down"></span></a> -->
<!-- 						<ul class="dropdown-menu"> -->
<!-- 							<li><a href="typography.html">Typography</a></li> -->
<!-- 							<li><a href="buttons.html">Buttons</a></li> -->
<!-- 							<li><a href="alerts.html">Alerts</a></li> -->
<!-- 						</ul> -->
<!-- 					</li>/ Elements -->
				</ul><!-- / .nav .navbar-nav -->

			</div>
			<!--/.navbar-collapse -->
		</div><!-- / .container -->
	</nav>
</section>