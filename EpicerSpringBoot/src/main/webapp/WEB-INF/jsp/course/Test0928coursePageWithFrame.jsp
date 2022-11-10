<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.epicer.model.course.*,com.epicer.controller.*,com.epicer.util.*"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer Admin System</title>

<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp"%>
<!-- eLindHead (結束) -->
<style>
.ann {
	font-size: 2000px
}
</style>

<style>
.table> :not(caption)>*>* {
    padding: 0.1rem 0.1rem;
    background-color: var(--bs-table-bg);
    border-bottom-width: 0.1px;
    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
}

fieldset {
             width: 900px;
                border-radius: 15px;
                margin: 10px auto;
                background-color: white;
}


span {
position:relative;
overflow:hidden;
white-space: nowrap;  
overflow: hidden;  
text-overflow: ellipsis; 
max-width:60px;
display:inline-block;

}
.d-flex  {
position:relative;
overflow:hidden;
white-space: nowrap;  
overflow: hidden;  
text-overflow: ellipsis; 
max-width:120px;
display:inline-block;
}



.row>* {
    flex-shrink: 0;
    width: 100%;
    max-width: 100%;
    padding-right: calc(var(--bs-gutter-x) * .5);
    padding-left: calc(var(--bs-gutter-x) * .5);
    margin-top: var(--bs-gutter-y);
}

body {
    font-weight: 50;
/*     line-height: 0.5; */
}

.tb1 {
	border: 3px solid green;
	border-collapse: collapse;
}

.tb1 th {
	border: 1px solid black;
	text-align: center;
}
</style>

 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- DataTable開始 -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

	
<!--  	<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>-->

<!-- DataTable結束 -->



<!-- SweetAlert開始 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<!-- sweetalert刪除 -->

<script>
    $(function () {
        $('#result').on('click', '.sweetalertdelete',
            function () {

        	var sendcourseid = $(this).val();
        	console.log('CourseId:' + sendcourseid);
        	
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-success',
                        
                        cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                })

                swalWithBootstrapButtons.fire({
                    title: 'Are you sure?',
                    text: "刪除後將無法復原!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '是的',
                    cancelButtonText: '再想一下',
                    reverseButtons: true
                }).then((result) => {
                	
                        
                    if (result.isConfirmed) {

                        $.ajax({
                            type: 'get',
                            //contentType: 'application/json',
                            url: '/deleteCourse/'+sendcourseid,
                            
                            success: function (response) {
                            	     	          	
                            }
                        });
                    	
                        swalWithBootstrapButtons.fire(
                            'Deleted!',
                            '此筆資料已刪除',
                            'success'
                        ).then((result)=> {
                        	queryall();
                        })
                        

                    } else if (
                        /* Read more about handling dismissals below */
                        result.dismiss === Swal.DismissReason.cancel
                    ) {
                        swalWithBootstrapButtons.fire(
                            'Cancelled',
                            '此筆資料沒有刪除:)',
                            'error'
                        )
                    }
                    
                    
                })


            });

    });
</script>



<!-- sweetalert跳名單 -->
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

							$.ajax({
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
											
											
											///////////////////////////////////////

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
	///////										
										}								
										
///////
										}
									});
						});
	});
</script>

<!-- sweetalert結束 -->


