<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!-- ////// Dashboard歡迎+訂購畫面  /////// -->
    
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
<style>
.recipeImg{
	width:70px;
}
</style>
</head>
<body id="body">

<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，
大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>

<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="會員中心" />
<jsp:param name="pagination" value="個人管理" />
</jsp:include>



<section class="user-dashboard page-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- ///// ↓這邊url最後都要再重新整理過!!!!(因為active位置不同,無法拆寫jsp QQ) -->
				<ul class="list-inline dashboard-menu text-center">
					<li><a class="active" href="dashboard.jsp">會員食譜</a></li>
					<li><a href="/userCollection/1002">食譜收藏</a></li>
					<li><a href="http://localhost:8091/gooAdd">寫食譜</a></li>
				</ul>
				<div class="dashboard-wrapper user-dashboard">
					<input type="hidden" id="userId" value="1002" >
					<div class="total-order mt-20">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th></th>
										<th>食譜名稱</th>
										<th>食譜簡介</th>
										<th style="width:80px;">修改</th>
										<th>刪除</th>
									</tr>
								</thead>
								<tbody id="table">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>
<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>
<script src="https://kit.fontawesome.com/2cf249db39.js" crossorigin="anonymous"></script>
<script>
$('#table').on('click','.deletebtn',function(){
	var form = $(this).parent();
	deleteCheck(form);
	
})
function deleteCheck(form){
	Swal.fire({
		  title: '確定要刪除嗎?',
		  showDenyButton: true,
		  showCancelButton: true,
		  confirmButtonText: '確定',
		  denyButtonText: '取消',
		}).then((result) => {
		  /* Read more about isConfirmed, isDenied below */
		  if (result.isConfirmed) {
		    Swal.fire('刪除成功', '', '成功').then((result)=>{
			  form.submit();
		    	
		    })
		  } else if (result.isDenied) {
		    Swal.fire('並未刪除', '', 'info')
		  }
		})
}
$(document).ready(function(){
	let userId = Number($('#userId').val());
	$.ajax({
        type: 'get',
        url: `userrecipe/` + userId,
        dataType: 'json',
        success: function (data) {
        	console.log(JSON.stringify(data))
            for (var i = 0; i < data.length; i++) {
                    console.log(data[i].recipeId)
                      let content=  `
                            <tr>
                             	<td><div><img class="recipeImg" src="${pageContext.request.contextPath}/` + data[i].imgPath + `" >  </div></td>
								<td><a href="${pageContext.request.contextPath}/reciperesult/` + data[i].recipeId + `"><p>`+data[i].recipeName+`</p></a></td>
								<td><p>`+data[i].recipeDescription+`</p></td>
								<td><a href="${pageContext.request.contextPath}/recipeForUpdate/`+ data[i].recipeId +`"><i class="fa-sharp fa-solid fa-pen-to-square"></i></a></td>
								<td> <form name="Form" action="/recipedelete/`+ data[i].recipeId + `" method="POST" ><button class="deletebtn" type="button"><i class="fa-sharp fa-solid fa-trash-can"></i></button> </form></td>
                             
                            </tr> `

                          $("#table").append(content)
        }
    }
})
})
</script>
<script src="js/jquery-3.6.0.js"></script>

<script>
 $(function(){
	 
	 $.ajax({
		  type:"POST", //請求方式
		  url:'/vertifyaccount22', //請求連結
		  contentType:'application/json', //請求格式
		//  data:JSON.stringify(account), //data =傳遞的資料，用JSON.strigify();將物件轉為JSON格式
		  success:function(data){
		     console.log(data)
		     if(data.result =='N'){
		    	 $('#useravatar').attr("src","images/user_icon.png")
		    	 var content='<li><a href="form">註冊</a></li>'
		    		 +'<li><a href="login">登入</a></li>'
		    		 
		    		//'<li><a href="admin/checkadminstatus2">管理者</a></li>';
		    		//+'<li><form action="users/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員</a></form></li>';
		    	  $('#userselect').append(content)
		   		
		   		}else if(data.result =='U' ){
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		  
		   		       var content=
		   		    	'<li><form action="users/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員中心</a></form></li>'
		   		              +'<li><a href="/all/logout">登出</a></li>';
		   		              
		   		              
		    	  $('#userselect').append(content)
			   		
		   		}else if(data.result =='A'){
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		 var content=
		   			'<li><form action="admin/checkadminstatus2" method="post" name="form3"><a href="javascript:document.form3.submit();">管理系統</a></form></li>'
		   		   +'<li><a href="/all/logout">登出</a></li>';
		    	 
		    	  $('#userselect').append(content)
		   			
		   		}else{
		   		 $('#useravatar').attr("src",data.user.avatar)
		   		  var content=
		   			 '<li><form action="/checkuserstatus" method="post" name="form3"><a href="javascript:document.form3.submit();">會員中心</a></form></li>'
		   		      +'<li><a href="/all/logout">登出</a></li>';
		    	 
		    	  $('#userselect').append(content)
		   		}
		     },//success
		    error:function(err){console.log(err)},
		  });//ajax
	 
	 
	 
	 
 })
 
 </script>



<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>

