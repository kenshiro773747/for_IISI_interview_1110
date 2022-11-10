<%@ page import="java.util.*,com.epicer.model.users.*,com.epicer.util.*"  language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer Admin System</title>

<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLindHead (結束) -->
  <style>
    body{
   background-color: antiquewhite;
    }
    
    
    #table_id_length{
     margin-left: 150px;
    
    }
    
   #table_id_filter{
    margin-left: 140px;
    margin-top:15px;
      margin-bottom: 15px;
   }
   
   #table_id_info{
    margin-top:15px;
   margin-bottom: 15px;
   margin-left: 190px;
   }
   
    #table_id_paginate{
    margin-top:15px;
      margin-bottom: 15px;
   margin-left: 190px;
   }
    
    .center {
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  width: 80%;
  background-color:#fff;
  opacity: 1;
  border: 1px  solid transparents;
  border-radius: 15px;
  }
  
  select {
 background-color:#fff;
  opacity: 1;
  margin: 15px;
  width: 300px;
  height: 3em;
  padding: 8px;
  border-radius: 5px;
  }
  
  input{
  background-color:#fff;
  opacity: 1;
  margin: 15px;
  width: 100px;
  height: 3em;
  padding: 8px;
  border: 1px  solid transparents;
  border-radius: 5px;
  }
  
  button{
  background-color:#fff;
  opacity: 1;
  margin: 15px;
  width: 100px;
  height: 3em;
  padding: 8px;
  border: 1px  solid transparents;
  border-radius: 5px;
  }
 
   
   .down{
     margin-left: auto;
  margin-right: auto;
    }
    
    
   .table{
text-align: center;
margin-left:150px;
background: white;
border: 1px solid transparent;
border-radius: 5px;

}



.popup-overlay {
visibility:hidden;
}

.popup-content {
visibility:hidden;
}


.popup-overlay.active{
visibility:visible;
}

.popup-content.active {
visibility:visible;
}

fieldset {
	            width: 900px;
                border-radius: 15px;
                margin: 20px auto;
                background-color: white;
}

    
    
    </style>
    
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
<!-- CSV -->
<div style="Clear: left">
<select id="chose" style="width:200px;text-align: center">
<option value="1">性別統計</option>
<option value="2">年齡統計</option>
<option value="3">地區統計</option>
</select>
<select id="append" style="width:200px;text-align: center">
</select>
<button name="preview" id="preview" class="btn btn-info open" >預覽</button><span id="export">&ensp;</span>
</div>
<!--Creates the popup body-->
<div class="popup-overlay">
<!--Creates the popup content-->
 <div class="popup-content" style="width:1400px">  
 <button class="btn btn-danger close" style="width:80px">關閉</button>  
</div>
</div>

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
  <script
  src="https://code.jquery.com/jquery-3.6.1.js"
  integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
  crossorigin="anonymous"></script>
    <script src="js/sweetalert2.all.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script>
$(function(){
	
	/**********************匯出PDF****************************/
	$('#pdf').on('click',function(){
		var pdfchose= $('#pdfchose').val();
		console.log(pdfchose);
		$.ajax({
			  type:"POST",
			  url:"/exportpdf123",
			  contentType:'application/json',
		      data:pdfchose,
			  success:function(res){
				 
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax
		
	}); //change
	
	

	/**********************************各個選項*************************************/	
	
	$('#chose').on('change',function(){
		var chose= $('#chose').val();
		console.log(chose);
		if(chose==1){
			$( ".age" ).remove();
			$( ".city" ).remove();
			$('#append').append('<option class="gender" value="male">男性</option><option class="gender" value="female">女性</option>');	
			return;
		}else if(chose==2){
			$( ".gender" ).remove();
			$( ".city" ).remove();
			$('#append').append('<option class="age" value="eighteen">18-28歲</option><option class="age" value="twenty">29-39歲</option><option class="age" value="fourty">40-50歲</option><option class="age" value="fifty">51-61歲</option><option class="age" value="sixty">61歲以上</option>');		
		return;
		}else{
			$( ".age" ).remove();
			$( ".gender" ).remove();
			$('#append').append('<option class="city" value="north">北部</option><option class="city" value="center">中部</option><option class="city" value="south">南部</option><option class="city" value="east">東部</option><option class="city" value="island">離島</option>');	
			return;
		}
	}); //change

	/*********************************查詢分流**************************************/	
	$('#preview').on('click',function(){
		var chose = $('#chose').val()
		console.log(chose)
		if(chose==1){
			genderPreview();
		}else if (chose==2){
			genderPreview();
		}else{
			genderPreview();
		}
	})
	
/***********************************性別預覽************************************/	
	function genderPreview(){
		$(".popup, .popup-content").addClass("active");
		var app = $('#append').val()
		console.log(app);
		$.ajax({
			  type:"PUT",
			  url:"/gendertable",
			  contentType:'application/json',
		      data:app,
			  success:function(res){
				 resulttext=""
				console.log(res)
				var d = new Date(res[0].birth).toLocaleDateString();
				 console.log(d)
				for(let i=0;i<res.length;i++){
					
					var strd = new Date(res[i].birth).toLocaleDateString();
					var strl = new Date(res[i].logindate).toLocaleDateString();
					
					var strgender =""
					if(res[i].gender=='1'){
						strgender ="男"
					}else{
						strgender ="女"
					}
					
					
					var desstatus=""
					if(res[i].status =='0'){
						desstatus="管理者"
					}else if(res[i].status =='1'){
						desstatus="一般會員"
					}else if(res[i].status =='3'){
						desstatus="臨時會員"
					}else{
						desstatus="已停權"
					}
					
					var row=
					'<tr>'
					+'<td>'+res[i].id+'</td>'
					+'<td>'+desstatus+'</td>'
					+'<td>'+res[i].name+'</td>'
					+'<td>'+strgender+'</td>'
					+'<td>'+res[i].account+'</td>'
					+'<td>'+strd+'</td>'
					+'<td>'+res[i].phone+'</td>'
					+'<td>'+res[i].address+'</td>'
					+'<td>'+strl+'</td>'
					+'<td>'+" "+'</td>'
					+'</tr>'
					resulttext+=row;
				}
                   var table='<table id="previewtable" class="table align-items-center mb-0">'				 
				 
				$('.popup-content').append(table+'<tr><th>ID</th> <th>權限</th> <th>姓名</th> <th>性別</th> <th>帳號</th> <th>出生/年/月/日</th>  <th>聯絡電話</th><th>完整地址</th> <th>上次登錄</th> <th>備註</th> </tr>'+resulttext+'</table>');
				$('.popup-content').css("display", "block");
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax
	}
	
/********************************彈跳視窗***************************************/
	
	$(".close, .popup").on("click", function(){
		$('#previewtable').remove();
		$(".popup, .popup-content").removeClass("active");
		});//click
	
	
/*******************************匯出檔案****************************************/	
	$('#append').on("change", function(){
		var a = $('#append').val();
		console.log(a);
		var url='http://localhost:8091/exportcsv123/'+a
		var exportcsv='<a href="'+url+'"><button class="btn btn-info">匯出</button></a>'
	    $('#export').html(exportcsv)
		console.log(exportcsv);
		})//click
}); //底
</script>
</body>
</html>