<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.epicer.controller.forum.*,com.epicer.model.forum.*,com.epicer.service.forum.*,com.epicer.util.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>文章內容</title>
<script type="text/javascript" src="https://platform-api.sharethis.com/js/sharethis.js#property=63296382a700c90019f6dc52&product=image-share-buttons" async="async"></script>
<script language='javascript' src='js/wangEditor.min.js'></script>
<script  src='js/sweetalert2.min.js'></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">

<style>
.swal2-container {
  z-index: 20000;
}

</style>

</head>
<body>
<%@include file="epicerNavbar.jsp"%>

<form action="QueryAllPage" method="Get">
	<input type="submit" value="回首頁">
</form>


 <table >

            <thead>
              <tr style="height: 45px;">
                <th class="u-table-cell"> 標題</th>
                <th class="u-table-cell"> 時間</th>
                <th class="u-table-cell"> 內文</th>
                <th class="u-table-cell"> 照片</th>
              </tr>
            </thead>
            
               <%
      	   ArticleBean detail = (ArticleBean)request.getSession().getAttribute("selectDetail");  
 		%>
            <tbody >
            <tr>
            <td><%=detail.getTitle()%></td>
            <td><%=TimeTest.transToDate(detail.getDate())%></td>
            <td><%=detail.getArticleContent()%></td>
       	    </tr>
            </tbody>
            
      </table>     
			
		<br>	
		<br>
<div>

<h1>留言版</h1>

<form action="replyAdd" method="post"  style="width:800px;">
        <table>
       	   <tr>
				<input type="hidden" name="articleId" value="<%=request.getParameter("articleId")%>" readonly>
			</tr>
            <tr>
                <td >
                <div id="div1" >
				</div>
                <textarea id="text1" name="replyContent" style="width:100%; height:200px ;display:none" cols="80" rows="20" required="required" ></textarea>
                </td>
            </tr>
            <tr>
                <td><input type="submit" name="submit" value="保存"></td>
            </tr>
        </table>
</form>
</div>


<table>
				  <thead>
              <tr style="height: 45px;">
                <th >ReplyId</th>
                <th > 內文</th>
                <th > 時間</th>
                <th > 使用者</th>
                <th > 操作</th>
              </tr>
            </thead>
			<%
			 List<ArticleReplyBean> articleReply = (List<ArticleReplyBean>)request.getSession().getAttribute("selectReplyAll");
	 		 int i = 1;
			for (ArticleReplyBean articleReplyList : articleReply) {
			%>
			<tbody>
            <tr>
            <td><%=i++%></td>
            <td><%=articleReplyList.getArticleReplyContent()%></td>
            <td><%=TimeTest.transToDate(articleReplyList.getArticleReplyDate())%></td>
            <td><%=articleReplyList.getUser().getUserId()%></td>
            <td>
            
              <form action="replyUpdatePage"  method="post">  
 				  <input type="hidden" name="replyId" value="<%= articleReplyList.getArticleReplyId()%>">
                  <button type="submit">Update</button>
                </form> 
            
            
            
				<form id ="myform<%=i%>" action="replyDelete" method="post">
					   <input type="hidden" name="replyId" value="<%= articleReplyList.getArticleReplyId()%>">
					   <input type="hidden" name="articleId" value="<%= articleReplyList.getArticleId().getArticleId() %>">
					   <input type='button' value='Delete' onclick="del(<%=i%>)">
					   
				</form>
			</td>
       	    </tr> 
       	    <% } %>
       	    
            </tbody>
            
</table>	



    
<script language='javascript' src='js/jquery-3.6.0.js'></script>
<script language='javascript' src='js/WangReply.js'></script>
<script>
function del(id){
	Swal.fire({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		      
		    )
		    $("#myform"+id).submit();
		  }
		})
	
}

</script>
</body>
</html>