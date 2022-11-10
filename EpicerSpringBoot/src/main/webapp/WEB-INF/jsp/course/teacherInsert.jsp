<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.epicer.model.*,com.epicer.controller.*,com.epicer.util.*"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增老師</title>
</head>
<body>
 
	<%
	TimeTest TT = new TimeTest();
	Date date = new Date();
	String stringDate = TT.TransDateToString(date);
	%>
	<h1>新增老師</h1>
	<form:form action="insertTeacher" method="post"
		modelAttribute="Teacher" enctype="multipart/form-data">
		<table>
			<tr>
				<td><label>姓名:</label></td>
				<td><form:input type="text" path="teacherName" /></td>
			</tr>
			<tr>
				<td><label>描述：</label></td>
				<td><form:input type="text" path="teacherDescription" /></td>
			</tr>
			<tr>
				<td><label>狀態：</label></td>
				<td><form:select path="teacherStatus">
						<option>1</option>
						<option>2</option>
						<option>3</option>
					</form:select></td>
			</tr>
			<tr>
				<td><label>頭貼：</label></td>
				<td><input type="file" name="photo" /></td>
			</tr>
			<!--  <tr>
				<td><label>住址：</label></td>
				<td><form:input type="text" path="teacherAddress" /></td>
			</tr>-->
			<tr>
				<td><label>電話：</label></td>
				<td><form:input type="text" path="teacherPhone" /></td>
			</tr>
			<tr>
				<td><label>生日：</label></td>
				<td><form:input type="date" path="teacherBirthday" /></td>
			</tr>

			<tr>
				<div class="inputbox">
				<td><span class="detail">City</span></td>
				<td><div class="twzipcode"></div></td>
				<td><span id="sp7" class="msg"></span></td>
				<td><span id="sp8" class="msg"></span></td>
				</div>
			</tr>

			<tr>
				<div class="inputbox">
					<td><span class="detail">Address</span></td>
					<td><input type="text" id="road" name="road"
						placeholder="address" required> <span id="sp8" class="msg"></span></td>
				</div>
			</tr>
			<tr>
				<td colspan="7"><button type="submit" value="Send">Submit</button></td>
			</tr>
		</table>

	</form:form>
	<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
	<script type="text/javascript" src="js/test.js"></script>
	<script>
		const twzipcode = new TWzipcode(".twzipcode");
	</script>
</body>
</html>