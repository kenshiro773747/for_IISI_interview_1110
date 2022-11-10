<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>



<style>
.tb1 {
	border: 3px solid green;
	border-collapse: collapse;
}

.tb1 th {
	border: 1px solid black;
	text-align: center;
}
</style>

<!-- SweetAlert開始 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">



<script>
	$(function() {
		$('#result')
				.on(
						'click',
						'.sendcourseid',
						function() {
							var sendcourseid = $(this).val();
							console.log('CourseId:' + sendcourseid);
							//var params = {}

							$
									.ajax({
										type : 'get',
										//data:JSON.stringify(params),  
										contentType : 'application/json',
										url : '/QueryStudentsByCourseId/'
												+ sendcourseid,
										success : function(response) {
											
							////////////////1007test////////////////////
											 if (response=='') {
												 console.log("測試=");
												 
												 
                               				Swal.fire({
                                   			icon: 'error',
                                   			title: 'Oops...',
                                   			text: '該課程還沒有人報名喔!',
                               				})

                          					 }else{

											console.log(JSON
													.stringify(response));
											var resultText = "<table class='tb1' ><thead><tr><th>姓名</th><th >電話</th><th >Email</th></tr></thead><tbody>";

											////////////////////////////////////////////////
											for (let i = 0; i < response.length; i++) {
												console.log("response.length: "
														+ response.length);
												console
														.log(response[i].ordername);

												resultText +=

												'<tr>'
														+ '<th style="color:gray;">'
														+ response[i].ordername
														+ '</th>'
														+ '<th style="color:gray;">'
														+ response[i].orderphone
														+ '</th>'
														+ '<th style="color:gray;">'
														+ response[i].orderemail
														+ '</th>' + '</tr>'

												////////////////////////////////////////////////
												;
											}
											resultText += "</tbody></table>";

											Swal.fire({
												title : '學生名單',
												html : resultText,
												width : 600,
												padding : '3em',
												color : '#716add'

											})
                          					 }
										}
									});
						});
	});
</script>

<!-- sweetalert結束 -->


<!-- 依據類別篩選 -->
<!--  <script type="text/javascript">
	$(function() {
		$(document).on(
				'click',
				'.sendcourseid',
				function() {
					var sendcourseid = $(this).val();
					console.log('CourseId:' + sendcourseid);
					//var params = {}

					$.ajax({
						type : 'get',
						//data:JSON.stringify(params),  
						contentType : 'application/json',
						url : '/QueryStudentsByCourseId/' + sendcourseid,
						success : function(response) {
							console.log(JSON.stringify(response));
							var resultText = "";
							////////////////////////////////////////////////
							for (let i = 0; i < response.length; i++) {
								console.log("response.length: "
										+ response.length);
								console.log(response[i].ordername);

								resultText +=

								'<tr>' + '<td style="color:Tomato;">'
										+ response[i].ordername + '</td>'
										+ '<td style="color:Tomato;">'
										+ response[i].orderphone + '</td>'
										+ '<td style="color:Tomato;">'
										+ response[i].orderemail + '</td>'
										+ '</tr>'

								////////////////////////////////////////////////
								;

							}
							$("#result").html(resultText);
						}
					});
				});
	});
