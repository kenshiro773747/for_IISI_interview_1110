<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘記密碼</title>
 <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<%@ include file="../frontincludes/epicerNavbar.jsp" %>
<div style="font-size:150px">&emsp;</div>
<div class="container">
<div class="forms">
<div class="form loign">
<span class="title">Vertify Your Email</span>
    <div class="inputfeild">
        <input type="text" name="password" id="password" placeholder="請輸入新密碼" required>
        <i class="uil uil-envelope-alt icon"></i>
    </div>
    <div class="inputfeild">
        <input type="text" name="again" id="again" placeholder="請再次輸入密碼" required>
        <i class="uil uil-envelope-alt icon"></i>
    </div>
    <span id="sp1" class="msg"></span><br>
     <span id="sp2" class="msg"></span>
      <input type="hidden" name="id" id="userid"  value="${vertify.getId()}">
    <div class="inputfeild button">
        <button value="Vertify Now" id="action">Vertify Now</button>
    </div>
    <h4><a href="homepage">回到首頁</a></h4>
</div>
</div>
</div>
<script src="js/jquery-3.6.0.js"></script>
<script src="js/sweetalert2.all.min.js"></script>
<script src="js/login.js"></script>
<script>
$(function(){
 $('#action').click(function(){
	 var password = $('#password').val();
	 var again = $('#again').val();
	 var id = $('#userid').val();
	 console.log(password)
	 console.log(id)
	  if($.trim(password)=="" || $.trim(again)==""){
		  Swal.fire({
						  icon: 'error',
						  title: 'Oops...',
						  text: '兩者皆為必填!',
						})
		  return;
	  }else if(password !== again){
		  Swal.fire({
			  icon: 'error',
			  title: 'Oops...',
			  text: '驗證密碼與密碼不同',
			})
		  return;
	  }else{
		  var user ={
				  "id":''+id,
				  "password":''+password
		  }
		  
		  $.ajax({
			  type:"POST",
			  url:"/dochangepassword",
			  contentType:'application/json',
			  data:JSON.stringify(user),
			  success:function(data){
				  console.log(data);
				  if(data=='typeerror'){
					Swal.fire({
						  icon: 'error',
						  title: 'Oops...',
						  text: '修改格式錯誤!',
						})
				  }else if(data=='updateok'){
					 $('#password').prop("disabled","disabled");
					  $('#again').prop("disabled","disabled");
					  $('#action').prop("disabled","disabled");
					  Swal.fire({
						  icon: 'success',
						  title: '更新成功！',
						  text: '更新密碼成功，請重新登入',
						})
				  }else{
					  Swal.fire({
						  icon: 'error',
						  title: 'Oops...',
						  text: '系統錯誤，請通知管理員!',
						})
				  }
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax
	  } //else
 }); //click
})//底
</script>
</body>
</html>