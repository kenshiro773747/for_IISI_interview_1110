<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ////// 會員中心--個人資料維護  /////// -->
    
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
 <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
    <!--Only for demo purpose - no need to add.-->
   <!-- <link rel="stylesheet" href="css/demo.css" />-->
	   <link rel="stylesheet" href="css/style.css">
<style>
.inputt {
  border: none;
  outline: 0;
  display: inline-block;
  color: black;
  background-color:#fff;
  text-align: center;
  cursor: pointer;
  font-size: 18px;
  width:50%;
  float: left

}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 500px;
  margin: auto;
  text-align: center;
}

#avatar{
width:150px;
height:150px;
border-radius:50%
}



</style>
</head>
<body id="body" style="background-color: white">

<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，
大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>

<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="會員中心" />
<jsp:param name="pagination" value="個人管理" />
</jsp:include>

<section class="user-dashboard page-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-md-12">      
      <!-- ///// ↓這邊url最後都要再重新整理過!!!!(因為active位置不同,無法拆寫jsp QQ) -->
        <ul class="list-inline dashboard-menu text-center">
          
           <li><a href='${pageContext.request.contextPath}/userorderqueryall'>我的訂單</a></li>
		  <li><a  href='${pageContext.request.contextPath}/usercoursequeryall'>我的課程</a></li>
        <li><form name="usermanagementt" method="post" action='${pageContext.request.contextPath}/usermanagement'><a href="javascript:document.usermanagementt.submit();" class="active" >個人資料維護</a></form></li>
        </ul>
  <br>
   <br>
    <br>
<section>
    <div class="rt-container">
          <div class="col-rt-12">
              <div class="Scriptcontent">
<!-- Student Profile -->
<form action='${pageContext.request.contextPath}/usermodify' method="post">
<div class="student-profile py-4">
  <div class="container">
    <div class="row">
      <div class="col-lg-4">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent text-center">
          <br>
            <img  id="avatar" class="profile_img" src="${user.getAvatar()}" alt="UserAvatar">
          </div><br>
          <div class="card-body">
            <p class="mb-0"><strong class="pr-1">使用者ID:</strong>${user.getId()}</p>
            <p class="mb-0"><strong class="pr-1">姓名:</strong>${user.getName()}</p>
            <p class="mb-0"><strong class="pr-1">暱稱:</strong>${user.getNickname()}</p>
          </div>
            <br>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>詳細資訊</h3>
          </div>
          <div class="card-body pt-0">
            <table class="table table-bordered">
              <tr>
                <th width="30%">性別</th>
                <td width="2%">:</td>
                <td>${sgender}</td>
              </tr>
              <tr>
                <th width="30%">出生年月日</th>
                <td width="2%">:</td>
                <td>${sbirth}</td>
              </tr>
              <tr>
                <th width="30%">信箱</th>
                <td width="2%">:</td>
                <td>${user.getAccount()}</td>
              </tr>
              <tr>
                <th width="30%">密碼</th>
                <td width="2%">:</td>
                <td>●●●●●●●●</td>
              </tr>
              <tr>
                <th width="30%">連絡電話</th>
                <td width="2%">:</td>
                <td>${user.getPhone()}</td>
              </tr>
               <tr>
                <th width="30%">居住縣市</th>
                <td width="2%">:</td>
                <td>${scity}</td>
              </tr>
               <tr>
                <th width="30%">區域</th>
                <td width="2%">:</td>
                <td>${user.getTownship()}</td>
              </tr>
               <tr>
                <th width="30%">完整地址</th>
                <td width="2%">:</td>
                <td>${user.getAddress()}</td>
              </tr>
              <tr>
              <td colspan="3">
              <input type="submit" class="inputt" name="submit" value="修改">
<input type="submit" class="inputt" name="submit"  value="返回">
            </form>
              
              </td>
              </tr>
            </table>
          </div>
        </div>
         <br>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- partial -->
           
    		</div>
		</div>
    </div>
</section>


<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>
<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>
 <script>
 $(function(){
	 
	 $.ajax({
		  type:"POST", //請求方式
		  url:'/vertifyaccount22', //請求連結
		  contentType:'application/json', //請求格式
		//  data:JSON.stringify(account), //data =傳遞的資料，用JSON.strigify();將物件轉為JSON格式
		  success:function(data){
		     console.log(data)
		     if(data.result =='N'){
		    	 $('#useravatar').attr("src","images/user_icon.png")
		    	 var content='<li><a href="form">註冊</a></li>'
		    		 +'<li><a href="login">登入</a></li>'
		    		 
		    		//'<li><a href="admin/checkadminstatus2">管理者</a></li>';
		    		//+'<li><form action="users/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員</a></form></li>';
		    	  $('#userselect').append(content)
		   		
		   		}else if(data.result =='U' ){
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		  
		   		       var content=
		   		    	'<li><form action="users/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員中心</a></form></li>'
		   		              +'<li><a href="/all/logout">登出</a></li>';
		   		              
		   		              
		    	  $('#userselect').append(content)
			   		
		   		}else if(data.result =='A'){
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		 var content=
		   			'<li><form action="admin/checkadminstatus2" method="post" name="form3"><a href="javascript:document.form3.submit();">管理系統</a></form></li>'
		   		   +'<li><a href="/all/logout">登出</a></li>';
		    	 
		    	  $('#userselect').append(content)
		   			
		   		}else{
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		  var content=
		   			 '<li><form action="/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員中心</a></form></li>'
		   		      +'<li><a href="/all/logout">登出</a></li>';
		    	 
		    	  $('#userselect').append(content)
		   		}
		     },//success
		    error:function(err){console.log(err)},
		  });//ajax
	 
	 
	 
	 
 })
 
 </script>
</body>
</html>