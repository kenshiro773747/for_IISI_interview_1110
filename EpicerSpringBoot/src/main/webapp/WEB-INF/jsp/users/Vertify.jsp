<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
</head>
<body style="background-color: antiquewhite;">
<h4><a href="homepage">回到首頁</a></h4>
<script src="js/jquery-3.6.0.js"></script>
<script src="js/sweetalert2.all.min.js"></script>
<script>
$(function(){
	Swal.fire({
		  title: '請至信箱收取驗證信，完成註冊會員',
		  width: 600,
		  padding: '3em',
		  color: '#716add',
		  background: '#fff url(images/trees.png)',
		  backdrop: `
		    rgba(0,0,123,0.4)
		    url("images/AS001123_18.gif")
		    left top
		    no-repeat
		  `
		})
});
</script>
</body>
</html>