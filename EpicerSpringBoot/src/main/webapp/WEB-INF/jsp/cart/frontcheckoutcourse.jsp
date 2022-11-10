
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.epicer.model.cart.*, com.epicer.model.users.*"%>
<%@page import="java.math.BigDecimal"%>
<%@ page import="java.util.*,org.hibernate.Session, org.hibernate.SessionFactory"%>
<%@page import="com.epicer.model.*"%>
<%@page import="com.epicer.util.*"%>
<%@page import="java.util.*"%>    

<!-- ////// 訂購畫面(訂購資訊)  /////// -->

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
<jsp:param name="title" value="課程報名系統" />
<jsp:param name="pagination" value="個人報名資料與開課資訊" />
</jsp:include>

<form name="Form" action="orderinsertstudent" method="POST">
<%	
		Tools tools = new Tools();
		EpicerUser u = (EpicerUser) request.getAttribute("queryuser");
		List<CartOfCourse> listCart = (List<CartOfCourse>) request.getAttribute("queryById");
		Integer orderCId = (Integer) request.getAttribute("orderCourseId");
		session.getAttribute("orderCourseId");
		session.getAttribute("userId");
		
%>
<!-- ----- 會員填寫資料往後傳 ----- -->
		<input type = "hidden" name="userId" value="<%=u.getId() %>">
<%-- 		<input type = "hidden" name="userName" value="<%=u.getName() %>"> --%>
<%-- 		<input type = "hidden" name="userPhone" value="<%=u.getPhone() %>"> --%>
<%-- 		<input type = "hidden" name="userAddress" value="<%=u.getCity() + u.getTownship() + u.getAddress()%> "> --%>
<%-- 		<input type = "hidden" name="userEmail" value="<%=u.getAccount() %>"> --%>


<div class="page-wrapper">
   <div class="checkout shopping">
      <div class="container">
         <div class="row">
            <div class="col-md-7">
               <div class="block billing-details">
                  <h4 class="widget-title">報名資訊 (請填寫完整資料)</h4>
<!--                   <form class="checkout-form"> -->
                     <div class="form-group">
                        <label for="userName">姓名 Name</label>
                        <input type="text" class="form-control" id="userName" name="userName" placeholder="請輸入姓名" required>
                     </div>
                     <div class="form-group">
                        <label for="userPhone">電話 Phone</label>
                        <input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="請輸入電話" required>
                     </div>
                     <div class="form-group">
                        <label for="userAddress">地址 Address</label>
                        <input type="text" class="form-control" id="userAddress" name="userAddress" placeholder="請輸入地址" required>
                     </div>
                     <div class="form-group">
                        <label for="userEmail">電子信箱 E-mail</label>
                        <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="請輸入電子信箱" required>
                     </div>
                     
                     <!-- ---分兩截的textbox -->
<!--                      <div class="checkout-country-code clearfix"> -->
<!--                         <div class="form-group"> -->
<!--                            <label for="userAddress">地址</label> -->
<!--                            <input type="text" class="form-control" id="userAddress" name="zipcode" value=""> -->
<!--                         </div> -->
<!--                         <div class="form-group" > -->
<!--                            <label for="userEmail">E-mail</label> -->
<!--                            <input type="text" class="form-control" id="userEmail" name="city" value=""> -->
<!--                         </div> -->
<!--                      </div> -->
                     <!-- ---/分兩截的textbox -->
<!--                   </form> -->



               </div>
               <!-- --- 第三方支付 --- -->
               <div class="block">
               <h4 class="widget-title">付款方式</h4>
               <p>請選擇：</p> 
               <br>
              <label class="radio-inline">
				 <input type="radio" name="payment" id="inlineRadio1" value="ecpay" required><img class="media-object" src="./source/images/shop/cart/ecpay.png" alt="Image" width=35% />
			  </label>
<!--               <label class="radio-inline"> -->
<!-- 				 <input type="radio" name="payment" id="inlineRadio2" value="linepay" required><img class="media-object" src="./source/images/shop/cart/linepay.png" alt="Image" width=35% /> -->
<!-- 			  </label> -->
               </div>
               
               
<!--                <div> -->
<!--                <input type="radio" name="payment" value="ecpay" id="" required><img class="media-object" src="./source/images/shop/cart/ecpay.png" alt="Image" width=10% />  -->
<!--                </div> -->
<!--                <br> -->
<!--                <input type="radio" name="payment" value="linepay" id="" ><img class="media-object" src="./source/images/shop/cart/linepay.png" alt="Image" width=10% /> -->
<!--                </div> -->
               
               <!-- --- /第三方支付 --- -->
               
			   <!-- 返回課程頁 (回前頁)-->
				<div class="block">
				<h4 class="widget-title">&nbsp;&nbsp;</h4>
                <a href="555" class="pull-left" style="font-weight:bold;"><i class="fa-solid fa-angle-left"></i> &nbsp;返回課程</a>
               </div>
               <!-- /返回課程頁 (回前頁) -->
<!--                <div class="block"> -->
<!--                   <h4 class="widget-title">Payment Method</h4> -->
<!--                   <p>Credit Cart Details (Secure payment)</p> -->
<!--                   <div class="checkout-product-details"> -->
<!--                      <div class="payment"> -->
<!--                         <div class="card-details"> -->
                        
