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
          <h2 class="text-center">歡迎回來Epicer</h2>
            <p>請輸入您的註冊信箱，我們將發送驗證信至您的信箱，以重置您的密碼。</p>
            <div class="form-group">
              <input type="email" name="account"  class="form-control" id="account" placeholder="請輸人您註冊的信箱" required>
            </div>
            <div class="text-center">
              <button  id="action" class="btn btn-main text-center">確認</button>
            </div>
          <p class="mt-20"><a href="homepage">回到首頁</a></p>
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
<script src="js/sweetalert2.all.min.js"></script>
<script>
$(function(){
 $('#action').click(function(){
 var account = $('#account').val();
  if($.trim(account) == ""){
   Swal.fire('帳號不能為空')
  }else{
 
 var user ={"account":''+account};
 //固定寫法請銘記 {"javabean屬性名":''+變數名稱}
 
 $.ajax({
  type:"POST", //請求方式
  url:'/vertifyemail', //請求連結
  contentType:'application/json', //請求格式
  data:JSON.stringify(account), //data =傳遞的資料，用JSON.strigify();將物件轉為JSON格式
  success:function(data){
     console.log(data)
     if(data=="Y"){
      $('#account').prop("disabled","disabled")
       Swal.fire('請至信箱收取驗證信')
    $('#sp2').html('請至信箱收取驗證信')      
     }else{
     $('#account').html(account)
        Swal.fire('帳號不存在，請重新確認')
     }
     },//success
    error:function(err){console.log(err)},
  });//ajax
  } //else
 }); //click
})//底
</script>
</body>
</html>