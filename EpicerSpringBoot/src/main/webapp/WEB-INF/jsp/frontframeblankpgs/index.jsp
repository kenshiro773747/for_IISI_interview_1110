<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- //////  首頁 ////// -->
 
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
<style>

/* 商品的長度 */
.col-md-3 {
    width: 25%;
    height: 350px;
}
.panel-title-1 a {
    font-size: 14px;
    text-transform: uppercase;
    padding: 10px 10px;
}
/* 商品的黑框 */
.product-item .product-thumb {
    height: 265px;
}
/* 商品上方的空白拿掉 */
.section {
    padding: 20px 0;
}
.col-md-8 {
     width: 30%; 
     padding-left: 20px;
}
 .col-md-100 { 
     width: 70%; 
     padding-left: 20px;
 } 
 
 .title {
     padding: 0; 
}

/* 這是輪播的熱賣商品 */
.owl-theme .item {
  height: 20rem;
/*   background: #4dc7a0; */
   padding: 1rem; 
}

.owl-carousel .item h4 {
/*   color: #fff; */
  font-weight: 400;
  font-size: 1.4375rem;
  margin-top: 0rem;
}

.section {
    padding: 10px 0;
    background:white;
}
</style>

</head>
<body id="body">


<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，
大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>

<!-- /////// 首頁的第一段滑動畫面(可做為食譜/商品/課程/論壇 滾動輪播) ///// -->
<%@include file="../frontpartials/heroslider.jsp" %>

<!-- /////// 首頁第二段(商品三分類畫面) ///// -->
<%-- <%@include file="../frontpartials/category.jsp" %> --%>


<section class="products section bg-gray">
	<div class="container">
		<div class="row">
			<div class="title text-center">
				<h2>商 品 一 覽 表</h2>
			</div>
		</div>
		<div class="row">
		<!-- /////// 商品顯示頁面 (多頁)->可用在首頁(第三段) & 商品頁///// -->
			<%@include file="../product/product.jsp" %>
		</div>
	</div>
</section>

<!-- /////// 首頁第四段-寄送廣告訊息(email) - 可以食譜使用(or其他人?) ///// -->
<%@include file="../frontpartials/calltoaction.jsp" %>

<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/instagramfeed.jsp" %>

<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>
 <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
 <script src="js/sweetalert2.all.min.js"></script>
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
		    	 $('#useravatar').attr("src","images/default.jpg")
		    	 var content='<li><a href="form">註冊</a></li>'
		    		 +'<li><a href="login">登入</a></li>'
		    		 
		    		//'<li><a href="admin/checkadminstatus2">管理者</a></li>';
		    		//+'<li><form action="users/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員</a></form></li>';
		    	  $('#userselect').append(content)
		    	  
		    /*	  Swal.fire({
			   		  title: '馬上加入會員吧！',
			   		  width: 600,
			   		  padding: '3em',
			   		  imageUrl:'https://upload.cc/i1/2022/10/17/znkQvA.png',
			   		imageWidth:'250px',
			   		  color: '#716add',
			   		  background: '#fff url(images/trees.png)',
			   		  backdrop: `
			   		    rgba(0,0,123,0.4)
			   		    url("images/AS001123_18.gif")
			   		    left 
			   		    no-repeat
			   		  `
			   		})	*/	

		   		
		   		}else if(data.result =='U' ){
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		  
		   		       var content=
		   		    	'<li><form action="users/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員中心</a></form></li>'
		   		              +'<li><a href="/all/logout">登出</a></li>';
		   		              
		   		              
		    	  $('#userselect').append(content)
		   		/* Swal.fire({
			   		  title: data.user.name+' 歡迎回來Epicer',
			   		  width: 600,
			   		  padding: '3em',
			   		  color: '#716add',
			   		 imageUrl:'https://upload.cc/i1/2022/10/17/znkQvA.png',
				   		imageWidth:'250px',
			   		  background: '#fff url(images/trees.png)',
			   		  backdrop: `
			   		    rgba(0,0,123,0.4)
			   		    url("images/AS001123_18.gif")
			   		    left 
			   		    no-repeat
			   		  `
			   		})	*/
			   		
		   		}else if(data.result =='A'){
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		 var content=
		   			'<li><form action="admin/checkadminstatus2" method="post" name="form3"><a href="javascript:document.form3.submit();">管理系統</a></form></li>'
		   		   +'<li><a href="/all/logout">登出</a></li>';
		    	 
		    	  $('#userselect').append(content)
		   	/*	 Swal.fire({
			   		  title: data.user.name+' 管理者 歡迎回來Epicer',
			   		  width: 600,
			   		  padding: '3em',
			   		  color: '#716add',
			   		 imageUrl:'https://upload.cc/i1/2022/10/17/znkQvA.png',
				   		imageWidth:'250px',
			   		  background: '#fff url(images/trees.png)',
			   		  backdrop: `
			   		    rgba(0,0,123,0.4)
			   		    url("images/AS001123_18.gif")
			   		    left 
			   		    no-repeat
			   		  `
			   		})	*/
		   			
		   		}else{
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		  var content=
		   			 '<li><form action="/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員中心</a></form></li>'
		   		      +'<li><a href="/all/logout">登出</a></li>';
		    	 
		    	  $('#userselect').append(content)
		    	  
		   /*		 Swal.fire({
			   		  title: data.user.name+' 完成驗證，享受完整的服務吧！',
			   		  width: 600,
			   		  padding: '3em',
			   		  color: '#716add',
			   		 imageUrl:'https://upload.cc/i1/2022/10/17/znkQvA.png',
				   		imageWidth:'250px',
			   		  background: '#fff url(images/trees.png)',
			   		  backdrop: `
			   		    rgba(0,0,123,0.4)
			   		    url("images/AS001123_18.gif")
			   		    left 
			   		    no-repeat
			   		  `
			   		})		 */    
		   		}
		     },//success
		    error:function(err){console.log(err)},
		  });//ajax
	 
	 
	 
	 
 })
 
 </script>
</body>
</html>