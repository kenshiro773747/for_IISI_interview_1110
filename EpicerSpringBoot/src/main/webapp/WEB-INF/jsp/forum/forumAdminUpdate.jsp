
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.epicer.controller.forum.*,com.epicer.model.forum.*,com.epicer.service.forum.*,com.epicer.util.*,java.util.*"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<title>更新文章</title>
<script language='javascript' src='js/wangEditor.min.js'></script>
<script>

</script>
<style>
        .tb1 {
            width: 700px;
            height: 550px;
            border-collapse: collapse;
            margin: auto;
        }
</style>



</head>

<body>
<%@include file="../includes/eLinkHead.jsp"%>
<%@include file="../includes/eScriptForBody.jsp"%>


<div style="margin:2% 0 0 0">
	    <h1 style="text-align:center;">更新文章 </h1>
  <%
      	   ArticleBean detail = (ArticleBean)request.getSession().getAttribute("updateDetail");  
 		%>
 		   <div>
     <form action="QueryAllPage" method="Get">
      <input type="submit"value="返回" class="btn bg-gradient-secondary">
     </form>
     </div>
	<form action="articleReportUpdate" method="post" style="background-image: url(images/forumADD.jpg);background-size: 50%;"  >	
		<input type="hidden" name="action" value="Update">
		
		<table class="tb1">

			<tr>
				
				<td>
				<input type="text" name="articleId"  class="form-control"
					value="<%=detail.getArticleId()%>" readonly>
				</td>
			</tr>
			<td class="form-group">
				<select class="form-control" id="exampleFormControlSelect1" name="status" >
				<option value="0" <%if(detail.getStatus()==0){%> selected <% }%>>正常顯示</option> 
				<option value="1" <%if(detail.getStatus()==1){%> selected <% }%>>檢舉</option> 
				<option value="2" <%if(detail.getStatus()==2){%> selected <% }%>>設為公告</option> 
				<option value="3" <%if(detail.getStatus()==3){%> selected <% }%>>黑名單</option> 
				</select>
				</td>

			<tr>
			
				<td class="form-group">
				<select class="form-control" id="exampleFormControlSelect1" name="category" >
				<%if(detail.getPlateformCategoryId()==0)%><option value="0"  selected="<%=detail.getPlateformCategoryId()%>" disabled>請選擇文章類型</option> 
				<%if(detail.getPlateformCategoryId()==1)%><option value="1"  selected="<%=detail.getPlateformCategoryId()%>" disabled>全穀雜糧類</option> 
				<%if(detail.getPlateformCategoryId()==2)%><option value="2"  selected="<%=detail.getPlateformCategoryId()%>" disabled>豆魚蛋肉類</option> 
				<%if(detail.getPlateformCategoryId()==3)%><option value="3"  selected="<%=detail.getPlateformCategoryId()%>" disabled>蔬菜類</option> 
				<%if(detail.getPlateformCategoryId()==4)%><option value="4"  selected="<%=detail.getPlateformCategoryId()%>" disabled>水果類</option> 
				<%if(detail.getPlateformCategoryId()==5)%><option value="5"  selected="<%=detail.getPlateformCategoryId()%>" disabled>乳品類</option> 
				<%if(detail.getPlateformCategoryId()==6)%><option value="6"  selected="<%=detail.getPlateformCategoryId()%>" disabled>油脂與堅果種子類</option> 
				</select>
				</td>
			</tr>
			<tr>
				<td><input type="text" name="aTitle" class="form-control" id="title" value="<%=detail.getTitle()%>"></td>

			</tr>
			<tr>
				<td>
				<div id="div1">
				 <p><%=detail.getArticleContent()%></p>
				</div>
                <textarea id="text1" name="aContent" style="width:100%; height:200px ;display:none" cols="80" rows="20" ></textarea>
				</td>
			</tr>
			
			<tr>
				<td>
				<input type="submit" name="submit" value="保存" class="btn btn-primary btn-sm">
				<input type="button" value="清除表單" id="UpdateReset" class="btn btn-primary btn-sm">
				</td>
			</tr>


		</table>
	</form>
	</div>
	
	
	
<!-- <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->
<script language='javascript' src='js/jquery-3.6.0.js'></script>
<script language='javascript' src='js/Wang.js'></script>

	
	
</body>

</html>