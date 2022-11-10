<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!-- ////// Dashboard歡迎+訂購畫面  /////// -->
    
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
<style>
.recipeImg{
	width:70px;
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
					<li><a class="active" href="dashboard.jsp">會員食譜</a></li>
					<li><a href="/userCollection/1002">食譜收藏</a></li>
					<li><a href="http://localhost:8091/gooAdd">寫食譜</a></li>
				</ul>
				<div class="dashboard-wrapper user-dashboard">
					<div class="media">
						<div class="pull-left">
							<img class="media-object user-img" src="./source/images/avater.jpg" alt="Image">
						</div>
						<div class="media-body">
							<h2 class="media-heading">Welcome Adam Smith</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde, iure, est. Sit mollitia est maxime! Eos
								cupiditate tempore, tempora omnis. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim, nihil. </p>
						</div>
					</div>
					<input type="hidden" id="userId" value="1001" >
					<div class="total-order mt-20">
						<h4>Total Orders</h4>
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th></th>
										<th>食譜名稱</th>
										<th>食譜簡介</th>
										<th style="width:80px;">修改</th>
										<th>刪除</th>
									</tr>
								</thead>
								<tbody id="table">
									
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
<script>

$(document).ready(function(){
	let userId = Number($('#userId').val());
	$.ajax({
        type: 'get',
        url: `userrecipe/` + userId,
        dataType: 'json',
        success: function (data) {
        	console.log(JSON.stringify(data))
            for (var i = 0; i < data.length; i++) {
                    console.log(data.recipeName)
                      let content=  `
                            <tr>
                            <form name="Form" action="/recipe/`+ data[i].recipeId + `" method="POST">
                             <input type="hidden" name="_method" value="DELETE" >
                             	<td><div><img class="recipeImg" src="${pageContext.request.contextPath}/` + data[i].imgPath + `" > </div></td>
								<td><a href="${pageContext.request.contextPath}/reciperesult/` + data[i].recipeId + `"><p>`+data[i].recipeName+`</p></a></td>
								<td><p>`+data[i].recipeDescription+`</p></td>
								<td><a href="${pageContext.request.contextPath}/recipeForUpdate/`+ data[i].recipeId +`">修改</a></td>
								<td><input type="submit" value="刪除"></td>
                              </form>
                            </tr> `

                          $("#table").append(content)
        }
    }
})
})
</script>
</body>
</html>