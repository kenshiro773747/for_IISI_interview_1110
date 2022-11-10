<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.cart.*"%>
<%@page import="com.epicer.util.*"%>
<%@page import="java.util.*"%>

<!-- ////// 會員中心--我的訂單  //////// -->
    
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>

</head>
<body id="body">

<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，
大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>

<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="會員中心" />
<jsp:param name="pagination" value="個人管理" />
</jsp:include>

<section class="user-dashboard page-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			      <!-- ///// ↓這邊url最後都要再重新整理過!!!!(因為active位置不同,無法拆寫jsp QQ) -->
				<ul class="list-inline dashboard-menu text-center">
					<li><a href="userorderqueryall">我的訂單</a></li>
					<li><a class="active" href="usercoursequeryall">我的課程</a></li>
				 <li><form name="usermanagementt" method="post" action='${pageContext.request.contextPath}/usermanagement'><a href="javascript:document.usermanagementt.submit();">個人資料維護</a></form></li>
<!-- 					<li><a href="order.jsp">Order(訂單/課程)</a></li> -->
<!-- 					<li><a href="address.jsp">Address(文章管理/收藏/食譜)</a></li> -->
<!-- 					<li><a href="profiledetails.jsp">個人資料維護</a></li> -->
				</ul>
				<div class="dashboard-wrapper user-dashboard">
					<div class="table-responsive">
						<table class="table">
							<thead>
<!-- 							<colgroup> -->
<!-- 								<col width="8%"> -->
<!-- 								<col width="30%"> -->
<!-- 								<col width="8%"> -->
<!-- 								<col width="10%"> -->
<!-- 								<col width="4%"> -->
<!-- 								<col width="5%"> -->
<!-- 								<col width="5%"> -->
<!-- 								<col width="10%"> -->
<!-- 							</colgroup> -->
								<tr>
									<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;課程報名編號</th>
									<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;課程名稱</th>
									<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上課日期</th>
									<th>授課老師</th>
									
<!-- 									<th>付款方式</th> -->
									<th>開課狀態</th>
									<th>金額</th>
									<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;訂單狀態</th>
									<th></th>
									
								</tr>
							</thead>
							<%
							TimeTest timeTest = new TimeTest();
							Tools tools = new Tools();
							request.setAttribute("userId", 1002);
							List<OrderCoursecart> userCourse = (List<OrderCoursecart>) request.getAttribute("usercourse");
