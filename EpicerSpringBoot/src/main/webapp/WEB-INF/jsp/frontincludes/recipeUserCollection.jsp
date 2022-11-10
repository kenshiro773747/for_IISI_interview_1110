<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ////// 這頁可以作為會員中心for 收藏/論壇/食譜使用  /////// -->

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp"%>
<style>
.recipeImg{
	width:70px;
}
</style>
</head>
<body id="body">

	<!-- 主文內容 開始 -->
	<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
	<%@include file="../frontpartials/frontheadernavigation.jsp"%>
	<%@include file="../frontpartials/frontheadernavigationtwo.jsp"%>
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
					<!-- ///// ↑ 這邊url最後都要再重新整理過!!!!(因為active位置不同,無法拆寫jsp QQ) -->
					<div class="dashboard-wrapper user-dashboard">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th></th>
										<th>食譜名稱</th>
										<th>食譜簡介</th>
										<th>取消收藏</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${userCollections }" var="item">
										<tr>
											<td>
												<div>
													<img
														src="${pageContext.request.contextPath}/${item.imgPath}"
														class="avatar avatar-sm me-3 recipeImg">
												</div>
											</td>
											<td><div>
													<h6>
														<a href="${pageContext.request.contextPath}/reciperesult/${item.recipeId}">
														${item.recipeName}
													</h6>
												</div></td>
											<td>${item.recipeDescription}</td>
											<td>
												<div class="btn-group" role="group">
												<a href="${pageContext.request.contextPath}/recipeForUpdate/${item.recipeId}">
													<button type="button" class="btn btn-default">
														<i class="tf-ion-close" aria-hidden="true"></i>
													</button>
												</a>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
	<%@include file="../frontpartials/footer.jsp"%>
	<!-- 主文內容 結束 -->

	<!-- //////**極重要!!!!不可少//////<script>//////// -->
	<%@include file="../frontpartials/frontscripttobodyend.jsp"%>

</body>
</html>