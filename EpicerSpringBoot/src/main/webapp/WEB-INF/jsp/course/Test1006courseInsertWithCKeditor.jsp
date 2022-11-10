<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.epicer.model.course.*,com.epicer.controller.*,
com.epicer.util.*"%>
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

	
  
  
  
  
    <!-- sweetalert驗證空值 -->
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
                title: '新增',
                text: "新增前確定資料都完整嗎",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '新增'
            }).then((result) => {
                if (result.isConfirmed) {
                		Swal.fire(
                    	    '新增成功!',
                    	    '成功新增此筆課程',
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
		%>

		<h1>新增課程</h1>
		<div  class="p-4 bg-secondary">

			<form:form id="123" action="addCourse" method="post" modelAttribute="Course"
				enctype="multipart/form-data" >
				<table>
					<!-- courseName -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程名稱</label></td>
								<td><form:input type="text" path="courseName"
										class="form-control form-control-alternative need"
										id="exampleFormControlInput1" placeholder="請輸入課程名稱" /></td>
							</div>
						</div>
					</tr>

					<!-- coursePrice -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程價錢</label></td>
								<td><form:input type="number" path="coursePrice"
										class="form-control form-control-alternative need"
										id="exampleFormControlInput2" placeholder="請輸入課程價錢" /></td>
							</div>
						</div>
						</div>
					</tr>

					<!-- courseDescription -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程介紹</label></td>
								<td><form:textarea type="textarea" path="courseDescription"
										class="form-control need" id="exampleFormControlTextarea1"
										cols="40" rows="5" style="resize:none" placeholder="請輸入15格字內的課程描述" ></form:textarea></td>
							</div>
						</div>
						</div>
					</tr>


					<!-- courseDate -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程日期</label></td>
								<td><form:input type="date" path="fakeCourseDate"
										min="<%=stringDate%>" class="need" id="inputdate"/></td>
							</div>
						</div>
						</div>
					</tr>

					<!-- teacherId -->
					<!--  <tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>老師ID：</label></td>
								<td><form:input type="text" path="fakeTeacherID"
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
							<td><label>教室</label></td>
							<td><form:select path="classroomId"
									class="form-control form-control-alternative"
									id="exampleFormControlInput3" placeholder="name@example.com">
									<option>可選的教室</option>
									<option>101</option>
									<option>102</option>
									<option>103</option>
								</form:select></td>
						</div>
					</tr>


					<!--  <tr>
				<td><label>教室ID：</label></td>
				<td><form:input type="text" path="classroomId" /></td>
			</tr>-->

					<!-- courseStyle -->
					<tr>
						<div class="form-group">
							<td><label>課程類別</label></td>
							<td><form:select path="courseStyle"
									class="form-control form-control-alternative"
									id="exampleFormControlInput4" placeholder="name@example.com">
									<option>請選擇類別</option>
									<option>技術類</option>
									<option>主食類</option>
									<option>甜點類</option>
									<option>節慶套餐類</option>
								</form:select></td>
						</div>
					</tr>


					<!-- image -->
					<tr>
						<td><label>課程圖片</label></td>
						<td><input type="file" name="photo"
							class="form-control form-control-alternative need" id="Ann"
							placeholder="name@example.com" /></td>
						<td><img width=200 id="gmi" src=""></td>
					</tr>




					<tr>
						<td colspan="8">
							<button id ="save" type="button" value="Send" class="btn bg-gradient-primary" >提交新增</button>
						</td>
						
						<td>
						<button id="oneclick" type="button" class="btn bg-gradient-primary">一件輸入</button>
						</td>
					</tr>


					   <tr>
						<div id="container">
							<td><label>文字編輯器</label></td>
							<td><form:textarea id="editor" type="textarea"
									path="courseckeditor" ></form:textarea><td>
						</div>
					</tr> 
					
					<!--   <tr>
						<div id="container">
							<td><label>文字編輯器</label></td>
							<td><textarea id="editor" type="textarea">
							<h2>CKEditor Demo</h2>
  							<hr/>
  							<p>使用CKEditor，人生變得好簡單啊！</p>								
							</textarea><td>
						</div>
					</tr>-->


				</table>
			</form:form>
		</div>

		<!--  <div id="container">
			<div id="editor"></div>
		</div>-->



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




 	<!-- ckeditor開始 -->
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
            }).then(editor => {
                myEditor = editor;
                // 设置初始值
            });
        </script>
        
        
     <!-- 一件輸入 -->
	<script type="text/javascript">
	
		//let YourEditor;
        //ClassicEditor
          //  .create(document.querySelector('#editor'))
            //.then(editor => {
              //  window.editor = editor;
                //YourEditor = editor;
            	//})
	

	
	$("#oneclick").on("click",function(){
			
		
		document.getElementById("exampleFormControlInput1").value ="擺盤裝飾課程";
		document.getElementById("exampleFormControlInput2").value ="600";
		document.getElementById("exampleFormControlTextarea1").value ="想要駕馭擺盤藝術，請快點進來!";
		document.getElementById("exampleFormControlInput3").value ="101"; 
		document.getElementById("exampleFormControlInput4").value ="技術類";
		myEditor.setData('<h3 style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(255, 90, 0);font-family:Custom-Font-Medium, &quot;Microsoft JhengHei&quot;, Arial, sans-serif;font-size:1.25rem;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:normal;letter-spacing:normal;line-height:1.1em;margin-bottom:10px;margin-top:0px;orphans:2;position:relative;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;"><span style="font-size:22px;"><b style="box-sizing:border-box;font-family:Custom-Font-Bold, &quot;Microsoft JhengHei&quot;, Arial, sans-serif;"><strong>技法應用的基本觀念 &nbsp;用視覺刺激食慾</strong></b></span></h3><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(51, 51, 51);font-family:Custom-Font-Regular, &quot;Microsoft JhengHei&quot;, Arial, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;line-height:1.5rem;margin:5px 0px 20px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;"><span style="font-size:22px;">料理擺盤的心法，一般不出下列四大要點，高雄餐旅大學餐飲廚藝科專任副教授屠國城獨家心法大公開，想要讓料理色香味俱全之餘，又能更具質感，快跟著大師學擺盤。</span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(51, 51, 51);font-family:Custom-Font-Regular, &quot;Microsoft JhengHei&quot;, Arial, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;line-height:1.5rem;margin:5px 0px 20px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;">&nbsp;</p><figure class="image"><img src="data:image/jpeg;base64,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"><figcaption>國宴主廚親自教你擺盤技術ㄧ</figcaption></figure><p>&nbsp;</p>');
	})
	</script>
        
   	<!-- ckeditor結束 -->
        
    <!-- sweetalert開始 --> 
       
       
       
       
       
    <!-- sweetalert結束 -->    

</body>

</html>