	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
response.setContentType("text/html;charset=UTF-8");

response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<title>新增文章</title>
<script language='javascript' src='js/wangEditor.min.js'></script>

<style>
        .tb1 {
            width: 700px;
            height: 550px;
            border-collapse: collapse;
            margin: auto;
        }
</style>
<script>



</script>


</head>

<body>
<%@include file="../includes/eLinkHead.jsp"%>
<%@include file="../includes/eScriptForBody.jsp"%>







<div style="margin:2% 0 0 0">
	    <h1 style="text-align:center;">新增文章 </h1>


 
   <div >
     <form action="QueryAllPage" method="Get" >
      <input type="submit"value="返回" class="btn bg-gradient-secondary">
     </form>
     </div>

    <form action="articleAdd" method="post" style="background-image: url(images/forumADD.jpg);background-size: 50%;" >
        <table class="tb1" style="opacity:1;" >
                    <tr>
                <td>
                <div class="col-md-6">
    			<div class="form-group has-success">
   				 <input type="text" placeholder="請輸入文章標題"  class="form-control" name="articleTitle" id="example-text-input" required="required"></td>
				 <button type="button" class="btn btn-outline-warning"  id="hot">一鍵輸入</button>
				 </div>
  				</div>
   
            </tr>
            <tr>
                <td>
                  <div class="form-group">
                    <select class="form-control" id="exampleFormControlSelect1" name="category" >
                        <option value="0" selected disabled >請選擇文章類型</option>
                        <option value="1">全穀雜糧類</option>
                        <option value="2">豆魚蛋肉類</option>
                        <option value="3">蔬菜類</option>
                        <option value="4">水果類</option>
                        <option value="5">乳品類</option>
                        <option value="6">油脂與堅果種子類</option>
                    </select>
                     </div>
                </td>
            </tr>

            <tr>
            
                <td>
                <div id="div1"></div>
                <textarea id="text1" name="articleContent" style="width:100%; height:200px ;display:none" cols="80" rows="20" required="required" ></textarea>
                </td>

            </tr>
            
            <tr>
                <td>
                <input type="submit" name="submit" class="btn btn-primary btn-sm" value="保存">
                <input type="reset"	 value="清除表單" id="testReset" class="btn btn-primary btn-sm">
               
               </td>
             
            </tr>



        </table>
    </form>
 
    </div>	
<script language='javascript' src='js/jquery-3.6.0.js'></script>
<script language='javascript' src='js/Wang.js'></script>
</body>

</html>