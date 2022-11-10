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
<span class="title">驗證您的信箱</span>
    <div class="inputfeild">
        <input type="text" name="account" id="account" placeholder="Enter your EmailAccount" required>
        <i class="uil uil-envelope-alt icon"></i>
    </div>
    <span id="sp1" class="msg"></span><br>
     <span id="sp2" class="msg"></span>
    <div class="inputfeild button">
        <button value="Vertify Now" id="action">確認</button>
    </div>
    <h4><a href="homepage">回到首頁</a></h4>
</div>
</div>
</div>
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