<!-- <!--                            <form  class="checkout-form"> --> 
<!--                               <div class="form-group"> -->
<!--                                  <label for="card-number">Card Number <span class="required">*</span></label> -->
<!--                                  <input  id="card-number" class="form-control"   type="tel" placeholder="•••• •••• •••• ••••"> -->
<!--                               </div> -->
<!--                               <div class="form-group half-width padding-right"> -->
<!--                                  <label for="card-expiry">Expiry (MM/YY) <span class="required">*</span></label> -->
<!--                                  <input id="card-expiry" class="form-control" type="tel" placeholder="MM / YY"> -->
<!--                               </div> -->
<!--                               <div class="form-group half-width padding-left"> -->
<!--                                  <label for="card-cvc">Card Code <span class="required">*</span></label> -->
<!--                                  <input id="card-cvc" class="form-control"  type="tel" maxlength="4" placeholder="CVC" > -->
<!--                               </div> -->
<!--                               <a href="confirmation.html" class="btn btn-main mt-20">確認結帳</a > -->
<!-- <!--                            </form> --> 
<!--                         </div> -->
<!--                      </div> -->
<!--                   </div> -->
<!--                </div> -->
            </div>
            <div class="col-md-5">
               <div class="product-checkout-details">
                  <div class="block">
                     <h4 class="widget-title">課程資訊</h4>
            <%
				for (CartOfCourse c : listCart) {
			%>
			<input type = "hidden" name="courseId" value="<%=c.getCartCourse().getCourseId()%>">
			<input type = "hidden" name="quantity" value="<%=c.getQuantity()%>">
			<input type = "hidden" name="courseName" value="<%=c.getCartCourse().getCourseName()%>">
			<input type = "hidden" name="courseDate" value="<%=c.getCartCourse().getCourseDate()%>">
			<input type = "hidden" name="coursePrice" value="<%=c.getCartCourse().getCoursePrice()%>">
			<input type = "hidden" name="courseTeacher" value="<%=c.getCartCourse().getTeacher().getTeacherName()%>">
                    
                     <div class="media product-card">
                        <a class="pull-left" href="product-single.html">
                           <img class="media-object" src="images/<%=c.getCartCourse().getCourseImage()%>" alt="Image" />
                        </a>
                        <div class="media-body">
                           <h4 class="media-heading"><a href="product-single.html"><%=c.getCartCourse().getCourseName()%></a></h4>
                           <p class="coursedate"><%=tools.getStringDateTime(c.getCartCourse().getCourseDate())%></p>
                           <p class="coursestyle"><%=c.getCartCourse().getCourseStyle()%></p>
<%--                            <p class="price"><%=c.getQuantity()%> x <%=c.getCartCourse().getCoursePrice() %></p> --%>
<!--                            <span class="remove" >刪除</span> -->
                        </div>
                     </div>
             <%
				}
			 %>
			
<!--                      <div class="discount-code"> -->
<!--                         <p>有優惠碼嗎 ? <a data-toggle="modal" data-target="#coupon-modal" href="#!">由此輸入</a></p> -->
<!--                      </div> -->
                     <ul class="summary-prices">
                      	<li>
                           <span>報名人數:</span>
                           <span class="tQuantity">${tQuantity}  人</span>
                        </li>
                        <li>
                           <span>報名費用:</span>
                           <span class="price">$ ${tPrice}</span>
                        </li>
<!--                         <li> -->
<!--                            <span>運費:</span> -->
<%--                            <span>$ <%=request.getAttribute("shipBill")%></span> --%>
<%--                            <input type = "hidden" name="shipBill" value="<%=request.getAttribute("shipBill")%>"> --%>
<!--                         </li> -->
                     </ul>
                     <div class="summary-total">
                        <span>總計</span>
                        <span>$ ${tPrice}</span>
                     </div>
                     <!-- --------這邊是各種VISA LOGO (改成gif) ---------- -->
					<div class="verified-icon">
						<img src="./source/images/shop/cart/baking2.gif" > 
					</div>
                  </div>
               </div>
            </div>
<!--              <a href="http://localhost:8091/orderinsert" class="btn btn-main mt-20 pull-right">確認結帳</a > -->
			<button class="btn btn-main mt-20 pull-left" id="input">一鍵輸入</button>
         	<button class="btn btn-main mt-20 pull-right">確認報名資料</button>
         </div>
      </div>
   </div>
</div>

   <!-- Modal輸入優惠碼跳出框 -->
   <div class="modal fade" id="coupon-modal" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-body">
<!--                <form> -->
                  <div class="form-group">
                     <input class="form-control" type="text" placeholder="Enter Coupon Code">
                  </div>
                  <button type="submit" class="btn btn-main">輸入優惠碼</button>
<!--                </form> -->
            </div>
         </div>
      </div>
   </div>
   
 </form>  
<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

<script type="text/javascript">
$("#input").on("click",function(){
	document.getElementById("userName").value ="洛伊德．佛傑";
	document.getElementById("userPhone").value ="0988123852";
	document.getElementById("userAddress").value ="桃園市平鎮區民族路雙連一段88號";
	document.getElementById("userEmail").value ="1231456@gmail.com";
})

</script>
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