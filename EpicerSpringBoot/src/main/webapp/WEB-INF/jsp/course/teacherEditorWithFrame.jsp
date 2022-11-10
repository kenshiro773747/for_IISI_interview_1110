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
<!-- SweetAlert開始 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script type="text/javascript">

    $(function () {

        $('#123').on('click', '#save', function () {
        	
        	
			/////////////////////////
        	var res = false;
        	var errorMsg = '未填資料行:<br>';
        	
       	
        	$('.need').each(function(){
        		       		
        		if($(this).val()==""){
        			errorMsg+= '<font style="color:red">'+$(this).parent().prev().children().text()+'<br>'+'</font>';
        			res=true;
        		}       		
        		});
        	
        	if(res){
        			Swal.fire({  
        						title:'你的資料不完整喔',
        					  	html:errorMsg,
        					  	icon:'question'
        						})
        		console.log(errorMsg);
        		return;
        	};
        	
        	///////////////////////////////

            Swal.fire({
                title: '編輯',
                text: "更新前確定資料都完整嗎",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '更新'
            }).then((result) => {
                if (result.isConfirmed) {
                		Swal.fire(
                    	    '更新成功!',
                    	    '成功更新此筆',
                    	    'success'
                    	).then((result) => {
                    		 $('#123').submit();	
	                		console.log("123="+$(this).val())
                    	})
                	}
            })

        });
    });

</script>





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
		Teacher oldTeacher = (Teacher) request.getAttribute("Teacher");
		%>


		<h1>修改</h1>

<div class="card" style="float: left;">
		<div class="p-4 bg-secondary">
			<form:form id="123" action="updateTeacher" method="post"
				modelAttribute="Teacher" enctype="multipart/form-data">
				<table>
					<div class="row">
						<!-- courseId -->
						<form:input type="hidden" path="teacherId" />


						<!-- teacherName -->
						<tr>
							<div class="col-md-6">
								<div class="form-group">
									<td><label>姓名</label></td>
									<td><form:input type="text" path="teacherName"
											class="form-control form-control-alternative need"
											id="exampleFormControlInput1" placeholder="請輸入中文姓名" /></td>
								</div>
							</div>
						</tr>

						<!-- teacherDescription -->
						<tr>
							<div class="col-md-6">
								<div class="form-group">
									<td><label>描述</label></td>
									<td><form:textarea type="textarea"
											path="teacherDescription" class="form-control need"
											id="exampleFormControlTextarea1" cols="40" rows="5"
											style="resize:none" placeholder="請輸入相關資訊"></form:textarea></td>
								</div>
							</div>
					</div>
					</tr>

					<!-- teacherStatus -->
					<tr>
						<div class="form-group">
							<td><label>狀態</label></td>
							<td><form:select path="teacherStatus"
									class="form-control form-control-alternative need"
									id="exampleFormControlInput1" placeholder="name@example.com">
									<option><%=oldTeacher.getTeacherStatus()%></option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
								</form:select></td>
						</div>
					</tr>

					<!-- image -->
					<tr>
						<td><label>頭貼</label></td>
						<td><input type="file" name="photo"
							class="form-control form-control-alternative " id="Ann"
							placeholder="name@example.com" /></td>

						<input type="hidden" name="oldimg"
							value="<%=oldTeacher.getTeacherImage()%>" />
						<td><img width=100  id="gmi" src=""></td>
					</tr>

					<!-- teacherPhone -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>電話</label></td>
								<td><form:input type="text" path="teacherPhone"
										class="form-control form-control-alternative need"
										id="exampleFormControlInput1" placeholder="請輸入能找的到人的電話" /></td>
							</div>
						</div>
					</tr>


					<!-- courseDate -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>生日：</label></td>
								<td><form:input type="date" path="teacherBirthday"
										class="form-control form-control-alternative need"
										id="exampleFormControlInput1" /></td>
							</div>
						</div>

					</tr>

					<tr>
						<td><span class="detail">縣市</span></td>
						<td><div class="twzipcode "></div></td>
					</tr>

					<tr>
						<td><span class="detail">地址</span></td>
						<td><input type="text" id="road" name="road" class="need"></td>
					</tr>

					<tr>
						<td colspan="8"><form:button id="save" type="button" value="Send"
								class="btn bg-gradient-primary">提交更新</form:button></td>
					</tr>

</div>



					<!--/////////////////////////////////////////  -->
					<!-- card -->

					<div class="card" style="float: right;">
						<div class="card-header p-0 mx-3 mt-3 position-relative z-index-1">
							<a href="javascript:;" class="d-block"> <img
								src="images/<%=oldTeacher.getTeacherImage()%>"
								class="img-fluid border-radius-lg" width=100 height=100>
							</a>
						</div>

						<div class="card-body pt-2">
							<span
								class="text-gradient text-primary text-uppercase text-xs font-weight-bold my-2"><%=oldTeacher.getTeacherId()%></span>
							<p class="card-title h5 d-block text-darker">
								<%=oldTeacher.getTeacherName()%>
								老師的課程
							</p>


							<div class="author align-items-center">
							<% 
							Set<Course> teachersCourse = oldTeacher.getCourse();
							for (Course cd : teachersCourse) {
							%>
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
							<%
							}
							%>
							
							
							
							</div>


						</div>
					</div>

				</table>
			</form:form>
		</div>




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
	<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#Ann').on('change', function(e) {
				const file = this.files[0];//將上傳檔案轉換為base64字串
				const fr = new FileReader();//建立FileReader物件
				fr.onload = function(e) {
					$('#gmi').attr('src', e.target.result);//读取的结果放入圖片
				};
				// 使用 readAsDataURL 將圖片轉成 Base64
				fr.readAsDataURL(file);
			});
		});
	</script>
	<script type="text/javascript" src="js/test.js"></script>
	<script>
		const twzipcode = new TWzipcode(".twzipcode");
	</script>
	<script>
		$(function() {
			$('.twzipcode').twzipcode({
				required : true
			});
		});
	</script>

</body>

</html>