<!-- 搜全部 -->
<script>
	$(document).ready(function() {
		queryall()
	}
	//$('#myTable').DataTable();
	);

	function queryall() {
		$
				.ajax({
					type : 'get',
					contentType : 'application/json',
					url : '/5566',
					success : function(response) {
						console.log(JSON.stringify(response));
						var resultText = "";
						////////////////////////////////////////////////
						for (let i = 0; i < response[0].length; i++) {
							console.log(response[0].length);

							console.log(response[0][i].courseName);
							console.log(response[1][i].teacherImage);

							resultText +=

							'<tr>'
										
									+
									'<td width="150">'
									+ '<img width=150 height=100 src="' + 'images/' + response[0][i].courseImage + '">'
									+'</td>'

							
									+

									'<td>'
									+ '<div class="d-flex px-2 py-1">'
									
									+ '<div class="d-flex flex-column justify-content-center">'
									+ '<h5 style="font-size: 10px;">'
									+ response[0][i].courseId
									+ '</h5>'
									+ '<p style="font-size: 10px;">'
									+ response[0][i].courseName
									+ '</p>'
									+ '<p style="font-size: 10px;">'
									+ response[0][i].courseDescription
									+ '</p>'
									+ '</div>'
									+ '</div>'
									+ '</td>'
									+

									


									'<td>'
									+ response[0][i].coursePrice
									+ '元'
									+ '</td>'
									+

									'<td>'
									+ response[0][i].fakeCourseDate
									+ '</td>'
									+

									'<td>'
									+ '<div class="d-flex px-2 py-1">'
									+ '<div>'
									+
									//'<img src="images/'+response[i].Teacher.teacherImage+'" class="avatar avatar-m me-3">'
									//'<img src="'+'images/' + response[i].teacher.teacherImage + '">'+
									'<img src="' + 'images/' + response[1][i].teacherImage + '" class="avatar avatar-m me-3">'
									+

									'</div>'
									+ '<div class="d-flex flex-column justify-content-center">'
									+ '<h6 class="mb-0 text-s">'
									+ response[1][i].teacherId
									+ '</h6>'
									+ '<p class=" text-secondary mb-0" style="font-size: 12px;">'
									+ response[1][i].teacherName
									+ '</p>'
									+ '</div>'
									+ '</div>'
									+ '</td>'
									+

									'<td>'
									+ response[0][i].classroomId
									+ '</td>'
									+

									'<td>'
									+ response[0][i].courseStyle
									+ '</td>'
									+

									'<td>'
									+

									'<button class="sendcourseid btn btn-success" value="'+ response[0][i].courseId+ '" >名單</button>'
									+

									'</td>'
									+

									'<td>'
									+ '<form action="beforeUpdateCourse" method="post">'
									+ '<input type="hidden" name="courseId" value=' + response[0][i].courseId + '>'
									+ '<button type="submit" class="btn btn-success">編輯</button>'
									+ '</form>'
									+ '</td>'
									

									//'<td>'
									//+ '<form action="deleteCourse" method="post">'
									//+ '<input type="hidden" name="courseId" value=' + response[0][i].courseId + '>'
									//+ '<button type="submit" class="btn btn-danger">刪除</button>'
									//+ '</form>' + '</td>' 
									
							/////Test1007sweetalertdelete///////		
									
									+
									'<td>'
									+ '<form action="deleteCourse" method="post">'
									+ '<input type="hidden" name="courseId" value=' + response[0][i].courseId + '>'
									+ '<button type="button" class="btn btn-danger sweetalertdelete" value=' + response[0][i].courseId +'>刪除</button>'
									+ '</form>' + 
									'</td>' 
									+
									
							///////////////////////////////////////////////////////////
									+ '</tr>'

							////////////////////////////////////////////////
							;

						}
						$("#result").html(resultText);
						//$('#myTable').DataTable();
					}
				});
	}
</script>


