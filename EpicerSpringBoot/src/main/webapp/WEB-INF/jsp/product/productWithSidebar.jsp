<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- //////  商品網+側邊推播  //////// -->  
 
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
<style>
/* 商品的長度 */
.col-md-3 {
    width: 25%;
    height: 280px;
}
.panel-title-1 a {
    font-size: 14px;
    text-transform: uppercase;
    padding: 10px 10px;
}
/* 商品的黑框 */
.product-item .product-thumb {
    height: 190px;
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
}


</style>
<!-- owl.carousel 輪播所需套件-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
</link>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
</link>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
window.onload=function(){

// 	$("a .likes").(function () {
		$.ajax({
			url: 'findAllLike' ,
			dataType: 'json',
			success: function (data) {
				 console.log(data);
				 var productLike ="";
				 var id="";
				 aaa = "<i  class='tf-ion-ios-heart'></i>";
				 bbb = "<i  class='tf-ion-ios-heart-outline'></i>"
				   
				   $('.ProductId').each(function(){
// 					   id=id+$(this).val()+',';
					   id=Number($(this).val());
					   var x=data.indexOf(id);
					   $('#div'+id).empty("");
					   if(x > -1){
						 $('#div'+id).html(aaa);  
					   }else{
						   $('#div'+id).html(bbb);   
					   }
					   
				   });
				 
				 
// 				 方法2
// 				 id=Number($('#ProductId').val());
// 				 console.log(id);
				 
// 				 for (let i = 0; i < data.length; i++) {
					 
// 					 productLike = data[i];
// 						if (productLike == id) {
// 							productLike = "<i  class='tf-ion-ios-heart'></i>";
// 						} else {
// 							productLike = "<i  class='tf-ion-ios-heart-outline'></i>";
// 						}
// 						console.log(productLike);
//                      $(#id).html(productLike);
					 
// 				 };
			}
		})
// 	}
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

<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="商品" />
<jsp:param name="pagination" value="商品" />
</jsp:include>



<section class="products section">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
			
<!-- 			      搜尋by下拉式選單 -->
<!-- 				<div class="widget"> -->
<!-- 					<h4 class="widget-title">Short By</h4> -->
<!-- 					<form method="post" action="#"> -->
<!--                         <select class="form-control"> -->
<!--                             <option>Man</option> -->
<!--                             <option>Women</option> -->
<!--                             <option>Accessories</option> -->
<!--                             <option>Shoes</option> -->
<!--                         </select> -->
<!--                     </form> -->
<!-- 	            </div> -->



				<div class="widget product-category">
					<h4 class="widget-title">類別</h4>
					<div class="panel-group commonAccordion" id="accordion" role="tablist" aria-multiselectable="true">
					  	
					  	<div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="headingOne">
						      	<h4 class="panel-title-1">
						        	<a  href="/product" content="">
<!-- 						          	class="collapsed"是下拉式選單的+-號， -->
						          	搜全部
						        	</a>
						      	</h4>
						    </div>
<!-- 						    class="panel-collapse collapse in" 中的in決定要不要自動下拉 -->
					    
					  </div>
					  	
					  	
					  	<div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="headingOne">
						      	<h4 class="panel-title">
						        	<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
<!-- 						          	class="collapsed"是下拉式選單的+-號， -->
						          	想吃健康點
						        	</a>
						      	</h4>
						    </div>
<!-- 						    class="panel-collapse collapse in" 中的in決定要不要自動下拉 -->
					    <div id="collapseOne" class="panel-collapse collapse " role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<ul>
									<li><a href="category?productCategoryId=4">蔬菜類</a></li>
									<li><a href="category?productCategoryId=5">水果類</a></li>
								</ul>
							</div>
					    </div>
					  </div>
					  
					  
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingTwo">
					      <h4 class="panel-title">
					        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					         	想吃飽一點
					        </a>
					      </h4>
					    </div>
					    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					    	<div class="panel-body">
					     		<ul>
									<li><a href="category?productCategoryId=1">五穀根莖類</a></li>
									<li><a href="category?productCategoryId=3">蛋豆魚肉類</a></li>
								</ul>
					    	</div>
					    </div>
					  </div>
					  
					  
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingThree">
					      <h4 class="panel-title">
					        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					          	加一點就是人間美味
					        </a>
					      </h4>
					    </div>
					    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					    	<div class="panel-body">
					      		<ul>
									<li><a href="category?productCategoryId=2">奶類</a></li>
									<li><a href="category?productCategoryId=6">油脂與堅果種子類</a></li>
									<li><a href="category?productCategoryId=7">調味品類</a></li>
								</ul>
					    	</div>
					    </div>
					  </div>
					</div>
					
				</div>
			</div>
			<div class="col-md-9">
				<div class="row">
					<!-- ///////////////   商品顯示頁面 (多頁) --可用在首頁(第三段) & 商品頁 ///////////// -->
					<!-- @@include('blocks/product.htm') -->
					<%@include file="../product/product.jsp" %>
				</div>				
			</div>
		
		</div>
	</div>
</section>

<!-- /////// 熱賣商品推播 ///// -->
<%@include file="../product/relatedproducts.jsp" %>

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