// 							List<OrderProductDetails> orderDetails = (List<OrderProductDetails>) request.getAttribute("allorderdetails");
							for (OrderCoursecart oc : userCourse) {
								
							%>
							<tbody>
								<tr>
									<td>EpicerCourse<%=oc.getOrderCourseId()%></td>
<%-- 									<td><%=oc.getCourseid().%></td> --%>
									
<%-- 									<td><%= tools.getStringDateTime(oc.getOrderdate())%></td> --%>
									<td><%=oc.getCourseName() %></td>
									<td><%=tools.getStringDateTime(oc.getCourseDate()) %></td>
									<td><%=oc.getTeacherName() %></td>
<%-- 									<td><%=oc.getPaymentType()%></td> --%>
									<!-- ----開課狀態---- -->
									<td>
									<% 
									Long today = timeTest.getTime();
									boolean startclass = oc.getCourseDate()> today;
									if(startclass == true ){%>
									<span class="label label-info"><%out.println("未上課");%></span>
									<%}else{ %>	
									<span class="label label-default"><%out.println("已結束");%></span>
									<%} %>
									</td>
									<td><%=oc.getTotalprice()%></td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<!-- ----付款狀態---- -->
									<% if(oc.getPaystatus().equals("未付款")){%>
									<span class="label label-warning"><%out.println("未付款");%></span>
									<%}else if(oc.getPaystatus().equals("已付款")){%>
									<span class="label label-primary"><%out.println("已付款");%></span>
									<%}else if(oc.getPaystatus().equals("取消報名")){%>
									<span class="label label-danger"><%out.println("已取消");%></span>
									<%}else{ %>
									<span class="label label-default"><%out.println("無法辨識");%></span>
									<%} %>
									</td>
									<td>
									<!-- ------  查詢明細 ----- -->
									<button type="button" class="btn btn-default btn-small"  data-toggle="modal" data-target="#exampleModal<%=oc.getOrderCourseId()%>" data-whatever="#">&nbsp;明細</button>
									<div class="modal fade" id="exampleModal<%=oc.getOrderCourseId()%>" tabindex="-1" aria-labelledby="orderList" aria-hidden="true">
									  <div class="modal-dialog" role="document">
									    <div class="modal-content">
									    
									      <div class="modal-header">
									        <h5 class="modal-title" id="orderList" style="margin: 0 center">訂單明細</h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									      </div>
									      <div class="modal-body">
									          <div class="form-group">
									          	<label for="merchant-trade-no" class="control-label">課程報名編號：</label>EpicerCourse<%=oc.getOrderCourseId()%> <br>
									            <label for="order-name" class="control-label">報名日期：</label><%=tools.getStringDateTime(oc.getOrderdate())%><br>
									            
									            
									           <label for="order-payment" class="control-label">付款方式：</label><%=oc.getPaymentType() %><br>
									            <label for="order-name" class="control-label">學員姓名：</label><%=oc.getOrdername()%> <br>
									            <label for="order-phone" class="control-label">學員電話：</label><%=oc.getOrderphone()%><br>
									            <label for="order-address" class="control-label">學員地址：</label><%=oc.getOrderaddress()%><br>
									            <label for="order-quantity" class="control-label">報名人數：</label><%=oc.getTotalquantity()%> 位<br>
									            <label for="order-email" class="control-label">電子信箱：</label><%=oc.getOrderemail()%><br>
									             <!--  如果有"取消報名"才有取消原因 -->
											    <% if(oc.getPaystatus().equals("取消報名")){%>
											    <hr>
											    <label for="order-details" class="control-label">報名已取消 (╥﹏╥) 原因：</label><%=oc.getCancelNote()%><br>
												<%}else{%>
												<%}%>
									      </div>
									      
									      <div class="modal-footer">
									        <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
						<!-- 			        <button type="button" class="btn btn-primary">Send message</button> -->
									      </div>
									      </div>
									    </div>
									  </div>
									</div>
									
									</td>
									<td>
									<!-- ------  取消訂單(開課一天前才可以取消) ----- -->
									<!-- ------  24小時(h) = 86400000毫秒(ms) -->
									<!-- ------- 要寫取消原因(可加sweetalert) ------- -->
									<% 
									Long time = oc.getCourseDate() - oc.getOrderdate();
 									if(time>86400000){
 										if(oc.getPaystatus().equals("未付款")||oc.getPaystatus().equals("已付款")){
 									%> 
									<button type="button" class="btn btn-default btn-small" style="background-color:#AD5A5A" data-toggle="modal" data-target="#exampleModal2<%=oc.getOrderCourseId()%>" data-whatever="#">取消報名</button>
									<div class="modal fade" id="exampleModal2<%=oc.getOrderCourseId()%>" tabindex="-1" aria-labelledby="orderCancel" aria-hidden="true">
									  <div class="modal-dialog" role="document">
									    <div class="modal-content">
									    
									      <div class="modal-header">
									        <h5 class="modal-title" id="orderCancel" style="margin: 0 center">取消報名</h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									      </div>
									      <div class="modal-body">
									      <form action="usercancel" method="POST">
									      <input type = "hidden" name="orderCourseId" value="<%=oc.getOrderCourseId()%>">
									      
									          <div class="form-group">
									          	<label for="MerchantTradeNo" class="control-label">訂單編號：</label>EpicerCourse<%=oc.getOrderCourseId()%><br>
									            <label for="returnNote" class="control-label">取消原因：</label>
									            <input type="text" class="form-control" id="cancelNote" name="cancelNote" placeholder="" required>
									           
									      	 </div>
									      
									      <div class="modal-footer">
<!-- 									        <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button> -->

									        <button class="btn btn-primary">確認取消</button>
									      </div>
									      </form>
									      </div>
									    </div>
									  </div>
									</div>
									<%}} %>
									<!-- ------  付款("未付款"才可以觸發) ----- -->
 									<form action="courseinfotoecpay" method="POST">
									<% 
 									if(oc.getPaystatus().equals("未付款") ){
 									%>
 									<input type = "hidden" name="orderCourseId" value="<%=oc.getOrderCourseId()%>">
									<button type="submit" class="btn btn btn-small" style="background-color:#FFA042"><i class="fa-regular fa-hand-point-right"></i>&nbsp;&nbsp;&nbsp;付款</button>
									<% }%>
									
 									</form> 
									
									<!-- ------------------------------------- -->
<%-- 									<% if(uo.getShipment().equals("未出貨")){  --%>
<%--  									if(uo.getPayStatus().equals("已付款") ||uo.getPayStatus().equals("未付款") ){%>  --%>
<%-- 									<a href="http://localhost:8091/userreturn/{<%=uo.getOrderProductId()%>}" class="btn btn-main btn-small"><%out.println("取消訂單");%></a> --%>
<%-- 									<%}} %> --%>
									</td>
								</tr>
								<%} %>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>
<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

<script src="js/jquery-3.6.0.js"></script>
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
		    	 var content=
		    		'<li><a href="admin/checkadminstatus2">管理者</a></li>'
		    		+'<li><form action="users/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員</a></form></li>';
		    	  $('#userselect').append(content)
		   		}else if(data.result =='U' || data.result =='A'){
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		  var content='<li><form action="checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員中心</a></form></li>'
		   		             +'<li><a href="/all/logout">登出</a></li>';
		    	  $('#userselect').append(content)
			   		
		   		}else{
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		   var content='<li><form action="users/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員中心</a></form></li>'
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