<!-- 依據類別篩選 -->
<script type="text/javascript">
	$(function() {

		$("#body").on('click', '#1122', function() {
			console.log('抓到沒')
		});

		$(document)
				.on(
						'click',
						'.sendstyle',
						function() {

							//$('#myTable').DataTable().destroy();

							var coursestyle = $(this).val();
							console.log('courseStyle:' + coursestyle);
							//var params = {}

							$
									.ajax({
										type : 'get',
										//data:JSON.stringify(params),  
										contentType : 'application/json',
										url : '/queryByCourseStyle/'
												+ coursestyle,
										success : function(response) {
											console.log(JSON
													.stringify(response));
											var resultText = "";
											////////////////////////////////////////////////
											for (let i = 0; i < response[0].length; i++) {
												//console.log(response.length);												             	 
												//console.log(response[0][i].courseName);
												//console.log(response[1][i].teacherImage);

												resultText +=

												'<tr>'
														+

														'<td>'
														+ '<div class="d-flex px-2 py-1">'
														+ '<div class="d-flex flex-column justify-content-center">'
														+ '<h5 style="font-size: 10px;">'
														+ response[0][i].courseId
														+ '</h5>'
														+ '<p style="font-size: 10px;">'
														+ response[0][i].courseName
														+ '</p>'
														+ '<p style="font-size: 10px;">'
														+ response[0][i].courseDescription
														+ '</p>'
														+ '</div>'
														+ '</div>'
														+ '</td>'
														+

														'<td width="150">'
														+ '<img width=150 height=100 src="'+'images/'+ response[0][i].courseImage+'">'

														
														+

														'<td>'
														+ response[0][i].coursePrice
														+ '元'
														+ '</td>'
														+

														'<td>'
														+ response[0][i].fakeCourseDate
														+ '</td>'

														+ '<td>'
														+ '<div class="d-flex px-2 py-1">'
														+ '<div>'
														+
														//'<img src="images/'+response[i].Teacher.teacherImage+'" class="avatar avatar-m me-3">'
														//'<img src="'+'images/' + response[i].teacher.teacherImage + '">'+
														'<img src="'+'images/' + response[1][i].teacherImage + '" class="avatar avatar-m me-3">'
														+

														'</div>'
														+ '<div class="d-flex flex-column justify-content-center">'
														+ '<h6 class="mb-0 text-s">'
														+ response[1][i].teacherId
														+ '</h6>'
														+ '<p class=" text-secondary mb-0" style="font-size: 12px;">'
														+ response[1][i].teacherName
														+ '</p>'
														+ '</div>'
														+ '</div>'
														+ '</td>'
														+

														'<td>'
														+ response[0][i].classroomId
														+ '</td>'
														+

														'<td>'
														+ response[0][i].courseStyle
														+ '</td>'
														+

														'<td>'
														+

														'<button class="sendcourseid btn btn-success" value="'+ response[0][i].courseId+ '" >名單</button>'
														+

														'</td>'
														+

														'<td>'
														+ '<form action="beforeUpdateCourse" method="post">'
														+ '<input type="hidden" name="courseId" value='+ response[0][i].courseId+'>'
														+ '<button type="submit" class="btn btn-success">編輯</button>'
														+ '</form>'
														+ '</td>'
														+

														//'<td>'
														//+ '<form action="deleteCourse" method="post">'
														//+ '<input type="hidden" name="courseId" value=' + response[0][i].courseId+'>'
														//+ '<button type="submit" class="btn btn-danger">刪除</button>'
														//+ '</form>'
														//+ '</td>'
														//+ '</tr>'
														
														
														'<td>'
														+ '<form action="deleteCourse" method="post">'
														+ '<input type="hidden" name="courseId" value=' + response[0][i].courseId + '>'
														+ '<button type="button" class="btn btn-danger sweetalertdelete" value=' + response[0][i].courseId +'>刪除</button>'
														+ '</form>' 
														+ '</td>' 
														+ '</tr>'

												////////////////////////////////////////////////
												;

											}
											$("#result").html(resultText);
											//$('#myTable').DataTable();
										}
									});
						});
	});
</script>


