<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ////// Dashboard歡迎+訂購畫面  /////// -->
    
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
<style>
.popup-overlay {
visibility:hidden;
}

.popup-content {
visibility:hidden;
}

.popup-overlay.active{
visibility:visible;
}

.popup-content.active {
visibility:visible;
}

</style>
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
					<li><a class="active" href="dashboard.jsp">Dashboard歡迎+訂購畫面</a></li>
					<li><a href="order.jsp">Order(訂單/課程)</a></li>
					<li><a href="address.jsp">Address(文章管理/收藏/食譜)</a></li>
					<li><a href id="record">客服紀錄</a></li>
				
					<li><form name="usermanagement" method="post" action="usermanagement"><a href="javascript:document.usermanagement.submit();">個人資料維護</a></form></li>
					
				</ul>
				<div class="dashboard-wrapper user-dashboard">
					<div class="media">
						<div class="pull-left">
							<img class="media-object user-img"  src="images/logo.png" alt="Image">
						</div>
						<div class="media-body">
							<h2 class="media-heading">歡迎回來</h2>
							<p>您的寶貴意見，是Epicer前進的動力</p>
						</div>
					</div>
					
					<div class="total-order mt-20">
						<h4>紀錄總覽</h4>
						<div class="table-responsive">
							<table class="table">
								<thead >
									<tr>
										<th>內容編號</th>
										<th>內容分類</th>
										<th>發送日期</th>
										<th>處理狀態</th>
										<th>處理人員</th>
										<th></th>
									</tr>
								</thead>
								<tbody id="append">
								</tbody>
							</table>
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

</body>
<script src="js/jquery-3.6.0.js"></script>
<script>
$(function(){ 
	
	 $.ajax({
		  type:"POST",
		  url:"/record",
		  contentType:'application/json',
		 // data:JSON.stringify(user),
		  success:function(data){
			  console.log(data);
			  var result="";
			  if(data.length <=0){
				  alert("1212");
				  window.location.href= 'https://localhost:8091/ajaxlogin';
			  }else{
				  
			  for(let i=0;i<data.length;i++){
				 //href="select/'+data[i].contentId+'"
					var id='<td><a href="select/'+data[i].contentId+'">'+data[i].contentId+'</a></td>';
					var strd = new Date(data[i].date).toLocaleDateString();
					var type='<td>'+data[i].type+'</td>';
					var date ='<td>'+strd+'</td>';
					
					if(data[i].replyStatus ==0){
						var status ='<td>尚未受理</td>'	
					}else{
					    var status ='<td>已回覆</td>'							
					}
					
					if(data[i].replyerId == null){
						var reply ='<td>尚未受理</td>'
					}else{
					var reply ='<td>'+data[i].replyerId+'</td>'
					}
						result+=id+type+date+status+reply  
				  }
				  $('#append').append(result);
	 }
		  },//success
	  }); //ajax
	 
});//底

</script>
</html>