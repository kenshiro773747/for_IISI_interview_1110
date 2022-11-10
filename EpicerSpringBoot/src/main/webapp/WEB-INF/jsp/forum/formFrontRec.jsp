<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ////// 這頁可以作為會員中心for 收藏/論壇/食譜使用  /////// -->
    
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">

<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>
<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="會員中心" />
<jsp:param name="pagination" value="個人管理" />
</jsp:include>
<style type="text/css">
form {
    display: inline;
}
span{
position: relative;
 overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  max-width: 140px;
  display: inline-block;
  height:20px;
}
</style>
<script >
$(document).ready(function(){
	btnArticle()
});
function btnArticle(){
	
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				var data = JSON.parse(this.responseText);
				var category = ['全榖雜糧', '豆魚蛋肉', '蔬菜', '水果', '乳品', '油脂與堅果種子'];
				var resultText = '';
				for(var i=0;i<data.length;i++){
					var time = new Date(data[i].date);
					if(data[i].status==1){
					resultText +=
						"<tr style='background-color:#FFD494'>"+
						  "<td>"+
				            "<div class='d-flex px-2 py-1'>"+
				            "<form action='articleFrontDetail' method='post'>"+
							"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
							"<button type='submit' class='btn bg-gradient-primary'>"+(i+1)+"</button>"+
							"</form>"+
				            "</div>"+
				          "</td>"+
				          "<td>"+
				            "<p class='text-xs font-weight-bold mb-0'>"+category[data[i].plateformCategoryId-1]+"</p>"+
				          "</td>"+
				          
				          "<td>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].title+"</span>"+
				         "</td>"+
				         "<td>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+time.toLocaleString()+"</span>"+
				          "</td>"+
				          
				          "<td>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleContent+"</span>"+
				          "</td>"+
				          "<td>"+
		                    "<div class='btn-group' role='group'>"+
		                      
		                      "<form action='UserUpdateArticlePage' method='post' style='float: left;'>"+
								"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
								"<button type='submit' class='btn btn-default'>"+
			                     "<i class='tf-pencil2' aria-hidden='true'>"+
			                     "</i>"+
			                      "</button>"+
								"</form>"+
								
		                      "<button type='button' class='btn btn-default' onclick='del("+i+")'>"+
		                      "<i class='tf-ion-close' aria-hidden='true'>"+
		                      "<input type='hidden' name='number"+i+"' id='number"+i+"' value="+data[i].articleId+">"+
		                      "</i>"+
		                      "</button>"+
		                    "</div>"+
		                    "</td>"+
		                    "</tr>"
					        
				   }else if(data[i].status==0){
						resultText +=
							"<tr>"+
							 "<td>"+
					            "<div class='d-flex px-2 py-1'>"+
					            "<form action='articleFrontDetail' method='post'>"+
								"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
								"<button type='submit' class='btn bg-gradient-primary'>"+(i+1)+"</button>"+
								"</form>"+
					            "</div>"+
					          "</td>"+
					          "<td>"+
					            "<p class='text-xs font-weight-bold mb-0'>"+category[data[i].plateformCategoryId-1]+"</p>"+
					          "</td>"+
					          
					          "<td>"+
					            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].title+"</span>"+
					         "</td>"+
					         "<td>"+
					            "<span class='text-secondary text-xs font-weight-bold'>"+time.toLocaleString()+"</span>"+
					          "</td>"+
					          
					          "<td>"+
					            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleContent+"</span>"+
					          "</td>"+
					          "<td>"+
		                    "<div class='btn-group' role='group'>"+
		                      
		                      "<form action='UserUpdateArticlePage' method='post' style='float: left;'>"+
								"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
								"<button type='submit' class='btn btn-default'>"+
			                     "<i class='tf-pencil2' aria-hidden='true'>"+
			                     "</i>"+
			                      "</button>"+
								"</form>"+
								
		                      "<button type='button' class='btn btn-default' onclick='del("+i+")'>"+
		                      "<i class='tf-ion-close' aria-hidden='true'>"+
		                      "<input type='hidden' name='number"+i+"' id='number"+i+"' value="+data[i].articleId+">"+
		                      "</i>"+
		                      "</button>"+
		                    "</div>"+
		                    "</td>"+
		                    "</tr>"
					}
					}
				document.getElementById("mydivRec").innerHTML = resultText;
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("get","QueryUserArticle",true)
	//4.發送請求
	xhr.send()
	
}