</script>-->

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

		<%
		TimeTest TT = new TimeTest();
		Date date = new Date();
		String stringDate = TT.TransDateToString(date);
		//Course c = (Course) request.getAttribute("thecourse");
		//System.out.println("有沒有抓到啦? " + c.getCourseId());

		Teacher hiTeacher = (Teacher) request.getAttribute("hiTeacher");
		%>








		<!-- card -->
		<div class="card" style="float: left;">




			<div class="card-header p-0 mx-3 mt-3 position-relative z-index-1">

				<a href="javascript:;" class="d-block"> <img
					src="images/<%=hiTeacher.getTeacherImage()%>"
					class="img-fluid border-radius-lg" width=200 height=200>
				</a>
			</div>

			<div class="card-body pt-2">
				<span
					class="text-gradient text-primary text-uppercase text font-weight-bold my-2">教師編號:
					<%=hiTeacher.getTeacherId()%></span>
				<p class="card-title h5 d-block text-darker">
					<%=hiTeacher.getTeacherName()%>
					老師的課程
				</p>



				<div class="card">
					<div class="table-responsive">
						<table id="result" class="table align-items-center mb-0">
							<thead>
								<tr>
									<th
										class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">課程</th>
									<th
										class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"></th>
									<th
										class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"></th>
									<th
										class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"></th>
									<th
										class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"></th>
									<th class="text-secondary opacity-7"></th>
								</tr>
							</thead>

							<tbody>

								<%
								Long currenttime = TT.getTime();
								String stime = TT.TransLongToString(currenttime);
								Long ltime = TT.getLongFromString(stime);

								Set<Course> teachersCourse = hiTeacher.getCourse();
								for (Course cd : teachersCourse) {
									if (cd.getCourseDate() >= ltime) {
								%>

								<!-- 進行中課程 -->
								<tr>
									<td>
										<div class="d-flex px-2 py-1">
											<div>
												<img src="images/<%=cd.getCourseImage()%>"
													class="avatar avatar-m me-3">
											</div>
											<div class="d-flex flex-column justify-content-center">
												<h6 class="mb-0 text-s"><%=cd.getCourseId()%></h6>
												<p class=" text-secondary mb-0" style="font-size: 20px;"><%=cd.getCourseName()%></p>
											</div>
										</div>
									</td>

									<td>
										<div class="d-flex flex-column justify-content-center">
											<p class=" text-secondary mb-0" style="font-size: 15px;"><%=TT.transToDate(cd.getCourseDate())%></p>
										</div>
									</td>

									<!-- 狀態 -->

									<td><span class="badge bg-gradient-success">進行中</span></td>



									<!--看詳情-->


									<td><form action="/999" method="post">
										<input type=hidden value="<%=cd.getCourseId()%>"
											name="courseid">

											<button type="submit">看詳情</button>

									</form></td>





									<!--看名單-->
									<td>
										<button class="sendcourseid " value=<%=cd.getCourseId()%>>看名單</button>
									</td>
									<!--看回饋-->
									<!-- <td>
										<button>看回饋</button>
									</td> -->

									<!--輸出csv-->
									<td><a
										href="http://localhost:8091/exportcsv/<%=cd.getCourseId()%>"><button>下載名單</button></a>
									</td>



								</tr>


								<%
								}
								}
								%>
								<!--  ///////////////////////////////////////////////	-->

								<%
								for (Course cd : teachersCourse) {
									if (cd.getCourseDate() < ltime) {
								%>

								<!-- 已結束課程 -->
								<tr>
									<td>
										<div class="d-flex px-2 py-1">
											<div>
												<img src="images/<%=cd.getCourseImage()%>"
													class="avatar avatar-m me-3">
											</div>
											<div class="d-flex flex-column justify-content-center">
												<h6 class="mb-0 text-s"><%=cd.getCourseId()%></h6>
												<p class=" text-secondary mb-0" style="font-size: 20px;"><%=cd.getCourseName()%></p>
											</div>
										</div>
									</td>

									<td>
										<div class="d-flex flex-column justify-content-center">
											<p class=" text-secondary mb-0" style="font-size: 15px;"><%=TT.transToDate(cd.getCourseDate())%></p>
										</div>
									</td>

									<!-- 狀態 -->

									<td><span class="badge bg-gradient-warning">已結束</span></td>



									<!--看詳情-->
									<td><form action="999" method="post">
										<input type=hidden value="<%=cd.getCourseId()%>"
											name="courseid">

											<button type="submit">看詳情</button>

									</form></td>
									<!--看名單-->
									<td>
										<button class="sendcourseid " value=<%=cd.getCourseId()%>>看名單</button>
									</td>
									<!--看回饋-->
									<!--  <td>
										<button>看回饋</button>
									</td>-->

									<!--輸出csv-->
									<td><a
										href="http://localhost:8091/exportcsv/<%=cd.getCourseId()%>"><button>下載名單</button></a>
									</td>
								</tr>


								<%
								}
								}
								%>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>







		<!--    <table class="table align-items-center mb-0 order-table">
			<thead>
				<tr>
					<th>姓名</th>
					<th>電話</th>
					<th>Email</th>
				</tr>
			</thead>


			<tbody id="result"></tbody>



		</table>
-->



		<!-- ////////////////// 個人主文結束 //////////////////-->
		<!--////////////////// Footer(開始) //////////////////-->
		<%@include file="../includes/eFooter.jsp"%>
		<!-- ////////////////// Footer(結束) //////////////////-->


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