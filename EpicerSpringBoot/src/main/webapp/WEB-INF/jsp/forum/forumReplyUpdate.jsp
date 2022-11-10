	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.epicer.controller.forum.*,com.epicer.model.forum.*,com.epicer.service.forum.*,com.epicer.util.*,java.util.*"%>
<!DOCTYPE html>
<% 
response.setContentType("text/html;charset=UTF-8");

response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<title>更新留言</title>
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
    <h1 style="text-align:center;">修改回覆 </h1>
    <hr>
<%  ArticleReplyBean detail = (ArticleReplyBean)request.getSession().getAttribute("replyUpdateDetail");  %>

	 		   <div>
     <form action="articleDetail" method="post"  >
     <input type="hidden" name="articleId" value="<%=detail.getArticleId().getArticleId()%>">
      <input type="submit"value="返回" class="btn bg-gradient-secondary">
     </form>
     </div>

    <form action="replyUpdate" method="post" style="background-image: url(images/forumADD.jpg);background-size: 50%;">
        <table class="tb1">
       	   <tr>
				<td>
				<input type="hidden" name="articleId" value="<%=detail.getArticleId().getArticleId()%>">
				<input type="text" name="replyId" class="form-control" value="<%=detail.getArticleReplyId()%>" readonly>
				</td>
			</tr>
            <tr>
                <td>
                <div id="div1">
                 <p><%=detail.getArticleReplyContent()%></p>
				</div>
                <textarea id="text1" name="replyContent" style="width:100%; height:200px ;display:none" cols="80" rows="20" required="required" ></textarea>
                </td>

            </tr>
 
            <tr>
                <td>
                <input type="submit" name="submit" value="保存" class="btn btn-primary btn-sm">
                <input type="reset"	 value="清除表單" id="testReset" class="btn btn-primary btn-sm">
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