<!-- 尚未開始的課程 -->
<script>
	$(document)
			.on(
					'click',
					'#queryAfterCurrentTime',
					function() {

						//$('#myTable').DataTable().destroy();

						var currenttime = $(this).val();
						console.log('currenttime:' + currenttime);

						$
								.ajax({
									type : 'get',
									//data:JSON.stringify(params),  
									contentType : 'application/json',
									url : '/querycourseaftercurrenttime/'
											+ currenttime,
									success : function(response) {
										console.log(JSON.stringify(response));
										var resultText = "";
										////////////////////////////////////////////////
										for (let i = 0; i < response[0].length; i++) {
											//console.log(response.length);												             	 
											//console.log(response[0][i].courseName);
											//console.log(response[1][i].teacherImage);

											resultText +=

											'<tr>'
													+

													'<td>'
													+ '<div class="d-flex px-2 py-1">'
													+ '<div class="d-flex flex-column justify-content-center">'
													+ '<h5 style="font-size: 10px;">'
													+ response[0][i].courseId
													+ '</h5>'
													+ '<p style="font-size: 10px;">'
													+ response[0][i].courseName
													+ '</p>'
													+ '<p style="font-size: 10px;">'
													+ response[0][i].courseDescription
													+ '</p>'
													+ '</div>'
													+ '</div>'
													+ '</td>'
													+

													'<td width="150">'
													+ '<img width=150 height=100 src="'+'images/'+ response[0][i].courseImage+'">'

													
													+

													'<td>'
													+ response[0][i].coursePrice
													+ '元'
													+ '</td>'
													+

													'<td>'
													+ response[0][i].fakeCourseDate
													+ '</td>'

													+ '<td>'
													+ '<div class="d-flex px-2 py-1">'
													+ '<div>'
													+
													//'<img src="images/'+response[i].Teacher.teacherImage+'" class="avatar avatar-m me-3">'
													//'<img src="'+'images/' + response[i].teacher.teacherImage + '">'+
													'<img src="'+'images/' + response[1][i].teacherImage + '" class="avatar avatar-m me-3">'
													+

													'</div>'
													+ '<div class="d-flex flex-column justify-content-center">'
													+ '<h6 class="mb-0 text-s">'
													+ response[1][i].teacherId
													+ '</h6>'
													+ '<p class=" text-secondary mb-0" style="font-size: 12px;">'
													+ response[1][i].teacherName
													+ '</p>'
													+ '</div>'
													+ '</div>'
													+ '</td>'
													+

													'<td>'
													+ response[0][i].classroomId
													+ '</td>'
													+

													'<td>'
													+ response[0][i].courseStyle
													+ '</td>'
													+

													'<td>'
													+

													'<button class="sendcourseid btn btn-success" value="'+ response[0][i].courseId+ '" >名單</button>'
													+

													'</td>'
													+

													'<td>'
													+ '<form action="beforeUpdateCourse" method="post">'
													+ '<input type="hidden" name="courseId" value='+ response[0][i].courseId+'>'
													+ '<button type="submit" class="btn btn-success">編輯</button>'
													+ '</form>'
													+ '</td>'
													+

													'<td>'
													+ '<form action="deleteCourse" method="post">'
													+ '<input type="hidden" name="courseId" value=' + response[0][i].courseId + '>'
													+ '<button type="button" class="btn btn-danger sweetalertdelete" value=' + response[0][i].courseId +'>刪除</button>'
													+ '</form>' + 
													'</td>'
													
													
													
													+ '</tr>'

											////////////////////////////////////////////////
											;

										}
										$("#result").html(resultText);
										//$('#myTable').DataTable();
									}
								});

					});
</script>

<!-- 已經結束的課程   -->

