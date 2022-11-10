<%@page import="com.epicer.model.course.Course"%>
<%@page import="org.hibernate.engine.transaction.jta.platform.internal.OC4JJtaPlatform"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.cart.*, com.epicer.model.users.*"%>
<%@page import="java.math.BigDecimal"%>
<%@ page import="java.util.*,org.hibernate.Session, org.hibernate.SessionFactory"%>
<%@page import="com.epicer.model.*"%>
<%@page import="com.epicer.util.*"%>
<%@page import="java.util.*"%>  

<!-- ////// 訂單明細確認畫面  /////// -->

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp"%>
</head>
<body id="body">


	<!-- 主文內容 開始 -->
	<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，
大家串聯在這，最最後要討論串連的地方///// -->
	<%@include file="../frontpartials/frontheadernavigation.jsp"%>
	<%@include file="../frontpartials/frontheadernavigationtwo.jsp"%>


	<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
	<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
		<jsp:param name="title" value="課程報名系統" />
		<jsp:param name="pagination" value="完成報名" />
	</jsp:include>
<form action="courseinfotoecpay" method="POST">
	<div class="page-wrapper">
		<div class="purchase-confirmation shopping">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<div class="block ">
							<div class="purchase-confirmation-details">
								<%
								Tools tools = new Tools();
														EpicerUser u = (EpicerUser) request.getAttribute("queryuser");
														OrderCoursecart  oc = (OrderCoursecart) request.getAttribute("orderCourseBean");
														System.out.println(oc);
														Course c = (Course) request.getAttribute("getcoursebean");
								// 								List<CartOfCourse> listCart = (List<CartOfCourse>) request.getAttribute("queryById");
														session.getAttribute("userId");
								%>
								
								<table id="purchase-receipt" class="table">
									<thead>
										<tr>
											<th><strong>訂單編號:</strong></th>
											<th><%=oc.getOrderCourseId()%></th>
										</tr>
									</thead>

									<tbody>

										<tr>
											<td><strong>課程名稱:</strong></td>
											<td><%=c.getCourseName()%></td>
										</tr>
										<tr>
											<td><strong>上課日期:</strong></td>
											<td><%=tools.getStringDateTime(c.getCourseDate())%></td>
										</tr>
										<tr>
											<td><strong>授課教師:</strong></td>
											<td><%=c.getTeacher().getTeacherName()%></td>
										</tr>
										<tr>
											<td><strong>課程費用:</strong></td>
											<td><%=c.getCoursePrice()%></td>
										</tr>
										<tr>
											<td class=""><strong>學員姓名:</strong></td>
											<td class=""><%=oc.getOrdername()%></td>
										</tr>


										<tr>
											<td><strong>學員電話:</strong></td>
											<td><%=oc.getOrderphone()%></td>
										</tr>
										<tr>
											<td><strong>學員地址:</strong></td>
											<td><%=oc.getOrderaddress()%></td>
										</tr>
										<tr>
											<td><strong>學員電子信箱：</strong></td>
											<td><%=oc.getOrderemail()%></td>
										</tr>

									</tbody>
								</table>
								<input type = "hidden" name="orderCourseId" value="<%=oc.getOrderCourseId()%>">
<%-- 								<input type = "hidden" name="courseDate" value="<%=c.getCourseDate()%>"> --%>
<%-- 								<input type = "hidden" name="courseName" value="<%=c.getCourseName()%>"> --%>
<%-- 								<input type = "hidden" name="teacherName" value="<%=c.getTeacher().getTeacherName()%>"> --%>
								<div>
									<button class="btn btn-main mt-20 pull-right">進行付款</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>





	<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
	<%@include file="../frontpartials/footer.jsp"%>
	<!-- 主文內容 結束 -->

	<!-- //////**極重要!!!!不可少//////<script>//////// -->
	<%@include file="../frontpartials/frontscripttobodyend.jsp"%>
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