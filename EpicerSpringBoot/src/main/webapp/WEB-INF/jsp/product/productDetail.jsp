<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.product.*"%>
<%@page import="java.util.List"%>
    
<!-- //////   單頁商品內容畫面  ////// -->

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
<style>
.col-md-5 {
 padding-left:80px;
}
.col-md-7{
 padding-left:100px;
}
/* 下面商品細節的調整 */
.col-xs-12 {
    width: 90%;
    float: right;
}

.single-product-details .product-category {
    margin-top: 0;
}
.single-product-details .product-quantity {
    margin-top: 0;
}
/* 調整單位的長度 */
.single-product-details .product-category ul {
    width: 400px;
    display: inline-block;
}
/* 相關推播商品及文章之間的距離 */
/* .section { */
/*      padding:  0;  */
/* } */

.single-product {
     padding: 0; 
}

.title {
    padding: 10px 0 4px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

window.onload=function(){
		$.ajax({
			url: 'findAllLike' ,
			dataType: 'json',
			success: function (data) {
				 console.log(data);
				 var productLike ="";
				 var id="";
				 aaa = "<i  class='tf-ion-ios-heart'></i>";
				 bbb = "<i  class='tf-ion-ios-heart-outline'></i>"
				 
				 var all = data.length;  
				   $('.ProductId').each(function(){
					   id=Number($(this).val());
					   var x=data.indexOf(id);
					   $('#div'+id).empty("");
					   if(x > -1){
						 $('#div'+id).html(aaa);  
					   }else{
						   $('#div'+id).html(bbb);   
					   }
				   });
			}
		})
}





</script>


</head>
<body id="body">
<% session.setAttribute("userId", 1002); %>

<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，
大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>





<%
				Product pb = (Product)request.getAttribute("findDetail");
				
		%>

<section class="single-product">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<ol class="breadcrumb">
					<li><a href="homepage">首頁</a></li>
					<li><a href="product">商品</a></li>
					<li class="active"><%=pb.getProductName()%></li>
				</ol>
			</div>
			
<!-- 			<div class="col-md-6"> -->
<!-- 				<ol class="product-pagination text-right"> -->
<!-- 					<li><a href="blog-left-sidebar.html"><i class="tf-ion-ios-arrow-left"></i> Next </a></li> -->
<!-- 					<li><a href="blog-left-sidebar.html">Preview <i class="tf-ion-ios-arrow-right"></i></a></li> -->
<!-- 				</ol> -->
<!-- 			</div> -->
			
		</div>
		<div class="row mt-20">
			<div class="col-md-5" >
				<div class="single-product-slider">
					<div id='carousel-custom' class='carousel slide' data-ride='carousel'>
<!-- 						<div class='carousel-outer'> -->
							<!-- me art lab slider -->
<!-- 							<div class='carousel-inner '> -->
<!-- 								<div class='item active'> -->
									<img  width="450" src='<%=pb.getProductImage()%>' alt='' data-zoom-image="<%=pb.getProductImage()%>" />
<!-- 								</div> -->
<!-- 								<div class='item'> -->
<!-- 									<img src='./source/images/shop/single-products/product-2.jpg' alt='' data-zoom-image="images/shop/single-products/product-2.jpg" /> -->
<!-- 								</div> -->
								
<!-- 								<div class='item'> -->
<!-- 									<img src='./source/images/shop/single-products/product-3.jpg' alt='' data-zoom-image="images/shop/single-products/product-3.jpg" /> -->
<!-- 								</div> -->
<!-- 								<div class='item'> -->
<!-- 									<img src='./source/images/shop/single-products/product-4.jpg' alt='' data-zoom-image="images/shop/single-products/product-4.jpg" /> -->
<!-- 								</div> -->
<!-- 								<div class='item'> -->
<!-- 									<img src='./source/images/shop/single-products/product-5.jpg' alt='' data-zoom-image="images/shop/single-products/product-5.jpg" /> -->
<!-- 								</div> -->
<!-- 								<div class='item'> -->
<!-- 									<img src='./source/images/shop/single-products/product-6.jpg' alt='' data-zoom-image="images/shop/single-products/product-6.jpg" /> -->
<!-- 								</div> -->
								
<!-- 							</div> -->
							
<!-- 							sag sol -->
<!-- 							<a class='left carousel-control' href='#carousel-custom' data-slide='prev'> -->
<!-- 								<i class="tf-ion-ios-arrow-left"></i> -->
<!-- 							</a> -->
<!-- 							<a class='right carousel-control' href='#carousel-custom' data-slide='next'> -->
<!-- 								<i class="tf-ion-ios-arrow-right"></i> -->
<!-- 							</a> -->
<!-- 						</div> -->
						
						<!-- thumb -->
<!-- 						<ol class='carousel-indicators mCustomScrollbar meartlab'> -->
<!-- 							<li data-target='#carousel-custom' data-slide-to='0' class='active'> -->
<!-- 								<img src='./source/images/shop/single-products/product-1.jpg' alt='' /> -->
<!-- 							</li> -->
<!-- 							<li data-target='#carousel-custom' data-slide-to='1'> -->
<!-- 								<img src='./source/images/shop/single-products/product-2.jpg' alt='' /> -->
<!-- 							</li> -->
<!-- 							<li data-target='#carousel-custom' data-slide-to='2'> -->
<!-- 								<img src='./source/images/shop/single-products/product-3.jpg' alt='' /> -->
<!-- 							</li> -->
<!-- 							<li data-target='#carousel-custom' data-slide-to='3'> -->
<!-- 								<img src='./source/images/shop/single-products/product-4.jpg' alt='' /> -->
<!-- 							</li> -->
<!-- 							<li data-target='#carousel-custom' data-slide-to='4'> -->
<!-- 								<img src='./source/images/shop/single-products/product-5.jpg' alt='' /> -->
<!-- 							</li> -->
<!-- 							<li data-target='#carousel-custom' data-slide-to='5'> -->
<!-- 								<img src='./source/images/shop/single-products/product-6.jpg' alt='' /> -->
<!-- 							</li> -->
<!-- 							<li data-target='#carousel-custom' data-slide-to='6'> -->
<!-- 								<img src='./source/images/shop/single-products/product-7.jpg' alt='' /> -->
<!-- 							</li> -->
<!-- 						</ol> -->
						
					</div>
				</div>
			</div>
			<div class="col-md-7" >
				<div class="single-product-details">
				<div class="product-quantity">
					<h2><%=pb.getProductName()%></h2>
					&emsp;&emsp;&emsp;
					<h1>
			                        <a class="likes"  href="likeProduct2?ProductId=<%=pb.getProductId() %>" >
			                        <input type="hidden" class="ProductId" name="ProductId" value="<%=pb.getProductId() %>">
			                        <span id="div<%=pb.getProductId() %>">
			                        <i  class="tf-ion-ios-heart-outline"></i> 
			                         </span>
			                        </a>
								</h1>    
								
<!-- 								找收藏總數 -->
<!-- &emsp; -->
								<h5>
			                        <span >
			                        有 ${likes }個人喜歡
			                         </span>
								</h5>
								
								
				</div>
					<p class="product-price"><h3>$<%=pb.getProductPrice()%></h3></p>
					<p class="product-description mt-20">
					<%=pb.getProductDescription()%>
					</p>
					
					<div class="product-category">
						<span><h5>單位:</h5></span>
						<ul>
							<li><h4><%=pb.getProductUnit() %></h4></li>
						</ul>
					</div>
					<div class="product-category">
						<span><h5>產地:</h5></span>
						<ul>
							<li><h4><%=pb.getProductOrigin() %></h4></li>
						</ul>
					</div>
					<div class="product-category">
						<span><h5>商品庫存:</h5></span>
						<ul>
							<li><h4><%=pb.getProductStock()%></h4></li>
						</ul>
					</div>
			<form action="addselectproducttocartforonepg" method="get">
					<input type="hidden" name="userId" value=1002> 
					<input type="hidden" name="productId" value="<%=pb.getProductId()%>"> 
					<input type="hidden" name="name" value="<%=pb.getProductName()%>">
					<input type="hidden" name="unit" value="<%=pb.getProductUnit()%>">
					<input type="hidden" name="price" value="<%=pb.getProductPrice()%>">
										
					<div class="product-quantity">
						<span><h5>購買數量:</h5></span>
						<div class="product-quantity-slider">
							<h5><input id="product-quantity" name="selectQuantity" type="number"  min="0" max="<%=pb.getProductStock()%>"></h5>
						</div>
					</div>
					<div>
					<button class="btn btn-main">加入購物車</button>
					</div>           
				</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="tabCommon mt-20">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#details" aria-expanded="true">詳情</a></li>
						<li class=""><a data-toggle="tab" href="#reviews" aria-expanded="false">退換貨須知</a></li>
					</ul>
					<div class="tab-content patternbg">
						<div id="details" class="tab-pane fade active in">
							<h4>商品細節</h4>
							<p>
							<%=pb.getProductDetails() %>
							</p>
						</div>
						
						<div id="reviews" class="tab-pane fade">
							<div class="post-comments">
						    	<ul class="media-list comments-list m-bot-50 clearlist">
								    <!-- Comment Item start-->
								    <li class="media">

								        

								        <div class="media-body">
								            <div class="comment-info">
								                    <h4><a href="#!">退換貨須知：</a></h4>
								            </div>

								            <p>
								            商品到貨享十天猶豫期之權益（注意！猶豫期非試用期），辦理退貨商品必須是全新狀態且包裝完整，商品一經拆封，等同商品價值已受損，僅能以福利品出售，若需退換貨，我方須收取價值損失之費用(回復原狀、整新費)，請先確認商品正確、外觀可接受，再行開機/使用，以免影響您的權利，祝您購物順心。
								            
出貨已全程攝影，為保障您購物權益，開箱過程請全程錄影；如有問題請反映客服並提供錄影檔案，祝您購物愉快。

								            </p>
								        </div>

								    </li>
								    <!-- End Comment Item -->

								    <!-- Comment Item start-->
								    <li class="media">

								        <a class="pull-left" href="#!">
								        </a>

								        <div class="media-body">

								            <div class="comment-info">
								                   <h4> <a href="#!">運送服務：</a></h4>
								            </div>

								            <p>
								            此商品可配送離島區域，您可於結帳時，選擇離島地址配送。
商品之實際配貨日期、退換貨日期，依我們向您另行通知之內容為準。
依照客戶指定配送之商品(約配商品)接獲訂單逾30日您未通知出貨及受領商品，為了保障您的權益，本公司得取消訂單，請客戶重新下單購買。
								            </p>

								        </div>

								    </li>
								    <!-- End Comment Item -->


								    <!-- Comment Item start-->
								    <li class="media">

								        <a class="pull-left" href="#!">
								        </a>

								        <div class="media-body">

								                   <h4> <a href="#!">售後服務：</a></h4>

								            <p>
								            如您收到商品，請依正常程序儘速檢查商品，若商品發生新品瑕疵之情形，您可申請更換新品或退貨，請直接點選聯絡我們。
若您對於購買流程、付款方式、退貨及商品運送方式有疑問，你可直接點選會員中心。
								            </p>
								        </div>
								    </li>
								    
								    
								    
								    <li class="media">

								        <a class="pull-left" href="#!">
								        </a>

								        <div class="media-body">

								                    <h4><a href="#!">特別說明：</a></h4>

								            <p>
								            本公司收到您下單(要約)後，仍需確認交易條件正確、供貨商品有庫存或服務可提供。如有無法接受訂單之異常情形，或您下單後未能完成正常付款，應視為訂單(買賣契約)全部自始不成立或失效，本公司得於合理期間內通知說明拒絕接受訂單。請您重新依需求下單訂購。
								            </p>

								        </div>

								    </li>
							</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<!-- /////// 相關商品推播 ///// -->
<%-- <%@include file="../product/relatedproducts.jsp" %> --%>
<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>
<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

<script>
 $(function(){
	 
	 $.ajax({
		  type:"POST", //請求方式
		  url:'/vertifyaccount22', //請求連結
		  contentType:'application/json', //請求格式
		//  data:JSON.stringify(account), //data =傳遞的資料，用JSON.strigify();將物件轉為JSON格式
		  success:function(data){
		     console.log(data)
		     if(data.result =='N'){
		    	 $('#useravatar').attr("src","images/user_icon.png")
		    	 var content='<li><a href="form">註冊</a></li>'
		    		 +'<li><a href="login">登入</a></li>'
		    		 
		    		//'<li><a href="admin/checkadminstatus2">管理者</a></li>';
		    		//+'<li><form action="users/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員</a></form></li>';
		    	  $('#userselect').append(content)
		   		
		   		}else if(data.result =='U' ){
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		  
		   		       var content=
		   		    	'<li><form action="users/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員中心</a></form></li>'
		   		              +'<li><a href="/all/logout">登出</a></li>';
		   		              
		   		              
		    	  $('#userselect').append(content)
			   		
		   		}else if(data.result =='A'){
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		 var content=
		   			'<li><form action="admin/checkadminstatus2" method="post" name="form3"><a href="javascript:document.form3.submit();">管理系統</a></form></li>'
		   		   +'<li><a href="/all/logout">登出</a></li>';
		    	 
		    	  $('#userselect').append(content)
		   			
		   		}else{
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		  var content=
		   			 '<li><form action="/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員中心</a></form></li>'
		   		      +'<li><a href="/all/logout">登出</a></li>';
		    	 
		    	  $('#userselect').append(content)
		   		}
		     },//success
		    error:function(err){console.log(err)},
		  });//ajax
	 
	 
	 
	 
 })
 
 </script>


</body>
</html>