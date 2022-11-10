<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.epicer.model.course.*,com.epicer.controller.*,com.epicer.util.*"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer Admin System</title>

<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp"%>
<!-- eLindHead (結束) -->
</head>

<body class="g-sidenav-show   bg-gray-100">

	<!-- ////////////////// 介面最外層框架 //////////////////-->
	<div class="min-height-300 bg-dark position-absolute w-100"></div>
	<!-- ////////////////// Side Navber (開始) //////////////////-->
	<%@include file="../includes/eSidenavAdmin.jsp"%>
	<!-- ////////////////// Side Navber (結束) //////////////////-->
	<!-- //////////////////主畫面框架(開始) ////////////////// -->
	<main class="main-content position-relative border-radius-lg ">
		<!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->
		<!-- ////////////////// 個人主文開始 //////////////////-->


		<div class="row">
			<div class="col-md-2">
				<div class="container text-left">
					<form action="beforeTeacherInsert" method="post">
						<button type="submit" class="btn btn-info">新增教師</button>
					</form>
				</div>
				<div class="form-group">
					<div class="input-group mb-2">
						<span class="input-group-text"><i
							class="ni ni-zoom-split-in"></i></span> <input type="search"
							class="light-table-filter form-control" data-table="order-table"
							placeholder="請輸入關鍵字">
					</div>
				</div>
			</div>

			<div class="card">
				<div class="table-responsive">
					<table class="table align-items-center mb-0 order-table">

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
								<th class="text-secondary opacity-7"></th>
								<th class="text-secondary opacity-7"></th>

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
						<td><img width=100 height=80 src="images/<%=t.getTeacherImage()%>"></td>
						<td><%=t.getTeacherAddress()%></td>
						<td><%=t.getTeacherPhone()%></td>
						<td><%=t.getTeacherBirthday()%></td>
						<!--<td><%=t.getCourse()%></td>-->

						<td>
							<form action="beforeTeacherUpdate" method="post">
								<input type="hidden" name="teacherId"
									value=<%=t.getTeacherId()%>>
								<button type="submit" class="btn btn-success">編輯</button>
							</form>
						</td>
						  <td>
						<form action="deleteTeacher" method = "post">
						<input type = "hidden" name = "teacherId" value = <%=t.getTeacherId()%>>			
						<button type = "submit" class="btn btn-danger">刪除</button>					
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
								Arr.forEach.call(table.tBodies,
										function(tbody) {
											Arr.forEach.call(tbody.rows,
													_filter);
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
		<!-- ////////////////// 個人主文結束 //////////////////-->
												<!--////////////////// Footer(開始) //////////////////-->
		<%@include file="../includes/eFooter.jsp"%>
		<!-- ////////////////// Footer(結束) //////////////////-->

		
											</div>
		<!-- ////////////////// 中間主畫面(結束) ////////////////// -->
	</main>
	<!-- ////////////////// 主畫面框架(結束) //////////////////-->

	<!-- ////////////////// (右上設定鈕)Sidenav Type 調整樣式 ////////////////// -->
	<!-- ////////////////// Sidebar Backgrounds 開始 //////////////////-->
	<%@include file="../includes/eSidenavTypeSetting.jsp"%>
	<!-- ////////////////// Sidebar Backgrounds 結束 ////////////////// -->

	<!-- ////////////////// 框架Script url (開始)(不能少) ////////////////// -->
	<%@include file="../includes/eScriptForBody.jsp"%>
	<!-- ////////////////// 框架Script (結束) //////////////////-->

</body>

</html>