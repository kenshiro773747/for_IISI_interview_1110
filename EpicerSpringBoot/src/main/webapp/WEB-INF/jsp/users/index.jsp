<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<style>


.split {
  height: 50%;
  width: 25%;
   position:fixed;
   border: 1px soild transparents ;
   border-radius: 20px;
}


.split:hover {
 opacity: 1;
}

/* Control the left side */
.left {
top:200px;
  left: 400px;
  background-color: #111;
  opacity: 0.6;
}

/* Control the right side */
.right {
top:200px;
right:500px;
  background-color: palevioletred;
  opacity: 0.6;
}

/* If you want the content centered horizontally and vertically */
.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}

/* Style the image inside the centered container, if needed */
.centered img {
  width: 150px;
  border-radius: 50%;
}

.centered img:hover {
  width: 150px;
  border-radius: 50%;
}


h2{
color: white;
}

</style>
</head>
<body style="background-color: antiquewhite;">
<%@ include file="../frontincludes/epicerNavbar.jsp" %>
<div class="split left">
  <div class="centered">
  <form action='${pageContext.request.contextPath}/checkuserstatus' method="post" name="form3">
  <a href="javascript:document.form3.submit();"> <img src="images/default.jpg" alt="Avatar woman"></a>
 <!--   <a href="checkuserstatus"> <img src="images/default.jpg" alt="Avatar woman">-->
    <h2>會員登入</h2>
    </form>
    <a href="form">我還不是會員</a>
  </div>
</div>

<div class="split right">
  <div class="centered">
  <form action="admin/checkadminstatus2" method="post" name="form2">
    <a href="javascript:document.form2.submit();"> <img src="images/default.jpg" alt="Avatar woman"></a>
 <!-- <a href="admin/checkadminstatus2"> <img src="images/default.jpg" alt="Avatar woman">-->
    <h2>管理者登入</h2>
    </form>
  </div>
</div>
</body>
</html>