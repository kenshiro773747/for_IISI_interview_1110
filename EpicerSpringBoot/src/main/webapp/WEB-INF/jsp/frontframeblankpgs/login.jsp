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
          <form class="text-left clearfix"  method="post" action="/login" >
            <div class="form-group">
              <input type="email" class="form-control" name="username" id="username" placeholder="信箱" required>
              <span id="sp1" class="msg"></span>
            </div>
            <div class="form-group">
              <input type="password" class="form-control"name="password" id="password" placeholder="密碼" required>
              <span id="sp2" class="msg"></span>
            </div>
          <label>
        <input type="checkbox" checked="checked" name="remember">記得我
      </label>
            <div class="text-center">
              <button type="submit"  class="btn btn-secondary" >登錄</button>
               <button  class="btn btn-success" ><a href="oauth2/authorization/google" style="color:white">Google登錄</a></button>
            </div>
          </form>
          <p class="mt-20">你新來的喔 ?<a href="form">成為我們的會員</a></p>
           <p class="mt-20">忘記密碼喔 ?<a href="forgetpassword">忘記密碼</a>
        </div>
      </div>
    </div>
  </div>
</section>

<button id="user" class="btn btn-success" >會員登錄</button>
<button id="teacher"  class="btn btn-default" >老師登錄</button>
 <button id="admin" class="btn btn-danger" >管理者登錄</button>
<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>
<script src="js/jquery-3.6.0.js"></script>
<script src="js/login.js"></script>
<script>

$(function(){
	
  $('#user').on('click',function(){
	  $('#username').val('thpeeit49@gmail.com');
	   $('#password').val('asdf1234');
  })
  
   $('#teacher').on('click',function(){
	  $('#username').val('thpeeit49@gmail.com');
	   $('#password').val('asdf1234');
  })
  
  $('#admin').on('click',function(){
	  $('#username').val('epicer123@epicer.com');
	   $('#password').val('asdf1234');
  })
	
	
}) //底

</script>

</body>
</html>