<script>
	$(document)
			.on(
					'click',
					'#queryBeforeCurrentTime',
					function() {

						//$('#myTable').DataTable().destroy();

						var currenttime = $(this).val();
						console.log('currenttime:' + currenttime);

						$
								.ajax({
									type : 'get',
									//data:JSON.stringify(params),  
									contentType : 'application/json',
									url : '/querycoursebeforecurrenttime/'
											+ currenttime,
									success : function(response) {
										console.log(JSON.stringify(response));
										var resultText = "";
										////////////////////////////////////////////////
										for (let i = 0; i < response[0].length; i++) {
											//console.log(response.length);												             	 
											//console.log(response[0][i].courseName);
											//console.log(response[1][i].teacherImage);

											resultText +=

											'<tr>'
													+

													'<td>'
													+ '<div class="d-flex px-2 py-1">'
													+ '<div class="d-flex flex-column justify-content-center">'
													+ '<h5 style="font-size: 10px;">'
													+ response[0][i].courseId
													+ '</h5>'
													+ '<p style="font-size: 10px;">'
													+ response[0][i].courseName
													+ '</p>'
													+ '<p style="font-size: 10px;">'
													+ response[0][i].courseDescription
													+ '</p>'
													+ '</div>'
													+ '</div>'
													+ '</td>'
													+

													'<td width="150">'
													+ '<img width=150 height=100 src="'+'images/'+ response[0][i].courseImage+'">'

													+ 

													'<td>'
													+ response[0][i].coursePrice
													+ '元'
													+ '</td>'
													+

													'<td>'
													+ response[0][i].fakeCourseDate
													+ '</td>'

													+ '<td>'
													+ '<div class="d-flex px-2 py-1">'
													+ '<div>'
													+
													//'<img src="images/'+response[i].Teacher.teacherImage+'" class="avatar avatar-m me-3">'
													//'<img src="'+'images/' + response[i].teacher.teacherImage + '">'+
													'<img src="'+'images/' + response[1][i].teacherImage + '" class="avatar avatar-m me-3">'
													+

													'</div>'
													+ '<div class="d-flex flex-column justify-content-center">'
													+ '<h6 class="mb-0 text-s">'
													+ response[1][i].teacherId
													+ '</h6>'
													+ '<p class=" text-secondary mb-0" style="font-size: 12px;">'
													+ response[1][i].teacherName
													+ '</p>'
													+ '</div>'
													+ '</div>'
													+ '</td>'
													+

													'<td>'
													+ response[0][i].classroomId
													+ '</td>'
													+

													'<td>'
													+ response[0][i].courseStyle
													+ '</td>'
													+

													'<td>'
													+

													'<button class="sendcourseid btn btn-success" value="'+ response[0][i].courseId+ '" >名單</button>'
													+

													'</td>'
													+

													'<td>'
													+ '<form action="beforeUpdateCourse" method="post">'
													+ '<input type="hidden" name="courseId" value='+ response[0][i].courseId+'>'
													+ '<button type="submit" class="btn btn-success">編輯</button>'
													+ '</form>'
													+ '</td>'
													+

													'<td>'
													+ '<form action="deleteCourse" method="post">'
													+ '<input type="hidden" name="courseId" value=' + response[0][i].courseId + '>'
													+ '<button type="button" class="btn btn-danger sweetalertdelete" value=' + response[0][i].courseId +'>刪除</button>'
													+ '</form>' + 
													'</td>'
													
													
													
													+ '</tr>'

											////////////////////////////////////////////////
											;

										}
										$("#result").html(resultText);
										//$('#myTable').DataTable();
									}
								});

					});
</script>







</head>

<body id="body" class="g-sidenav-show   bg-gray-100">



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

		<!-- ////////////////////////////////////////////////////// -->


		<!--////button們////-->
		<%
		TimeTest TT = new TimeTest();
		Long currenttime = TT.getTime();
		String stime = TT.TransLongToString(currenttime);
		Long ltime = TT.getLongFromString(stime);
		%>
		<button id="queryAfterCurrentTime" class=" btn btn-success"
			value="<%=ltime%>">查看尚未開始的課程</button>
		<button id="queryBeforeCurrentTime" class=" btn btn-success"
			value="<%=ltime%>">查看已經結束的課程</button>



		<button id="123" class="btn btn-success" value="" onclick="queryall()">搜全部</button>
		<input type="button" id="1122" class="sendstyle btn btn-success"
			value="技術類" />
		<!-- <button  class="sendstyle btn btn-success" value="技術類" >技術類</button> -->
		<button class="sendstyle btn btn-success" value="甜點類">甜點類</button>
		<button class="sendstyle btn btn-success" value="主食類">主食類</button>
		<button class="sendstyle btn btn-success" value="節慶套餐類">節慶套餐類</button>

		<!--  <button id="send" value="" class="btn btn-success">listAll</button>
		<button id="send" value="甜點類" class="btn btn-success">甜點類</button>
		<button id="send" value="主食類" class="btn btn-success">主食類</button>
		<button id="send" value="節慶套餐類" class="btn btn-success">節慶套餐類</button>-->


		<!-- ////////////////////////////////////////////////////// -->
		<div class="row">
			<div class="col-md-2">
				<div class="container text-left">
					<form action="beforeCourseInsert" method="post">
						<button type="submit" class="btn btn-info">新增課程</button>
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
					<table id="myTable"
						class="table align-items-center mb-0 order-table">
						<thead>
							<tr>
								<th>課程</th>
								<th></th>
								<th>價錢</th>
								<th>日期</th>
								<th><a href="http://localhost:8091/777">任課教師</a></th>
								<th>教室</th>
								<th>風格</th>
								<th>詳情</th>
								<th class="text-secondary opacity-7 4564645"></th>
								<th class="text-secondary opacity-7 4564645"></th>
							</tr>
						</thead>

						<tbody id="result">
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