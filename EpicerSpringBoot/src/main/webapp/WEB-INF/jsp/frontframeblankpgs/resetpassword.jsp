<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ////// 忘記密碼 ////// -->

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">

<!-- 主文內容 開始 -->

<section class="forget-password-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
          <a class="logo" href="index.html">
            <img src="./source/images/epicerlogowhite.jpg" alt="" width="50%">
          </a>
          <h2 class="text-center">重置您的密碼</h2>
            <p>請輸入您的要重置的密碼。</p>
            <div class="form-group">
              <input type="text" name="password" id="password" placeholder="請輸入新密碼" class="form-control"  placeholder="請輸人您註冊的信箱" required>
            </div>
            <div class="form-group">
              <input type="text" name="again" id="again" placeholder="請再次輸入密碼"  class="form-control"  required>
            </div>
     <span id="sp2" class="msg"></span>
      <input type="hidden" name="id" id="userid"  value="${vertify.getId()}">
            <div class="text-center">
              <button  value="Vertify Now" id="action" class="btn btn-main text-center">確認</button>
            </div>
          <p class="mt-20"><a href='${pageContext.request.contextPath}/homepage'>回到首頁</a></p>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>
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