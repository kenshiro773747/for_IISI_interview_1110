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
                    	    '成功更新此筆課程',
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
	Course oldCourse = (Course) request.getAttribute("Course");
	int oldCourseId = oldCourse.getCourseId();
	System.out.println("我在courseEditor.jsp,待修改課程ID:" + oldCourseId);
	%>


		<h1>修改課程</h1>

		<!-- <form:form action="updateCourse" method="post" modelAttribute="Course"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td><form:input type="hidden" path="courseId" /></td>
			</tr>
			<tr>
				<td><label>課程名稱:</label></td>
				<td><form:input type="text" path="courseName" /></td>
			</tr>
			<tr>
				<td><label>課程價錢：</label></td>
				<td><form:input type="text" path="coursePrice" /></td>
			</tr>
			<tr>
				<td><label>課程介紹：</label></td>
				<td><form:input type="text" path="courseDescription" /></td>
			</tr>
			<tr>
				<td><label>課程日期：</label></td>
				<td><form:input type="date" path="fakeCourseDate"
						min="<%=stringDate%>"
						value="<%=TT.TransLongToString(oldCourse.getCourseDate())%>" /></td>
			</tr>
			<tr>
				<td><label>老師ID：</label></td>
				<td><form:input type="text" path="fakeTeacherID"
						value="<%=oldCourse.getTeacher().getTeacherId()%>" /></td>
			</tr>
			<tr>
				<td><label>教室：</label></td>
				<td><form:select path="classroomId" id="classroom">
						<option><%=oldCourse.getClassroomId()%></option>
						<option>101</option>
						<option>102</option>
						<option>103</option>
					</form:select></td>
			</tr>
			<tr>
				<td><label>風格：</label></td>
				<td><form:input type="text" path="courseStyle" /></td>
			</tr>
			<tr>
				<td><label>圖片：</label></td>
				<td><input type="file" name="photo" /></td>
				<td><img width=150 src="images/<%=oldCourse.getCourseImage()%>"></td>
				<input type="hidden" name="oldimg"
					value="<%=oldCourse.getCourseImage()%>" />
			</tr>

			<tr>
				<td colspan="9"><form:button type="submit" value="Send">提交更新</form:button></td>
			</tr>
			  <input id="123" type="hidden"value="102" />
		</table>
	</form:form>-->


		<div class="p-4 bg-secondary">
			<form:form id="123" action="updateCourse" method="post"
				modelAttribute="Course" enctype="multipart/form-data">
				<table>
					<div class="row">
						<!-- courseId -->
						<form:input type="hidden" path="courseId" />


						<!-- courseName -->
						<tr>
							<div class="col-md-6">
								<div class="form-group">
									<td><label>課程名稱:</label></td>
									<td><form:input type="text" path="courseName"
											class="form-control form-control-alternative need"
											id="exampleFormControlInput1" placeholder="name@example.com" /></td>
								</div>
							</div>
						</tr>

						<!-- coursePrice -->
						<tr>
							<div class="col-md-6">
								<div class="form-group">
									<td><label>課程價錢：</label></td>
									<td><form:input type="text" path="coursePrice"
											class="form-control form-control-alternative need"
											id="exampleFormControlInput1" placeholder="name@example.com" /></td>
								</div>
							</div>
					</div>
					</tr>

					<!-- courseDescription -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程介紹：</label></td>
								<td><form:textarea type="textarea" path="courseDescription"
										class="form-control need" id="exampleFormControlTextarea1"
										cols="40" rows="5" style="resize:none"></form:textarea></td>
							</div>
						</div>
						</div>
					</tr>

					<!-- courseDate -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程日期：</label></td>
								<td><form:input type="date" path="fakeCourseDate"
										min="<%=stringDate%>"
										value="<%=TT.TransLongToString(oldCourse.getCourseDate())%>" class="need"/></td>
							</div>
						</div>
						</div>
					</tr>

					<!--  <tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程日期：</label></td>
								<td><input type="date" name="localdatetime" 
										min="<%=stringDate%>"
										value="<%=TT.TransLongToString(oldCourse.getCourseDate())%>"
										/></td>
							</div>
						</div>
						</div>
					</tr>-->

					<!-- teacherId -->
					<!--  <tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>老師ID：</label></td>
								<td><form:input type="text" path="fakeTeacherID"
										value="<%=oldCourse.getTeacher().getTeacherId()%>"
										class="form-control form-control-alternative"
										id="exampleFormControlInput1" placeholder="name@example.com" /></td>
							</div>
						</div>
						</div>
					</tr>-->

					<!-- 1015測試老師 -->
					<!-- 測試下拉式選單 -->
					<tr>
						<div class="form-group">
							<td><label>老師</label></td>
							<td><select name="getTeacherByName"
									class="form-control form-control-alternative"
									id="exampleFormControlInput1">
									<option>可選的老師</option>
									<%
									List<Teacher> list = (List<Teacher>) request.getAttribute("listAll");
									for (Teacher t : list) {
									%>
									<option><%=t.getTeacherName()%></option>
									<%
									}
									%>
								</select></td>
						</div>
					</tr>

					<!-- classroomId -->
					<tr>
						<div class="form-group">
							<td><label>教室：</label></td>
							<td><form:select path="classroomId"
									class="form-control form-control-alternative"
									id="exampleFormControlInput1" placeholder="name@example.com">
									<option><%=oldCourse.getClassroomId()%></option>
									<option>101</option>
									<option>102</option>
									<option>103</option>
								</form:select></td>
						</div>
					</tr>

					<!-- courseStyle -->
					<tr>
						<div class="form-group">
							<td><label>課程類別：</label></td>
							<td><form:select path="courseStyle"
									class="form-control form-control-alternative"
									id="exampleFormControlInput1" placeholder="name@example.com">
									<option><%=oldCourse.getCourseStyle()%></option>
									<option>技術類</option>
									<option>主食類</option>
									<option>甜點類</option>
									<option>節慶套餐類</option>
								</form:select></td>
						</div>
					</tr>

					<!-- image -->
					<tr>
						<td><label>課程圖片：</label></td>
						<td><input type="file" name="photo"
							class="form-control form-control-alternative " id="Ann"
							placeholder="name@example.com" /></td>
						<!--  <td><img width=150
							src="images/<%=oldCourse.getCourseImage()%>"></td>-->
						<input type="hidden" name="oldimg"
							value="<%=oldCourse.getCourseImage()%>" />
						<td><img width=100 id="gmi" src=""></td>
					</tr>

					<!-- <img width=500 src="images/<%=oldCourse.getCourseImage()%>"> -->




					<tr>
						<td colspan="9"><form:button id="save" type="button" value="Send"
								class="btn bg-gradient-primary">提交更新</form:button></td>
					</tr>



					<tr>
						<div id="container">
							<td><label>ckeditor：</label></td>
							<td><form:textarea id="editor" type="textarea"
									path="courseckeditor"></form:textarea>
							<td>
						</div>
					</tr>



					<!--/////////////////////////////////////////  -->
					<!-- card -->

					<div class="card" style="float: right;">
						<div class="card-header p-0 mx-3 mt-3 position-relative z-index-1">
							<a href="javascript:;" class="d-block"> <img
								src="images/<%=oldCourse.getCourseImage()%>"
								class="img-fluid border-radius-lg" width=400>
							</a>
						</div>

						<div class="card-body pt-2">
							<span
								class="text-gradient text-primary text-uppercase text-xs font-weight-bold my-2"><%=oldCourse.getCourseId()%></span>
							<a href="javascript:;" class="card-title h5 d-block text-darker">
								<%=oldCourse.getCourseName()%></a>
							<p class="card-description mb-4"><%=oldCourse.getCourseDescription()%></p>
							<div class="author align-items-center">
								<img src="images/<%=oldCourse.getTeacher().getTeacherImage()%> "
									class="avatar shadow">
								<div class="name ps-3">
									<span><%=oldCourse.getTeacher().getTeacherId()%></span>
									<div class="stats">
										<small><%=oldCourse.getTeacher().getTeacherName()%></small>
									</div>
								</div>
							</div>
						</div>
					</div>

				</table>
			</form:form>
		</div>

		<!-- ckeditor style -->
		<style>
