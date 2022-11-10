<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ////// 登入畫面  //////// -->

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<style>
.msg{
color:red;

}

.msg2{
color:blue;

}


</style>
<body id="body">


<!-- 主文內容 開始 -->

<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
          <a class="logo" href="index.html">
            <img src="./source/images/epicerlogowhite.jpg" alt="" width="50%">
          </a>
          <h2 class="text-center">歡迎回來Epicer</h2>
          <form class="text-left clearfix" action="userlogin" method="post" >
            <div class="form-group">
              <input type="email" class="form-control" name="account" id="account" placeholder="信箱"  value="${account}"  required>
              <span id="sp1" class="msg"></span> <span class="msg2">${msga.getMessage()}</span><br>
            </div>
            <div class="form-group">
              <input type="password" class="form-control" name="password" id="password" placeholder="密碼"  required>
               <span id="sp2" class="msg"></span><span class="msg2">${msgp.getMessage()}</span><br>
            </div>
            <div class="text-center">
              <button type="submit" class="btn btn-main text-center" >登錄</button>
            </div>
          </form>
          <p class="mt-20">你新來的喔 ?<a href="form">成為我們的會員</a></p>
           <p class="mt-20">忘記密碼喔 ?<a href="forgetpassword">忘記密碼</a>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>
<script src="js/jquery-3.6.0.js"></script>
<script src="js/login.js"></script>
<script>
/*
$(function(){
	
	
	
	
	var account = $('#account').val();
	var password =$('#password').val();
	if($.trim(account) =="" ||$.trim(password)== "" ){
		Swal.fire({
			  icon: 'error',
			  title: '帳號或密碼為必填',
			})	
	}else{
		var user ={
				"account":''+account,
				"password":''+password
		}
	 
		
		$.ajax({
			type:"post",
			url:"",
			contentType:"application/json",
			data:JSON.stringify(user),
			success:function(data){
			if(data ==''){
				
			}	
			},
			
		})
		
		
	}
}) //底
*/
</script>
</body>
</html>