function btnReply(){
	
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				var data = JSON.parse(this.responseText);
				var category = ['全榖雜糧', '豆魚蛋肉', '蔬菜', '水果', '乳品', '油脂與堅果種子'];
				var resultText = '';
				for(var i=0;i<data.length;i++){
					var time = new Date(data[i].articleReplyDate);
					if(data[i].status==1){
					resultText +=
						"<tr style='background-color:#FFD494'>"+
						  "<td>"+
				            "<div class='d-flex px-2 py-1'>"+
				            "<form action='articleFrontDetail' method='post'>"+
							"<input type='hidden' name='articleId' value='"+data[i].articleId.articleId+"'>"+
							"<button type='submit' class='btn bg-gradient-primary'>"+(i+1)+"</button>"+
							"</form>"+
				            "</div>"+
				          "</td>"+
				          "<td>"+
				            "<p class='text-xs font-weight-bold mb-0'>"+category[data[i].articleId.plateformCategoryId-1]+"</p>"+
				          "</td>"+
				          
				          "<td>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleId.title+"</span>"+
				         "</td>"+
				         "<td>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+time.toLocaleString()+"</span>"+
				          "</td>"+
				          
				          "<td>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleId.articleContent+"</span>"+
				          "</td>"+
				          "<td>"+
		                    "<div class='btn-group' role='group'>"+
		                      
		                      "<form action='UserUpdateReplyPage' method='post' style='float: left;'>"+
								"<input type='hidden' name='replyId' value='"+data[i].articleReplyId+"'>"+
								"<button type='submit' class='btn btn-default'>"+
			                     "<i class='tf-pencil2' aria-hidden='true'>"+
			                     "</i>"+
			                      "</button>"+
								"</form>"+
								
		                      "<button type='button' class='btn btn-default' onclick='replydel("+i+")'>"+
		                      "<i class='tf-ion-close' aria-hidden='true'>"+
		                      "<input type='hidden' name='replyId' id='replyId"+i+"' value="+data[i].articleReplyId+">"+
		                      "</i>"+
		                      "</button>"+
		                    "</div>"+
		                    "</td>"+
		                    "</tr>"
					        
				   }else if(data[i].status==0){
						resultText +=
							"<tr>"+
							  "<td>"+
					            "<div class='d-flex px-2 py-1'>"+
					            "<form action='articleFrontDetail' method='post'>"+
								"<input type='hidden' name='articleId' value='"+data[i].articleId.articleId+"'>"+
								"<button type='submit' class='btn bg-gradient-primary'>"+(i+1)+"</button>"+
								"</form>"+
					            "</div>"+
					          "</td>"+
					          "<td>"+
					            "<p class='text-xs font-weight-bold mb-0'>"+category[data[i].articleId.plateformCategoryId-1]+"</p>"+
					          "</td>"+
					          
					          "<td>"+
					            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleId.title+"</span>"+
					         "</td>"+
					         "<td>"+
					            "<span class='text-secondary text-xs font-weight-bold'>"+time.toLocaleString()+"</span>"+
					          "</td>"+
					          
					          "<td>"+
					            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleId.articleContent+"</span>"+
					          "</td>"+
					          "<td>"+
			                    "<div class='btn-group' role='group'>"+
			                      
			                      "<form action='UserUpdateReplyPage' method='post' style='float: left;'>"+
									"<input type='hidden' name='replyId' value='"+data[i].articleReplyId+"'>"+
									"<button type='submit' class='btn btn-default'>"+
				                     "<i class='tf-pencil2' aria-hidden='true'>"+
				                     "</i>"+
				                      "</button>"+
									"</form>"+
									
			                      "<button type='button' class='btn btn-default' onclick='replydel("+i+")'>"+
			                      "<i class='tf-ion-close' aria-hidden='true'>"+
			                      "<input type='hidden' name='replyId' id='replyId"+i+"' value="+data[i].articleReplyId+">"+
			                      "</i>"+
			                      "</button>"+
			                    "</div>"+
			                    "</td>"+
			                    "</tr>"
					}
					}
				document.getElementById("mydivRec").innerHTML = resultText;
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("get","QueryUserReply",true)
	//4.發送請求
	xhr.send()
	
}



