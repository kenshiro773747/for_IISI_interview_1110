<%@ page  import="com.epicer.model.users.*,com.epicer.util.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout This !</title>
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

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background-color: antiquewhite">
<%@ include file="../frontincludes/epicerNavbar.jsp" %>
<div class="card">
  <img src="images/default.jpg" alt="John" style="width:100%">
  <h4>Checkout This!</h4>
 <form action="vertifymail" method="post">
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
</body>
</html>