<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.epicer.model.course.*,com.epicer.controller.*,com.epicer.util.*"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改資訊</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<% 
	TimeTest TT = new TimeTest();
	Date date = new Date();

	String stringDate = TT.TransDateToString(date);
	Course oldCourse = (Course) request.getAttribute("Course");
	int oldCourseId = oldCourse.getCourseId();
	System.out.println("我在courseEditor.jsp,待修改課程ID:" + oldCourseId);
	%>


	<h1>修改課程</h1>

	<form:form action="updateCourse" method="post" modelAttribute="Course"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td><form:input type="hidden" path="courseId" /></td>
			</tr>
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
						min="<%=stringDate%>"
						value="<%=TT.TransLongToString(oldCourse.getCourseDate())%>" /></td>
			</tr>
			<tr>
				<td><label>老師ID：</label></td>
				<td><form:input type="text" path="fakeTeacherID"
						value="<%=oldCourse.getTeacher().getTeacherId()%>" /></td>
			</tr>
			<tr>
				<td><label>教室：</label></td>
				<td><form:select path="classroomId" id="classroom">
						<option><%=oldCourse.getClassroomId()%></option>
						<option>101</option>
						<option>102</option>
						<option>103</option>
					</form:select></td>
			</tr>
			<tr>
				<td><label>風格：</label></td>
				<td><form:input type="text" path="courseStyle" /></td>
			</tr>
			<tr>
				<td><label>圖片：</label></td>
				<td><input type="file" name="photo" /></td>
				<td><img width=150 src="images/<%=oldCourse.getCourseImage()%>"></td>
				<input type="hidden" name="oldimg"
					value="<%=oldCourse.getCourseImage()%>" />
			</tr>

			<tr>
				<td colspan="9"><form:button type="submit" value="Send">提交更新</form:button></td>
			</tr>
			<!--  <input id="123" type="hidden"value="102" />-->
		</table>
	</form:form>
	<script type="text/javascript">
var classroomID = document.getElementById("classroom");
classroomID.on("focus",function(){
var 123 = document.getElementById("123");
var elems = document.getElementsByTagName("666");

for (var i = 0; i < elems.length; i++) {
	if (elems[i].equals(123)) {
		elems[i].setAttribute('selected="selected"');
		return ;
	}else{
		return;
	}	
}	
});
</script>


</body>
</html>