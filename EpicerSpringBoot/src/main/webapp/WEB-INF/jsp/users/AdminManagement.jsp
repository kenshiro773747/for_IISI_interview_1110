<%@ page  import="java.util.*,com.epicer.model.users.*,com.epicer.util.*" language="java" contentType="text/html; charset=UTF-8"
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
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet"><link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--Only for demo purpose - no need to add.-->
    <link rel="stylesheet" href="css/demo.css" />
    
	    <link rel="stylesheet" href="css/style.css">
	    <style>
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
<header class="ScriptHeader">
    <div class="rt-container">
    	<div class="col-rt-12">
        	<div class="rt-heading">
            	<h1>Hello ${admin.getName()} !</h1>
            </div>
        </div>
    </div>
</header>

<section>
    <div class="rt-container">
          <div class="col-rt-12">
              <div class="Scriptcontent">
              
<!-- Student Profile -->
<form action="adminmodify" method="post">
<div class="student-profile py-4">
  <div class="container">
    <div class="row">
      <div class="col-lg-4">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent text-center">
            <img class="profile_img" src="${admin.getAvatar()}" alt="UserAvatar">
            <h3>${admin.getName()}</h3>
          </div>
          <div class="card-body">
            <p class="mb-0"><strong class="pr-1">User ID:</strong>${admin.getId()}</p>
            <p class="mb-0"><strong class="pr-1">Name:</strong>${admin.getName()}</p>
            <p class="mb-0"><strong class="pr-1">Nickname:</strong>${admin.getNickname()}</p>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
          </div>
          <div class="card-body pt-0">
            <table class="table table-bordered">
              <tr>
                <th width="30%">Gender</th>
                <td width="2%">:</td>
                <td>${sgender}</td>
              </tr>
              <tr>
                <th width="30%">Birth</th>
                <td width="2%">:</td>
                <td>${sbirth}</td>
              </tr>
              <tr>
                <th width="30%">Account</th>
                <td width="2%">:</td>
                <td>${admin.getAccount()}</td>
              </tr>
              <tr>
                <th width="30%">Password</th>
                <td width="2%">:</td>
                <td>●●●●●●●●</td>
              </tr>
              <tr>
                <th width="30%">Phone</th>
                <td width="2%">:</td>
                <td>${admin.getPhone()}</td>
              </tr>
               <tr>
                <th width="30%">City</th>
                <td width="2%">:</td>
                <td>${scity}</td>
              </tr>
               <tr>
                <th width="30%">Township</th>
                <td width="2%">:</td>
                <td>${admin.getTownship()}</td>
              </tr>
               <tr>
                <th width="30%">Address</th>
                <td width="2%">:</td>
                <td>${admin.getAddress()}</td>
              </tr>
            </table>
          </div>
        </div>
 <div style="height: 15px"></div>
 <div style="height: 15px;display: flex;
  justify-content: center;
  align-content: center;">
<a href="#"><i class="fa fa-dribbble"></i></a>&nbsp; &nbsp; 
  <a href="#"><i class="fa fa-twitter"></i></a>&nbsp;&nbsp;  
   <a href="#"><i class="fa fa-linkedin"></i></a>&nbsp; &nbsp; 
  <a href="#"><i class="fa fa-facebook"></i></a>
        </div>
         <br>
          <div style="height: 50px;display: flex;
  justify-content: center;
  align-content: center;">
<input type="submit"  name="submit" value="修改">
<input type="submit" name="submit"  value="返回">
</div>
            </form>
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

</body>
</html>