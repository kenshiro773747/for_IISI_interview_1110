<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.epicer.model.course.*,com.epicer.controller.course.*,org.hibernate.Session,
org.hibernate.SessionFactory,com.epicer.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Teacher Management App</title>
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="http://localhost:8091/666" class="navbar-brand">Management App </a>

			</div>
		</nav>
	</header>

	<br>



	<div class="row">
		<div class="container">
			<h3 class="text-center">List of Teachers</h3>
			<hr>
			<div class="container text-left">
				<form action="beforeTeacherInsert" method="post"
					class="btn btn-success">
					<button type="submit">新增老師</button>
				</form>
			</div>
			<div>搜全部:<input type="search" class="light-table-filter"
					data-table="order-table" placeholder="請輸入關鍵字"></div>

			<br>
			<table class="order-table table table-bordered">


				<thead>
					<tr>
						<th>ID</th>
						<th>name</th>
						<th>description</th>
						<th>status</th>
						<th>image</th>
						<th>address</th>
						<th>phone</th>
						<th>birthday</th>
						<!--<th>負責的課程</th>-->
						<th>edit</th>
						  <th>delete</th>
						
					</tr>
				</thead>

				<tbody>


					<%
					TimeTest timeTest = new TimeTest();
					List<Teacher> list = (List<Teacher>) request.getAttribute("listAll");
					for (Teacher t : list) {
					%>
					  <tr>
						<td><%=t.getTeacherId()%></td>
						<td><%=t.getTeacherName()%></td>
						<td><%=t.getTeacherDescription()%></td>
						<td><%=t.getTeacherStatus()%></td>
						<td><img width=100 src="images/<%=t.getTeacherImage()%>"></td>
						<td><%=t.getTeacherAddress()%></td>
						<td><%=t.getTeacherPhone()%></td>
						<td><%=t.getTeacherBirthday()%></td>
						<!--<td><%=t.getCourse()%></td>-->

						<td>
							<form action="beforeTeacherUpdate" method="post">
								<input type="hidden" name="teacherId"
									value=<%=t.getTeacherId()%>>
								<button type="submit">編輯</button>
							</form>
						</td>
						  <td>
						<form action="deleteTeacher" method = "post">
						<input type = "hidden" name = "teacherId" value = <%=t.getTeacherId()%>>			
						<button type = "submit" >刪除</button>					
						</form>
						</td>
						
						

					</tr>

					<%
					}
					%>
				</tbody>
			</table>


		</div>
	</div>


	<br>

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