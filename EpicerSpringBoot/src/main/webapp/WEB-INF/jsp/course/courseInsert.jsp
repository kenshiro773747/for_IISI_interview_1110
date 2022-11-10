<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.epicer.model.*,com.epicer.controller.*,org.hibernate.Session,
org.hibernate.SessionFactory,com.epicer.util.*"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增課程</title>
</head>
<body>

	<%
	TimeTest TT = new TimeTest();
	Date date = new Date();
	String stringDate = TT.TransDateToString(date);
	%> 
	<h1>新增課程</h1>
	<form:form action="addCourse" method="post" modelAttribute="Course"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td><label>課程名稱:</label></td>
				<td><form:input type="text" path="courseName" /></td>
			</tr>
			<tr>
				<td><label>課程價錢：</label></td>
				<td><form:input type="text" path="coursePrice" /></td>
			</tr>
			<tr>
				<td><label>課程介紹：</label></td>
				<td><form:input type="text" path="courseDescription" /></td>
			</tr>
			<tr>
				<td><label>課程日期：</label></td>
				<td><form:input type="date" path="fakeCourseDate"
						min="<%=stringDate%>" /></td>
			</tr>
			<tr>
				<td><label>老師ID：</label></td>
				<td><form:input type="text" path="fakeTeacherID" /></td>
			</tr>
			<!--  <tr>
				<td><label>教室ID：</label></td>
				<td><form:input type="text" path="classroomId" /></td>
			</tr>-->

			<tr>
				<td><label>教室：</label></td>
				<td>
				<form:select path="classroomId">				
						<option>教室ID：</option>
						<option>101</option>
						<option>102</option>
						<option>103</option>
				</form:select>
				</td>
			</tr>


			<tr>
				<td><label>風格：</label></td>
				<td><form:input type="text" path="courseStyle" /></td>
			</tr>
			<tr>
				<td><label>圖片：</label></td>
				<td><input type="file" name="photo" /></td>

			</tr>

			<tr>
				<td colspan="8"><button type="submit" value="Send">Submit</button></td>
			</tr>
		</table>
	</form:form>
</body>
</html>