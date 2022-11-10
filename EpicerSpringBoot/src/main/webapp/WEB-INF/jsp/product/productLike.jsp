<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.product.*"%>
<%@page import="java.util.List"%>
    
    
<!-- ////// 這頁可以作為會員中心for 收藏/論壇/食譜使用  /////// -->
    
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
<style>
.page-wrapper {
    padding: 10px 0;
}
</style>

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<body id="body">

<%-- <% session.setAttribute("userId", 1003); %> --%>

<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>
<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="會員中心" />
<jsp:param name="pagination" value="收藏商品" />
</jsp:include>



<section class="user-dashboard page-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
      <!-- ///// ↓這邊url最後都要再重新整理過!!!!(因為active位置不同,無法拆寫jsp QQ) -->
<!--         <ul class="list-inline dashboard-menu text-center"> -->
<!--           <li><a href="dashboard.jsp">Dashboard歡迎+訂購畫面</a></li> -->
<!--           <li><a href="order.jsp">Order(訂單/課程)</a></li> -->
<!--           <li><a class="active" href="address.jsp">Address(文章管理/收藏/食譜)</a></li> -->
<!--           <li><a href="profiledetails.jsp">個人資料維護</a></li> -->
<!--         </ul> -->
      <!-- ///// ↑ 這邊url最後都要再重新整理過!!!!(因為active位置不同,無法拆寫jsp QQ) -->  
       
       
		
        <div class="page-wrapper">
  <div class="cart shopping">
    <div class="container">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="block">
            <div class="product-list">
              <form method="post">
                <table class="table">
                  <thead>
                    <tr>
                      <th class="">商品名稱</th>
                      <th class="">單位</th>
                      <th class="">價格</th>
                      <th colspan="2" class="">操作</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <%
				List<Product> product = (List<Product>)request.getAttribute("find");
				for (Product pb : product) {
		%>
                  
                    <tr class="">
                      <td class="">
                        <div class="product-info">
                          <img  height="50" src="<%=pb.getProductImage()%>" alt="" />
                          <a href="#!"><%=pb.getProductName()%></a>
                        </div>
                      </td>
                      <td class=""><%=pb.getProductUnit()%></td>
                      <td class="">$<%=pb.getProductPrice()%></td>
                      <td class="">
                        <a class="product-remove" href="deleteLikeProduct?ProductId=<%=pb.getProductId() %>">刪除</a>
                      </td>
                      <td class="">
                        <a href="productDetail?ProductId=<%=pb.getProductId()%>" class="btn btn-main pull-right">查看商品詳情</a>
                      </td>
                    </tr>
                    
                     <%
			}
			%>
                    
                  </tbody>
                </table>
                
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
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