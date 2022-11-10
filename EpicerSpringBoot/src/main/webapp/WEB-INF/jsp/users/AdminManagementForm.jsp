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
	    
	    .msg{
	    color:red;
	    }
	    
	       
	    .msg2{
	    color:red;
	    }
	    
	    
	    </style>
</head>

<body class="g-sidenav-show   bg-gray-100">

	<!-- ////////////////// 介面最外層框架 //////////////////-->
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
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
<form action="doadminmodify" method="post" enctype="multipart/form-data"> 
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
            <input type="hidden" name="id" value="${admin.getId()}">
            <p class="mb-0"><strong class="pr-1">Name:</strong>${admin.getName()}</p>
            <p class="mb-0"><strong class="pr-1">Nickname:</strong><input type="text" name="nickname" value='${admin.getNickname()}' required></p>
            <span class="msg2">${show.nickname.getMessage()}</span>
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
                <td><input type="text" id="password" name="password" value="●●●●●●●●" required >
<span class="msg2">${show.password.getMessage()}</span>
<span id="sp1" class="msg"></span></td>
              </tr>
              <tr>
                <th width="30%">Phone</th>
                <td width="2%">:</td>
                <td><input type="text" id="phone" name="phone" value="${admin.getPhone()}" required>
<span  class="msg2">${show.phone.getMessage()}</span>
<span id="sp2"  class="msg"></span>
              </tr>
               <tr>
                <th width="30%">City & Township</th>
                <td width="2%">:</td>
                <td>
                <div class="twzipcode"></div>
                  <span  class="msg" id="sp3"></span><br>
  <span  class="msg" id="sp4"></span>
  </td>
              </tr>
               <tr>
                <th width="30%">Address</th>
                <td width="2%">:</td>
                <td><input type="text" id="road" name="road" value="${admin.getAddress()}" required>
<span  class="msg2">${show.address.getMessage()}</span>
<span id="sp5"  class="msg"></span></td>
              </tr>
              <tr>
              <td colspan="3" style="
  text-align: center;"><input type="file" id="myfile" name="myfile"></td>
              </tr>
            </table>
          </div>
        </div>
 <div style="height: 15px"></div>
          <div style="height: 50px;display: flex;
  justify-content: center;
  align-content: center;">
<input type="submit"  name="submit" value="確認">
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
     


    <!-- Analytics -->

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
 <script src="js/jquery-3.6.0.js"></script>
<script src="js/Manegment.js"></script>
<script src="js/test.js"></script>
 <script>
    const twzipcode = new TWzipcode(".twzipcode");
    </script>
    <script>
    $(function(){
    	//當password = null 時，password value=oldpassword
    	$('#password')
    	
    //居住路段必填 判斷 非空 觸發 onblur onsubmit
    $(".twzipcode").on('change',function(){
     let county = twzipcode.get('county');
		  let district = twzipcode.get('district');
		  $('#road').prop("value",county+district);
   });
    });
    </script>
</body>

</html>