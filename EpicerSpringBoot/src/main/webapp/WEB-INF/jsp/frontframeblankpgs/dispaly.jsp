<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- //////  會員登入畫面 ////// -->    

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
<style>
.msg{
color:red;
font-weight:bold

}

select{
	border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: gray;
  background-color:#fff;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 12px;
   border: 1px solid #ccc;
}


</style>
</head>
<body id="body">
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>


<!-- 主文內容 開始 -->
<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
          <a class="logo" href="index.html">
            <img src="images/logo.png" alt="" style="width:300px">
          </a>
          <h2 class="text-center">確認您輸入的資料</h2>
          <form class="text-left clearfix" action="vertifymail" method="post">
          
            <div class="form-group">
              <input type="text" id="name" name="name" class="form-control"  value="${user.getName()}" disabled>
            </div>
            
             <div class="form-group" style="text-align: center">
              <input type="text" class="form-control"  name="gender"  value="${sgender}" disabled>
            </div>
            
            <div class="form-group">
              <input type="text" id="birth" name="birth"  class="form-control"  value="${sbirth}" disabled>
            </div>
            
            <div class="form-group">
              <input type="email" id="account" name="account" class="form-control"  value="${user.getAccount()}" disabled>
            </div>
            
            <div class="form-group">
              <input type="text"  id="password" name="password" value="${user.getPassword()}" class="form-control"  disabled>
            </div>
            
            <div class="form-group">
              <input type="text" id="phone" name="phone" class="form-control"  value="${user.getPhone()}" disabled>
               <span id="sp6" class="msg"></span>
            </div>
            
            <div class="form-group">
             <input type="text" id="road" name="road"  class="form-control"  value="${scity}${user.getTownship()}" disabled>
            </div>
            
            <div class="form-group">
              <input type="text" id="road" name="road"  class="form-control" value="${user.getAddress()}" disabled>
            </div>
            
            <div class="text-center">
              <button type="submit" name="chose" id="commit" class="btn btn-main text-center" value="送出">送出</button>
              <button type="submit" name="chose" id="commit" class="btn btn-main text-center" value="返回">返回</button>
            </div>
            
          </form>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- 主文內容 結束 -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>
</body>
</html>