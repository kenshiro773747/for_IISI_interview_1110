<%@page import="com.epicer.model.course.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>

<style>
table {
	border: 2px solid black;
	width: 1200px;
	margin: 5px auto
}

th td {
	width: 300px;
	height: 20px;
	margin: 0 auto;
}
</style>
</head>
<body id="body">
<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，
大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>

	<br>
	<br>
	<br>
	<h1 ALIGN=CENTER>搜全部課程</H1>
	<div ALIGN=CENTER>
		<label for="name">搜尋:</label> <input type="search"
			class="light-table-filter" data-table="order-table"
			placeholder="請輸入關鍵字">
	</div>
	<br>

	<table class="order-table" cellspacing="2" cellpadding="1" border="4"
		width="100%">
		<colgroup>
			<col width="20%">
			<col width="40%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
			
		</colgroup>
		<thead>
			<tr>
				<th>名稱</th>
				<th>商品說明</th>
				<th>老師名字</th>
				<th>費用</th>
				<th>上課時間</th>
<!-- 				<th>數量</th> -->
				<th>&nbsp;</th>
			</tr>
		</thead>

		<%
		request.setAttribute("userId", 1002);
		List<Course> course = (List<Course>) request.getAttribute("queryallcourse");
		for (Course c : course) {
		%>
		<tbody>
			<tr>
				<form action="queryallcourse" method="get">
					<input type="hidden" name="id"
						value=<%=request.getParameter("id")%>>
				<td><%=c.getCourseName()%></td>
				<td><%=c.getCourseDescription()%></td>
				
				<td><%=c.getTeacher().getTeacherName()%></td>
				<td><%=c.getCoursePrice()%></td>
				<td><%=c.getFakeCourseDate()%></td>
				</form>
<!-- 				<td>1</td>  數量一次只能報名一人 不顯示 -->
				<td>
					<form ALIGN=center action="addcoursetocart" method="post">
						<input type="hidden" name="userid" value=1002> 
						<input type="hidden" name="courseid" value="<%=c.getCourseId()%>"> 
						<input type="hidden" name="name" value="<%=c.getCourseName()%>">
						<input type="hidden" name="price" value="<%=c.getCoursePrice()%>">
						<input type="hidden" name="quantity" value=1> <input
							type="hidden" name="action" value="delete"> <input
							ALIGN=center type="submit" value="點我報名" name="delete">
					</form>

				</td>
			</tr>

			<%
			}
			%>
		</tbody>
	</table>
<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>
	<script>
		(function(document) {
			'use strict';

			// 建立 LightTableFilter
			var LightTableFilter = (function(Arr) {

				var _input;

				// 資料輸入事件處理函數
				function _onInputEvent(e) {
					_input = e.target;
					var tables = document.getElementsByClassName(_input
							.getAttribute('data-table'));
					Arr.forEach.call(tables, function(table) {
						Arr.forEach.call(table.tBodies, function(tbody) {
							Arr.forEach.call(tbody.rows, _filter);
						});
					});
				}

				// 資料篩選函數，顯示包含關鍵字的列，其餘隱藏
				function _filter(row) {
					var text = row.textContent.toLowerCase(), val = _input.value
							.toLowerCase();
					row.style.display = text.indexOf(val) === -1 ? 'none'
							: 'table-row';
				}

				return {
					// 初始化函數
					init : function() {
						var inputs = document
								.getElementsByClassName('light-table-filter');
						Arr.forEach.call(inputs, function(input) {
							input.oninput = _onInputEvent;
						});
					}
				};
			})(Array.prototype);

			// 網頁載入完成後，啟動 LightTableFilter
			document.addEventListener('readystatechange', function() {
				if (document.readyState === 'complete') {
					LightTableFilter.init();
				}
			});

		})(document);
	</script>
</body>
</html>