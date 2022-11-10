<%@ page  import="java.util.*,com.epicer.model.users.*,com.epicer.util.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer Admin System</title>
<style>

* {
background-color: antiquewhite
  box-sizing: border-box;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 600px;
  margin: auto;
  text-align: center;
  justify-content: center;
}

.title {
  color: grey;
  font-size: 18px;
}

input {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}


fieldset {
	            width: 900px;
                border-radius: 15px;
                margin: 20px auto;
                background-color: white;
}

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLindHead (結束) -->
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
<fieldset>
<div class="card">
  <img src="images/default.jpg" alt="John" style="width:100%">
  <h4>Checkout This!</h4>
 <form action="empinsert" method="post">
<table>
<tr style="text-align: center;">
<td>Name</td>
<td>:</td>
<td>${user.getName()}</td>
</tr>
<tr style="text-align: center;">
<td style="text-align: center;">Gender</td>
<td style="text-align: center;">:</td>
<td style="text-align: center;">${sgender}</td>
</tr>
<tr style="text-align: center;">
<td>Birth</td>
<td>:</td>
<td>${sbirth}</td>
</tr>
<tr style="text-align: center;">
<td>Account</td>
<td>:</td>
<td>${user.getAccount()}</td>
</tr>
<tr style="text-align: center;">
<td>Password</td>
<td>:</td>
<td>${user.getPassword()}</td>
</tr>
<tr style="text-align: center;">
<td>Phone</td>
<td>:</td>
<td>${user.getPhone()}</td>
</tr>
<tr style="text-align: center;">
<td>City</td>
<td>:</td>
<td>${scity}</td>
</tr>
<tr style="text-align: center;">
<td>Township</td>
<td>:</td>
<td>${user.getTownship()}</td>
</tr>
<tr style="text-align: center;">
<td>Address</td>
<td>:</td>
<td>${user.getAddress()}</td>
</tr>
</table>
  <p><input type="submit" value="Comfirm">
  <p><input type="submit" value="Back">
</div>
</form>
</fieldset>
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