function btnCollect(){
	
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				var data = JSON.parse(this.responseText);
				var category = ['全榖雜糧', '豆魚蛋肉', '蔬菜', '水果', '乳品', '油脂與堅果種子'];
				var resultText = '';
				for(var i=0;i<data.length;i++){
					var time = new Date(data[i].articleId.date);
				if(data[i].articleId.status==1){
					resultText +=
						"<tr style='background-color:#FFD494'>"+
						  "<td>"+
				            "<div class='d-flex px-2 py-1'>"+
							"<input type='hidden' name='articleId' value='"+data[i].articleId.articleId+"'>"+
							"<button type='button' class='btn bg-gradient-primary' style='background-color:#FFD494'>"+(i+1)+"</button>"+
				            "</div>"+
				          "</td>"+
				          "<td>"+
				            "<p class='text-xs font-weight-bold mb-0'>"+category[data[i].articleId.plateformCategoryId-1]+"</p>"+
				          "</td>"+
				          
				          "<td>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleId.title+"</span>"+
				         "</td>"+
				         "<td>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+time.toLocaleString()+"</span>"+
				          "</td>"+
				          
				          "<td>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleId.articleContent+"</span>"+
				          "</td>"+
				          "<td>"+
		                    "<div class='btn-group' role='group'>"+
		                      
		                      "<button type='button' class='btn btn-default'onclick='collectdel("+i+")'>"+
		                      "<i class='tf-ion-close' aria-hidden='true'>"+
		                      "<input  type='hidden' name='articleId' id='articleId"+i+"' value="+data[i].articleId.articleId+">"+
		                      "</i>"+
		                      "</button>"+
		                    "</div>"+
		                    "</td>"+
		                    "</tr>"
		                    
					}else if(data[i].articleId.status==0){
						resultText +=
						"<tr>"+
						  "<td>"+
				            "<div class='d-flex px-2 py-1'>"+
				            "<form action='articleFrontDetail' method='post'>"+
							"<input type='hidden' name='articleId' value='"+data[i].articleId.articleId+"'>"+
							"<button type='submit' class='btn bg-gradient-primary'>"+(i+1)+"</button>"+
							"</form>"+
				            "</div>"+
				          "</td>"+
				          "<td>"+
				            "<p class='text-xs font-weight-bold mb-0'>"+category[data[i].articleId.plateformCategoryId-1]+"</p>"+
				          "</td>"+
				          
				          "<td>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleId.title+"</span>"+
				         "</td>"+
				         "<td>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+time.toLocaleString()+"</span>"+
				          "</td>"+
				          
				          "<td>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleId.articleContent+"</span>"+
				          "</td>"+
				          "<td>"+
		                    "<div class='btn-group' role='group'>"+
		                      
		                      "<button type='button' class='btn btn-default'onclick='collectdel("+i+")'>"+
		                      "<i class='tf-ion-close' aria-hidden='true'>"+
		                      "<input  type='hidden' name='articleId' id='articleId"+i+"' value="+data[i].articleId.articleId+">"+
		                      "</i>"+
		                      "</button>"+
		                    "</div>"+
		                    "</td>"+
		                    "</tr>"
				
				
					}
					}
				document.getElementById("mydivRec").innerHTML = resultText;
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("get","QueryRec",true)
	//4.發送請求
	xhr.send()
	
}



function del(id){
	Swal.fire({
		  title:'刪除文章',
		  text: "確認後無法復原",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText: '取消',
		  confirmButtonText: '確認!',
		}).then((result) => {
		  if (result.isConfirmed) {
			  var xhr = new XMLHttpRequest();
		    	xhr.open("post","UserDeleteArticle",true);
		    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
		    	var number = document.getElementById("number"+id).value;
		    	xhr.send("number="+number);
		    Swal.fire(
		    		 'Success!'
		    ).then((result) => {
		    	btnArticle();
		    })
		  }
		})
	
}





function replydel(id){
Swal.fire({
	 title:'刪除留言',
	  text: "確認後無法復原",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  cancelButtonText: '取消',
	  confirmButtonText: '確認!',
	}).then((result) => {
	  if (result.isConfirmed) {
		  var xhr = new XMLHttpRequest();
	    	xhr.open("post","UserDeleteReply",true);
	    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
	    	var replyId = document.getElementById("replyId"+id).value;
	    	xhr.send("replyId="+replyId);
	    Swal.fire(
	    		 'Success!'
	    ).then((result) => {
	    	btnReply();
	    })
	  }
	})

}

function collectdel(id){
Swal.fire({
	  title:'刪除收藏',
	  text: "確認後無法復原",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  cancelButtonText: '取消',
	  confirmButtonText: '確認!',
	}).then((result) => {
	  if (result.isConfirmed) {
		  var xhr = new XMLHttpRequest();
	    	xhr.open("post","UserdelRec",true);
	    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
	    	var articleId = document.getElementById("articleId"+id).value;
	    	xhr.send("articleId="+articleId);
	    Swal.fire(
	    		 'Success!'
	    ).then((result) => {
	    	btnCollect();
	    })
	  }
	})

}
</script>

<section class="user-dashboard page-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
      <!-- ///// ↓這邊url最後都要再重新整理過!!!!(因為active位置不同,無法拆寫jsp QQ) -->
        <ul class="list-inline dashboard-menu text-center">
<!--           <li><a href="dashboard.jsp">Dashboard歡迎+訂購畫面</a></li> -->
<!--           <li><a href="order.jsp">Order(訂單/課程)</a></li> -->
<!--           <li><a class="active" href="address.jsp">Address(文章管理/收藏/食譜)</a></li> -->
<!--           <li><a href="profiledetails.jsp">個人資料維護</a></li> -->
          <li><a href="javascript:void(0)" onclick="btnArticle()" >文章記錄</a></li>
          <li><a href="javascript:void(0)" onclick="btnReply()()" >留言紀錄</a></li>
          <li><a href="javascript:void(0)" onclick="btnCollect()" >收藏紀錄</a></li>
        </ul>
      <!-- ///// ↑ 這邊url最後都要再重新整理過!!!!(因為active位置不同,無法拆寫jsp QQ) -->  
        <div class="dashboard-wrapper user-dashboard">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>類型</th>
                  <th>標題</th>
                  <th>時間</th>
                  <th>內文</th>
                  <th class="col-md-2 col-sm-3">操作</th>
                </tr>
              </thead>
              <tbody id ="mydivRec"/>
            </table>
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

</body>
</html>