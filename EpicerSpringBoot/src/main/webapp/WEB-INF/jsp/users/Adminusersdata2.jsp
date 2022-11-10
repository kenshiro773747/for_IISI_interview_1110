<%@ page import="java.util.*,com.epicer.model.users.*,com.epicer.util.*" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer Admin System</title>

<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLindHead (結束) -->
<style>
fieldset {
	            width: 900px;
                border-radius: 15px;
                margin: 20px auto;
                background-color: white;
}



</style>
</head>

<body class="g-sidenav-show   bg-gray-100">

	<!-- ////////////////// 介面最外層框架 //////////////////-->
	<div class="min-height-300 bg-dark position-absolute w-100"></div>
	<!-- ////////////////// Side Navber (開始) //////////////////-->
	<%@include file="../includes/eSidenav.jsp"%>
	<!-- ////////////////// Side Navber (結束) //////////////////-->
	<!-- //////////////////主畫面框架(開始) ////////////////// -->
	<main class="main-content position-relative border-radius-lg ">
		<!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->
<!-- ////////////////// 個人主文開始 //////////////////-->
<!-- list =null -->

<% 
List<EpicerUser> list = (List<EpicerUser>)session.getAttribute("list");
if(list == null){
%>
<fieldset>
<form action="user" method="post">
        <h4 style="margin-left:200px;">層級</h4>
        <div style="margin-left:200px">
        <select name="status" required>
                    <option  value="0">管理者</option>
                    <option  value="1">會員</option>
                     <option  value="4">已停權</option>
                     <option  value="7">全部</option>
                    </select>
                    </div>
       <input type="submit" name="submit" value="搜尋" style="margin-left:250px;margin-top:15px">
</form>
<form action="back" method="post">
        <input type="submit" name="submit" value="返回" style="margin-left:900px;margin-top:15px"  >
        </form>
<!-- ////////////////// 個人主文結束 //////////////////-->
		<!--////////////////// Footer(開始) //////////////////-->
		<%@include file="../includes/eFooter.jsp"%>
		<!-- ////////////////// Footer(結束) //////////////////-->

		</div>
		<!-- ////////////////// 中間主畫面(結束) ////////////////// -->
	</main>
	<!-- ////////////////// 主畫面框架(結束) //////////////////-->

	<!-- ////////////////// (右上設定鈕)Sidenav Type 調整樣式 ////////////////// -->
	<!-- ////////////////// Sidebar Backgrounds 開始 //////////////////-->
	<%@include file="../includes/eSidenavTypeSetting.jsp"%>
	<!-- ////////////////// Sidebar Backgrounds 結束 ////////////////// -->

	<!-- ////////////////// 框架Script url (開始)(不能少) ////////////////// -->
	<%@include file="../includes/eScriptForBody.jsp"%>
	<!-- ////////////////// 框架Script (結束) //////////////////-->
	</fieldset>
</body>
</html>

<%
}else{ 
ListIterator it = list.listIterator();
Tools tools= new Tools();
Message msg = (Message)request.getAttribute("msg"); //delete
String info ="";
if(msg == null){
	info="";
}else{
	info=msg.getMessage();
}
%>
<!-- list != null -->
<fieldset>
<form action="user" method="post">
 <h4 id="p" value="<%=info%>" style="margin-left:250px;color:red"><%=info%></h4>
        <h4 style="margin-left:200px;">層級</h4>
        <div style="margin-left:200px">
        <select name="status" required >
                    <option  value="0">管理者</option>
                    <option  value="1">會員</option>
                       <option  value="4">已停權</option>
                    </select><input type="submit" name="submit" value="搜尋" >
                    </div>
</form>  
 <hr>
 <form action="delete" method="post" id="deleteform">
  <div class="table-responsive">
    <table class="table align-items-center mb-0 center" id="table_id">
      <thead>
        <tr>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">使用者</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">權限</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">性別</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">年齡</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">出生年/月/日</th>
            <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">手機號碼</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">縣市</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">市鎮鄉區</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">完整地址</th>
           <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">上次登錄</th>
        </tr>
      </thead>
       <%
            while(it.hasNext()){
            EpicerUser user = (EpicerUser)it.next();
            %> 
      <tbody>
        <tr>
          <td>
            <div class="d-flex px-2 py-1">
              <div>
                <img src="<%= user.getAvatar() %>" class="avatar avatar-sm me-3">
              </div>
              <div class="d-flex flex-column justify-content-center">
                <h6 class="mb-0 text-xs"><%= user.getName() %></h6>
                <p class="text-xs text-secondary mb-0"><%= user.getNickname() %></p>
                <p class="text-xs text-secondary mb-0"><%= user.getAccount() %></p>
              </div>
            </div>
          </td>
          <td>
            <p class="text-xs font-weight-bold mb-0">ID : <%= user.getId() %></p>
            <p class="text-xs text-secondary mb-0"><%= tools.getStatusDes(user.getStatus())%></p>
          </td>
          <td class="align-middle text-center text-sm">
            <span class="badge badge-sm badge-success"><%= user.getGenderName(user.getGender())%></span>
          </td>
          <td class="align-middle text-center">
            <span class="text-secondary text-xs font-weight-bold"> <%=tools.getAge(user.getBirth())%></span>
          </td>
          <td class="align-middle text-center">
            <span class="text-secondary text-xs font-weight-bold"><%=tools.getStringDate(user.getBirth() )%></span>
          </td>
          <td class="align-middle text-center">
            <span class="text-secondary text-xs font-weight-bold"><%= user.getPhone() %></span>
          </td>
           <td class="align-middle text-center">
            <span class="text-secondary text-xs font-weight-bold"><%= user.getCityName(user.getCity())%></span>
          </td>
           <td class="align-middle text-center">
            <span class="text-secondary text-xs font-weight-bold"><%= user.getTownship() %></span>
          </td>
              <td class="align-middle text-center">
            <span class="text-secondary text-xs font-weight-bold"><%= user.getAddress() %></span>
          </td>
            <td class="align-middle text-center">
            <span class="text-secondary text-xs font-weight-bold"><%= tools.getStringDate(user.getLogindate())%></span>
          </td>
          <td class="align-middle">
           <input type="radio" name="userid" value="<%= user.getId() %>"  required>
          </td>
        </tr>
      </tbody>
       <% } %>
    </table>
          <input type="text" name="password" id="password" placeholder="員工密碼"  style="margin-left:900px;margin-top:15px" required>
      <input type="submit" name="submit" id="delete" value="刪除">
       </form>
<form action="back" method="post">
         <input type="submit" name="submit" value="返回" style="margin-left:900px;margin-top:15px"  >
         </form>
  </div>
<!-- ////////////////// 個人主文結束 //////////////////-->
		<!--////////////////// Footer(開始) //////////////////-->
		<%@include file="../includes/eFooter.jsp"%>
		<!-- ////////////////// Footer(結束) //////////////////-->

		</div>
		<!-- ////////////////// 中間主畫面(結束) ////////////////// -->
	</main>
	<!-- ////////////////// 主畫面框架(結束) //////////////////-->

	<!-- ////////////////// (右上設定鈕)Sidenav Type 調整樣式 ////////////////// -->
	<!-- ////////////////// Sidebar Backgrounds 開始 //////////////////-->
	<%@include file="../includes/eSidenavTypeSetting.jsp"%>
	<!-- ////////////////// Sidebar Backgrounds 結束 ////////////////// -->

	<!-- ////////////////// 框架Script url (開始)(不能少) ////////////////// -->
	<%@include file="../includes/eScriptForBody.jsp"%>
	<!-- ////////////////// 框架Script (結束) //////////////////-->
	<script
  src="js/jquery-3.6.0.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
      <script src="js/sweetalert2.all.min.js"></script>
  <script>
    $(document).ready( function () {
        $('#table_id').DataTable(); 
        
        
        $("#delete").click(function(){
        	
        	var password = $("#password").val();
        	var vid =  $("input[type='radio']:checked").val();
        	console.log(vid);
        	
        	if($.trim(password) == "" || vid == null){
        		
        		Swal.fire({
        			  icon: 'error',
        			  title: 'Oops...',
        			  text: '請輸入密碼及選擇用戶',
        			})
        		return;
        		
        	}else{
        		
        		Swal.fire({
        			  title: 'Do you want to save the changes?',
        			  showDenyButton: true,
        			  showCancelButton: true,
        			  confirmButtonText: 'Save',
        			  denyButtonText: 'Don',
        			})
        			
        			.then((result) => {
        			  /* Read more about isConfirmed, isDenied below */
        				  
        		 			var vpassword = $("#password").val();
        		        	var id =  $("input[type='radio']:checked").val();
        		        	console.log(id);
        		        	
        		        	
        		        	var user ={
        		        			 "id":''+id,
        		   				  "password":''+vpassword
        		        	} 
        		        		
        		        		$.ajax({
        					  type:"POST",
        					  url:"/admin/delete2",
        					  contentType:'application/json',
        					  data:JSON.stringify(user),
        					  success:function(data){
        						  console.log(data);
        						  
        						 if(data.code =='1'){
        							 
        							Swal.fire({
        								  icon: 'error',
        								  title: 'Oops...',
        								  text: '密碼錯誤，請重新嘗試!',
        								})
        								return;
        							
        						  }else{
        							  
        							  Swal.fire({
        								  icon: 'success',
        								  title: '修改成功！',
        								  text: '修改成功，請重整確認狀態!',
        								})
        								return;
        						  }
        					  },//success
        					  error:function(err){console.log(err)},
        				  }); //ajax
        			}) //then
		     return;
        	}
        })//click   
    }); //底
    </script>
    </fieldset>
</body>
</html>
<% } %> 