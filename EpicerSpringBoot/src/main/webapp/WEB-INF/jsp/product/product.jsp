<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.product.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////   商品顯示頁面 (多頁) ///////////// -->
<!-- ///////////////   可用在首頁(第三段) & 商品頁 ///////////// -->


<%
				List<Product> product = (List<Product>)request.getAttribute("findAll");
int i=0;
				for (Product pb : product) {
					
// 				List<ProductLike> likes = (List<ProductLike>)request.getAttribute("findAllLike");
// 				for (ProductLike like : likes) {
						
						
			
					
		%>

			<div class="col-md-3" height="350px">
				<div class="product-item" >
					<div class="product-thumb"  >
						<img class="img-responsive" src="<%=pb.getProductImage()%>" alt="product-img" />
						<div class="preview-meta">
							<ul>
								<li>
									<span  data-toggle="modal" data-target="#product-modal<%=pb.getProductId() %>">
										<i class="tf-ion-ios-search-strong"></i>
									</span>
								</li>
								
								<li >
			                        <a class="likes"  href="${pageContext.request.contextPath}/likeProduct?ProductId=<%=pb.getProductId() %>" >
			                        <input type="hidden" class="ProductId" name="ProductId" value="<%=pb.getProductId() %>">
			                        
			                        
<%-- 			                        <c:if test="${findAllLike.product.productId == ('10003') }"> --%>
<!-- 			                        <i class="tf-ion-ios-heart"></i> -->
<%-- 			                        </c:if> --%>
<%-- 						            <c:if test="${findAllLike.product.productId != ('findAll.productId') }"> --%>
<!-- 						            <i class="tf-ion-ios-heart-outline"></i> -->
<%-- 						            </c:if> --%>

<!-- 1 -->
<%-- <%  --%>
<%-- 				List<ProductLike> likes = (List<ProductLike>)request.getAttribute("findAllLike"); --%>
<%-- 				for (ProductLike like : likes) {             --%>
<%--  					%> --%>
			                        
<%-- 			                        <% 	if (like.getProduct().getProductId()  == (pb.getProductId()) ) {%> --%>
<!-- 					                <i class="tf-ion-ios-heart"></i> -->
<%-- 				                    <%} else { %> --%>
<!-- 				                    <i class="tf-ion-ios-heart-outline"></i> -->
<%-- 				                    <% } %> --%>
<%-- <%} %> --%>
<!-- 1 -->
                                       <div id="div<%=pb.getProductId() %>">
<%--                                        <i id="i<%=pb.getProductId() %>"/> --%>
<!-- 				                    空心 -->
			                        <i  class="tf-ion-ios-heart-outline"></i> 
<!-- 			                        實心 -->
<!-- 			                        <i class="tf-ion-ios-heart"></i> -->
                                    </div>

			                        </a>
								</li>
								<!-- ---- 主頁的 ---- -->	
								<li>
								
								<!-- ---- 1. 彈出框的加入購物車 ---- -->	
								<form action="addoneproducttocart" method="get">
								<input type="hidden" name="userId" value=1002> 
								<input type="hidden" name="productId" value="<%=pb.getProductId()%>"> 
								<input type="hidden" name="name" value="<%=pb.getProductName()%>">
								<input type="hidden" name="unit" value="<%=pb.getProductUnit()%>">
								<input type="hidden" name="price" value="<%=pb.getProductPrice()%>">
								<input type="hidden" name="stock" value="<%=pb.getProductStock()%>">
								<input type="hidden" name="quantity" value=1> 
								<input type="hidden" name="action" value="delete"> 
<!-- 								<a class="tf-ion-android-cart"><button class="tf-ion-android-cart"></button></a> -->
								<a href="addoneproducttocart?userId=1002&productId=<%=pb.getProductId()%>"><i class="tf-ion-android-cart"></i></a>
								<!-- <input ALIGN=center type="submit" value="加入購物車" name="delete"> -->
<!-- 								<i class="tf-ion-android-cart"><input type="submit" class="tf-ion-android-cart" name="加入購物車" value="cart"></input></i> -->
								</li>
							</ul>
                      	</div>
					</div>
					<div class="product-content">
						<h4><a href="productDetail?ProductId=<%=pb.getProductId()%>"><%=pb.getProductName()%></a></h4>
						<p class="price">$<%=pb.getProductPrice() %></p>
					</div>
				</div>
			</div>
	</form>		
			
			


		
		
		<!-- ////////////(商品跳出小視窗)(可用AJAX加入購物車)///////// -->
<!-- 		商品跳出小視窗 -->
		<!-- Modal  -->
<form action="addselectproducttocart" method="post">
<input type="hidden" name="userId" value=1002> 
<input type="hidden" name="productId" value="<%=pb.getProductId()%>"> 
<input type="hidden" name="name" value="<%=pb.getProductName()%>">
<input type="hidden" name="unit" value="<%=pb.getProductUnit()%>">
<input type="hidden" name="price" value="<%=pb.getProductPrice()%>">
<!-- <input type="hidden" name="quantity" value=1>  -->
		<div class="modal product-modal fade" id="product-modal<%=pb.getProductId()%>">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<i class="tf-ion-close"></i>
			</button>
		  	<div class="modal-dialog " role="document">
		    	<div class="modal-content">
			      	<div class="modal-body">
			        	<div class="row">
			        		<div class="col-md-8 col-sm-6 col-xs-12">
			        			<div class="modal-image">
				        			<img class="img-responsive" height="40" src="<%=pb.getProductImage()%>" alt="product-img" />
			        			</div>
			        		</div>
<!-- 			        			商品點入後搶先看部分 -->
			        		<div class="col-md-100 col-sm-6 col-xs-12">
			        			<div class="product-short-details">
			        				<h1 class="product-title"><%=pb.getProductName()%></h1>
			        				<p class="product-price">$<%=pb.getProductPrice()%></p>
			        				<p class="product-short-description">
			        					<%=pb.getProductDescription()%>
			        				</p>
			        				
			        				<br>
			        				<div >
						<h4>商品庫存 : <%=pb.getProductStock()%></h4>
						<ul>
							<li><h4></h4></li>
						</ul>
					</div>
										
					<div class="product-quantity">
						<span><h4>購買數量 : <input id="product-quantity" name="selectQuantity" type="number"  min="0" max="<%=pb.getProductStock()%>"></h4></span>
						<div class="product-quantity-slider">
							
						</div>
					</div>
			        				
<!-- 			        				<div class="product-quantity"> -->
<!-- 										<span>購買數量:</span> -->
<!-- 											<div class="product-quantity-slider"> -->
<!-- 												<input id="product-quantity" type="text" value="0" name="product-quantity"> -->
<!-- 											</div> -->
<!-- 										</div> -->
									<!-- ---- 2. 彈出框的加入購物車 ---- -->	
									
									
									<button class="btn btn-main">加入購物車</button>
<!-- 									<input type="submit" class="btn btn-main" > -->
<!-- 			        				<h5>加入購物車</h5></input> -->
			        				&ensp;
			        				<a href="productDetail?ProductId=<%=pb.getProductId()%>" class="btn btn-transparent"><h5>查看商品詳情</h5></a>
			        			</div>
			        		</div>
			        		
			        	</div>
			        </div>
		    	</div>
		  	</div>
		</div>
</form>	
		<!-- /.modal -->
		
		
		<%
// }			
			}
			%>