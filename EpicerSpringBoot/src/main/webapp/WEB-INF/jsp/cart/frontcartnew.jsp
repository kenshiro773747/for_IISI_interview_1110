<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.cart.*"%>
<%@page import="java.math.BigDecimal"%>
<%@ page import="java.util.*,org.hibernate.Session, org.hibernate.SessionFactory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.epicer.model.*"%>

    
<!-- ////// 購物車畫面  /////// -->
    
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>

<style>


</style>
</head>

<body id="body">

<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>


<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="購物車" />
<jsp:param name="pagination" value="購物明細" />
</jsp:include>



<div class="page-wrapper">
  <div class="cart shopping">
    <div class="container">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="block">
            <div class="product-list">
              <form name="Form" action="queryById" method="get">
                <table class="table">
                <%
					List<CartOfProduct> listCart = (List<CartOfProduct>) request.getAttribute("queryById");
					session.getAttribute("userId");
				%> 
                  <thead>
                    <tr>
                      <th class="">商品名稱</th>
                      <th class="">價格</th>
                      <th class="">數量</th>
                      <th class="">小計</th>
                      <th class="">&nbsp;</th>
                    </tr>
                  </thead>
                  <tbody>
                  <%
					for (CartOfProduct c : listCart) {
				%>
                    <tr class="">
                      <td class="">
                        <div class="product-info">
                          <img width="80" src="<%=c.getCartProduct().getProductImage()%>" alt="" />
                          <a href="#!"><%=c.getCartProduct().getProductName()%></a>
                        </div>
                      </td>
                      <td class="">&nbsp;&nbsp;<%=c.getCartProduct().getProductPrice() %></td>
                      <td class="">&nbsp;&nbsp;&nbsp;<%=c.getQuantity()%></td>
                      <td class="">&nbsp;&nbsp;<%=c.getCartProduct().getProductPrice() * c.getQuantity()%></td>
                      <td class="">
						<ul>
						<li class="" onclick="deleteCartId('<%=c.getCartProductId() %>');">
						<a href="#!" class="deleteItem  btn-icon btn btn-main btn-icon">
						<i class="tf-ion-ios-trash-outline"></i>刪除
						</a></li>
						</ul>
                      </td>
                    <%
						}
						%>
                    </tr>
                  </tbody>
                </table>
                
                    <h4 style="text-align:center;font-weight:bold;">- 商品總數： ${tQuantity} ，商品總金額： $  ${tPrice} -</h4>
                <a href="product" class="pull-left" style="font-weight:bold;"><i class="fa-solid fa-angle-left"></i> &nbsp;返回商品頁</a>
                <a href="ordercheck" class="btn btn-main pull-right">結帳</a>
              </form>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>




<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>
<script src="js/jquery-3.6.0.js"></script>
	<script>
		//按鈕功能
		//刪除
		function deleteCartId(cartId){
// 			Swal.fire({
// 				  title: '確定要刪除嗎?( ´•̥̥̥ω•̥̥̥` )',
// 				  text: "還來得及反悔喔!",
// 				  icon: 'warning',
// 				  showCancelButton: true,
// 				  confirmButtonColor: '#3085d6',
// 				  cancelButtonColor: '#d33',
// 				  confirmButtonText: '刪除!'
// 				}).then((result) => {
// 				  if (result.isConfirmed) {
// 				    Swal.fire(
// 				      '刪除成功!',
// 				      '可以回商品頁重新加單喔!',
// 				      'success'
// 				    )
// 				    $(window.location.href = "deleteCartItem?cartId=" + cartId).submit();
// 				  }
// 				})
			window.location.href = "deleteCartItem?cartId=" + cartId;
		}
		</script>
		
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