#container {
	width: 1000px;
	margin: 20px auto;
}

.ck-editor__editable[role="textbox"] {
	/* editing area */
	min-height: 200px;
}

.ck-content .image {
	/* block images */
	max-width: 80%;
	margin: 20px auto;
}
</style>

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

	<!-- ckeditor -->
	<script
		src="https://cdn.ckeditor.com/ckeditor5/35.2.0/super-build/ckeditor.js"></script>
	<!--
            Uncomment to load the Spanish translation
            <script src="https://cdn.ckeditor.com/ckeditor5/35.2.0/super-build/translations/es.js"></script>
        -->
	<script>
            // This sample still does not showcase all CKEditor 5 features (!)
            // Visit https://ckeditor.com/docs/ckeditor5/latest/features/index.html to browse all the features.
            CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
                // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
                toolbar: {
                    items: [
                        'exportPDF','exportWord', '|',
                        'findAndReplace', 'selectAll', '|',
                        'heading', '|',
                        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                        'bulletedList', 'numberedList', 'todoList', '|',
                        'outdent', 'indent', '|',
                        'undo', 'redo',
                        '-',
                        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                        'alignment', '|',
                        'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                        'textPartLanguage', '|',
                        'sourceEditing'
                    ],
                    shouldNotGroupWhenFull: true
                },
                // Changing the language of the interface requires loading the language file using the <script> tag.
                // language: 'es',
                list: {
                    properties: {
                        styles: true,
                        startIndex: true,
                        reversed: true
                    }
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
                heading: {
                    options: [
                        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                        { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
                        { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
                        { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
                        { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
                    ]
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
                placeholder: 'Welcome to CKEditor 5!',
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
                fontFamily: {
                    options: [
                        'default',
                        'Arial, Helvetica, sans-serif',
                        'Courier New, Courier, monospace',
                        'Georgia, serif',
                        'Lucida Sans Unicode, Lucida Grande, sans-serif',
                        'Tahoma, Geneva, sans-serif',
                        'Times New Roman, Times, serif',
                        'Trebuchet MS, Helvetica, sans-serif',
                        'Verdana, Geneva, sans-serif'
                    ],
                    supportAllValues: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
                fontSize: {
                    options: [ 10, 12, 14, 'default', 18, 20, 22 ],
                    supportAllValues: true
                },
                // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
                // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
                htmlSupport: {
                    allow: [
                        {
                            name: /.*/,
                            attributes: true,
                            classes: true,
                            styles: true
                        }
                    ]
                },
                // Be careful with enabling previews
                // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
                htmlEmbed: {
                    showPreviews: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
                link: {
                    decorators: {
                        addTargetToExternalLinks: true,
                        defaultProtocol: 'https://',
                        toggleDownloadable: {
                            mode: 'manual',
                            label: 'Downloadable',
                            attributes: {
                                download: 'file'
                            }
                        }
                    }
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
                mention: {
                    feeds: [
                        {
                            marker: '@',
                            feed: [
                                '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                                '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                                '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                                '@sugar', '@sweet', '@topping', '@wafer'
                            ],
                            minimumCharacters: 1
                        }
                    ]
                },
                // The "super-build" contains more premium features that require additional configuration, disable them below.
                // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
                removePlugins: [
                    // These two are commercial, but you can try them out without registering to a trial.
                    // 'ExportPdf',
                    // 'ExportWord',
                    'CKBox',
                    'CKFinder',
                    'EasyImage',
                    // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
                    // Storing images as Base64 is usually a very bad idea.
                    // Replace it on production website with other solutions:
                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
                    // 'Base64UploadAdapter',
                    'RealTimeCollaborativeComments',
                    'RealTimeCollaborativeTrackChanges',
                    'RealTimeCollaborativeRevisionHistory',
                    'PresenceList',
                    'Comments',
                    'TrackChanges',
                    'TrackChangesData',
                    'RevisionHistory',
                    'Pagination',
                    'WProofreader',
                    // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
                    // from a local file system (file://) - load this site via HTTP server if you enable MathType
                    'MathType'
                ]
            });
        </script>

	<!-- ckeditor結束 -->

</body>

</html>