<%@ page import="java.util.*,com.epicer.model.users.*,com.epicer.util.*"  language="java" contentType="text/html; charset=UTF-8"
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
    body{
   background-color: antiquewhite;
    }
    
    
    #table_id_length{
     margin-left: 150px;
    
    }
    
   #table_id_filter{
    margin-left: 140px;
    margin-top:15px;
      margin-bottom: 15px;
   }
   
   #table_id_info{
    margin-top:15px;
   margin-bottom: 15px;
   margin-left: 190px;
   }
   
    #table_id_paginate{
    margin-top:15px;
      margin-bottom: 15px;
   margin-left: 190px;
   }
    
    .center {
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  width: 80%;
  background-color:#fff;
  opacity: 1;
  border: 1px  solid transparents;
  border-radius: 15px;
  }
  
  select {
 background-color:#fff;
  opacity: 1;
  margin: 15px;
  width: 300px;
  height: 3em;
  padding: 8px;
  border-radius: 5px;
  }
  
  input{
  background-color:#fff;
  opacity: 1;
  margin: 15px;
  width: 100px;
  height: 3em;
  padding: 8px;
  border: 1px  solid transparents;
  border-radius: 5px;
  }
  
  button{
  background-color:#fff;
  opacity: 1;
  margin: 15px;
  width: 100px;
  height: 3em;
  padding: 8px;
  border: 1px  solid transparents;
  border-radius: 5px;
  }
 
   
   .down{
     margin-left: auto;
  margin-right: auto;
    }
    
    fieldset {
	            width: 1500px;
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
	<%@include file="../includes/eSidenavAdmin.jsp"%>
	<!-- ////////////////// Side Navber (結束) //////////////////-->
	<!-- //////////////////主畫面框架(開始) ////////////////// -->
	<main class="main-content position-relative border-radius-lg ">
		<!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->
<!-- ////////////////// 個人主文開始 //////////////////-->
<form action="user" method="post">
        <div style="margin-left:190px;margin-top:50px">
        <select name="status" id= status required>
         <option  value="7">所有使用者</option>
                    <option  value="0">管理者</option>
                    <option  value="1">正式會員</option>
                      <option  value="3">臨時會員</option>
                     <option  value="4">已停權</option>
                    </select>
<input type="submit" name="submit" value="搜尋" style="margin-left:10px;margin-top:15px">
</form>
</div>
<br>
<!-- class="center"  -->
<div>
  <table  class="table align-items-center w-100" id="table_id">
            <thead>
              <tr style="text-align:center;font-size:20px">
               <th>頭像</th>
                <th>使用者</th>
                <th>權限</th>
                <th>性別</th>
                <th>出生年/月/日</th>
               <th>連絡電話</th>
               <th>縣市</th>
                <th>市鄉鎮區</th>
                <th>完整地址</th>
                <th>上次登錄</th>
                <th>選擇</th>
              </tr>
            </thead>
 <tbody>
          <%
List<EpicerUser> list = (List<EpicerUser>)session.getAttribute("list");
ListIterator it = list.listIterator();
Tools tools= new Tools();
while(it.hasNext()){
    EpicerUser user = (EpicerUser)it.next();
%>
 <!-- 頭像 -->
              <tr style="height: 75px;">
              <td>
               <span><img src="<%= user.getAvatar() %>" style="width:50px"></span>
              </td>
              
             <!-- 使用者 -->
                <td style="text-align:center">
                <span><%= user.getName() %></span><br>
                  <span><%= user.getAccount() %></span>
                </td>
                
                <!-- 權限 --> 
               <td>
               <span><%= tools.getStatusDes(user.getStatus()) %></span><br>
               <span>ID : <%= user.getId() %></span>
               </td>
               
                 <!-- 性別 --> 
               <td><%= tools.getGenderName(user.getGender())%></td>
               
                <!-- 出生年/月/日--> 
               <td>
               <span><%= tools.getStringDate(user.getBirth() )%></span><br>
               <span>年齡：<%=tools.getAge(user.getBirth()) %> 歲</span>
               </td>
               
               <!-- 連絡電話--> 
                <td><%= user.getPhone() %></td>
                
                <!-- 縣市 --> 
               <td><%= user.getCityName(user.getCity())%></td>
               
               <!--市鄉鎮區--> 
                <td><%= user.getTownship() %></td>
                
                 <!--完整地址--> 
               <td><%= user.getAddress() %></td>
               
                <!--上次登錄--> 
                <td><%= tools.getStringDate(user.getLogindate()) %></td>
                
                <!--停權--> 
  <td><input type="radio" id="selectedid" name="userid" value="<%= user.getId() %>"   style="width:16px"></td>
              </tr>
            <% }%>
            </tbody>
            <tr>
            <td colspan="11"> <input type="text" name="password" id="password" placeholder="員工密碼"  style="width:150px;text-align: center;" required></td>
            </tr>
            <tr>
            <td colspan="11">
             <button name="submit" id="delete" value="刪除"  style="float:left;margin-left:42%">刪除</button>      
<form action="back" method="post">
        <input type="submit" name="submit" value="返回" >
        </form>
            </td>
            </tr>
 </table>
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
  src="https://code.jquery.com/jquery-3.6.1.js"
  integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
  crossorigin="anonymous"></script>
    <script src="js/sweetalert2.all.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
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
        			  title: '是否確定將該用戶停權？',
        			  showDenyButton: true,
        			  showCancelButton: true,
        			  confirmButtonText: '是',
        			  denyButtonText: '否',
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
</body>
</html>