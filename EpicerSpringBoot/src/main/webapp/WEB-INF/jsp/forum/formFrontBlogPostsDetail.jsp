	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.epicer.controller.forum.*,com.epicer.model.forum.*,com.epicer.service.forum.*,com.epicer.util.*,java.util.*"%>
    
<script type="text/javascript" src="https://platform-api.sharethis.com/js/sharethis.js#property=63296382a700c90019f6dc52&product=image-share-buttons" async="async"></script>
<script language='javascript' src='js/wangEditor.min.js'></script>
<script  src='js/sweetalert2.min.js'></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">
    <!-- ////// 這是多頁文章的串聯頁面  /////// -->
    
<style type="text/css">
#detail { 
 padding-top: 25%
 } 
#mydiv2 { 
 margin-top:30% 
 } 

button{
margin-left: 1%;
}
.w-e-text-container{
    height: 100px !important;/*!important是重点，因为原div是行内样式设置的高度300px*/
}

.multiline-ellipsis { 
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 5;
  overflow: hidden;
}


.pic {
  width: 500px;
  height: 350px;
  margin: 50px;
  border: 2px solid;
}
.pic img {
  object-fit: contain;
  width: 500px;
  height: 350px;
}

.searchTitle{
  z-index: 10;     
  position: fixed;      
  top:10%;
  width:65%;
  left: 13%;
  opacity: 0.94;
  transition: opacity .5s ease-out;  

}

.searchInput{
width:280px;
height:28px;
border:2px solid;
float:left;
margin-top:20px;
border-bottom-left-radius:15px;
border-top-left-radius:15px;
outline:none;

}

.searchButton{
margin-left:20%;
border:2px solid;
background-color: #f4f5f7;
height:46px
}



</style>

<script>
$(document).ready(function(){
	queryReply();
	queryCollect();
	announcementPage()
});


function queryAll(){
		if(document.getElementById("div1")!==null){
		document.getElementById("detail").remove();
	}
		
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				
				var data = JSON.parse(this.responseText);
				var category = ['全榖雜糧', '豆魚蛋肉', '蔬菜', '水果', '乳品', '油脂與堅果種子'];
				var resultText = '';
				var reports=0;
				for(var i=0;i<data.length;i++){
					var time = new Date(data[i].date);
					reports++;
					resultText +=
					"<div class='post'>"+
					"<h1 class='post-title' style='font-size:30px;margin:0 0 0 8%'>"+data[i].title+
					"<button type='button' class='btn btn-warning btn-xs' style='margin-left:10px' name='"+data[i].plateformCategoryId+"' onclick='category(this)'>"+
					category[data[i].plateformCategoryId-1]+"</button>"+"</h1>"+
		            "<form action='articleFrontDetail' method='post'>"+
					"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
					"<div class='multiline-ellipsis' onclick='this.parentNode.submit()' style='margin:0 0 0 11%'>"+
					data[i].articleContent+
					"</div>"+
					"</form>"+
					"<div class='post-meta' style='margin-top:3%;padding-left:11%'>"+
						"<ul>"+
							"<li style='font-size: 18px'>"+
							"<i class='tf-ion-ios-calendar'></i>"+time.toLocaleString()+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-ios-heart'></i>"+data[i].articleLike+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-chatbubbles'></i>"+data[i].articleReplys+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-android-person'></i>"+data[i].articleViews+
							"</li>"+
							
							"<li style='font-size: 18px' class = 'judge"+i+"'>"+
								"<form action='forumFrontUpdatePage' method='post'>"+
								"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
								"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
								"</form>"+
							"</li>"+
							
								
							"<li style='font-size: 18px' class = 'judge"+i+"'>"+
								"<input type='hidden' name='number' id ='number"+i+"' value="+data[i].articleId+">"+
								"<input type='hidden' name='articleId' id ='articleID"+i+"' value="+data[i].articleId+">"+
								"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
							"</li>"+
							"<li style='font-size: 18px;'  id = 'reports"+reports+"'>"+
								 "<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
							"</li>"+
								
						"</ul>"+
					"</div>"+
				"</div>"
				  
				}
				document.getElementById("searchTitle").value = ""
				document.getElementById("mydiv2").innerHTML = resultText;
				var report=1;
				for(let i=0;i<data.length;i++){
					judgeIndexPage(data[i].user.userId,i,report);
					report++;
				}
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("get","frontQueryAllAjax",true)
	//4.發送請求
	xhr.send()
	
}


function querytitle(){
	
	if(document.getElementById("div1")!==null){
		document.getElementById("detail").remove();
	}
		
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				
				var data = JSON.parse(this.responseText);
				var category = ['全榖雜糧', '豆魚蛋肉', '蔬菜', '水果', '乳品', '油脂與堅果種子'];
				var resultText = '';
				var reports=0;
				for(var i=0;i<data.length;i++){
					var time = new Date(data[i].date);
					reports++;
					resultText +=
					"<div class='post'>"+
					"<h1 class='post-title' style='font-size:30px;margin:0 0 0 8%'>"+data[i].title+
					"<button type='button' class='btn btn-warning btn-xs' style='margin-left:10px'  name='"+data[i].plateformCategoryId+"' onclick='category(this)'>"+
					category[data[i].plateformCategoryId-1]+"</button>"+"</h1>"+
		            "<form action='articleFrontDetail' method='post'>"+
					"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
					"<div class='multiline-ellipsis' onclick='this.parentNode.submit()' style='margin:0 0 0 11%'>"+
					data[i].articleContent+
					"</div>"+
					"</form>"+
					"<div class='post-meta' style='margin-top:3%;padding-left:11%'>"+
						"<ul>"+
							"<li style='font-size: 18px'>"+
							"<i class='tf-ion-ios-calendar'></i>"+time.toLocaleString()+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-ios-heart'></i>"+data[i].articleLike+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-chatbubbles'></i>"+data[i].articleReplys+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-android-person'></i>"+data[i].articleViews+
							"</li>"+
							"<li style='font-size: 18px' class = 'judge"+i+"'>"+
							"<form action='forumFrontUpdatePage' method='post'>"+
							"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
							"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
							"</form>"+
						"</li>"+
						"<li style='font-size: 18px' class = 'judge"+i+"'>"+
							"<input type='hidden' name='number' id ='number"+i+"' value="+data[i].articleId+">"+
							"<input type='hidden' name='articleId' id ='articleID"+i+"' value="+data[i].articleId+">"+
							"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
						"</li>"+
						"<li style='font-size: 18px;'  id = 'reports"+reports+"'>"+
							 "<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
						"</li>"+

						"</ul>"+
					"</div>"+
				"</div>"
				  
				}
				document.getElementById("mydiv2").innerHTML = resultText;
				document.getElementById("searchTitle").value = ""
					var report=1;
				for(let i=0;i<data.length;i++){
					judgeIndexPage(data[i].user.userId,i,report);
					report++;
				}

			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","frontQueryNameAjax",true)
	//4.發送請求
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	var searchTitle = document.getElementById("searchTitle").value;
	console.log(searchTitle);
	xhr.send("title="+searchTitle)
	
}



function category(category){
	
	if(document.getElementById("div1")!==null){
		document.getElementById("detail").remove();
	}
		
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				
				var data = JSON.parse(this.responseText);
				var category = ['全榖雜糧', '豆魚蛋肉', '蔬菜', '水果', '乳品', '油脂與堅果種子'];
				var resultText = '';
				var reports=0;
				for(var i=0;i<data.length;i++){
					var time = new Date(data[i].date);
					reports++;
					resultText +=
					"<div class='post'>"+
					"<h1 class='post-title' style='font-size:30px;margin:0 0 0 8%'>"+data[i].title+
					"<button type='button' class='btn btn-warning btn-xs' style='margin-left:10px'  name='"+data[i].plateformCategoryId+"' onclick='category(this)'>"+
					category[data[i].plateformCategoryId-1]+"</button>"+"</h1>"+
		            "<form action='articleFrontDetail' method='post'>"+
					"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
					"<div class='multiline-ellipsis' onclick='this.parentNode.submit()' style='margin:0 0 0 11%'>"+
					data[i].articleContent+
					"</div>"+
					"</form>"+
					"<div class='post-meta' style='margin-top:3%;padding-left:11%'>"+
						"<ul>"+
							"<li style='font-size: 18px'>"+
							"<i class='tf-ion-ios-calendar'></i>"+time.toLocaleString()+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-ios-heart'></i>"+data[i].articleLike+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-chatbubbles'></i>"+data[i].articleReplys+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-android-person'></i>"+data[i].articleViews+
							"</li>"+
							"<li style='font-size: 18px' class = 'judge"+i+"'>"+
							"<form action='forumFrontUpdatePage' method='post'>"+
							"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
							"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
							"</form>"+
						"</li>"+
						
							
						"<li style='font-size: 18px' class = 'judge"+i+"'>"+
							"<input type='hidden' name='number' id ='number"+i+"' value="+data[i].articleId+">"+
							"<input type='hidden' name='articleId' id ='articleID"+i+"' value="+data[i].articleId+">"+
							"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
						"</li>"+
						"<li style='font-size: 18px;'  id = 'reports"+reports+"'>"+
							 "<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
						"</li>"+

						"</ul>"+
					"</div>"+
				"</div>"
				  
				}
				document.getElementById("mydiv2").innerHTML = resultText;
				document.getElementById("searchTitle").value = ""
					var report=1;
				for(let i=0;i<data.length;i++){
					judgeIndexPage(data[i].user.userId,i,report);
					report++;
				}

			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","frontQueryCategoryAjax",true)
	//4.發送請求
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	var searchCategoryId = category.name;
	xhr.send("categoryId="+searchCategoryId)
	
}









function queryCollect(){
	
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				var data = JSON.parse(this.responseText);
				var resultText = '';
					if(data==true){
					resultText +=
						"<li style='font-size: 18px;list-style-type:none' id='favorite'>"+
						"<button type='button' class='btn btn-danger' onclick ='deleteCollect()'>取消收藏</button>"+
						"</li>";
				   }else if(data==false){
					   resultText +=
						   "<li style='font-size: 18px;list-style-type:none' id='favorite'>"+
							"<button type='button' class='btn bg-gradient-primary' onclick ='addCollect()' >收藏</button>"+
							"</li>";
				}
				document.getElementById("collect").innerHTML = resultText;
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","CollectStatus",true)
	//4.
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	var articleId = document.getElementById("ArticleId").value;
	xhr.send("articleId="+articleId)
	
}


function detailAjax(){
	
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				var data = JSON.parse(this.responseText);
				var time = new Date(data.date);
				console.log(data.articleLike);
				var resultText = '';
					
					resultText +=
						"<ul>"+
					"<li style='font-size: 18px'>"+
					"<i class='tf-ion-ios-calendar'></i>"+time.toLocaleString()+
					"</li>"+
					"<li style='font-size: 18px'>"+
					"<i class='tf-ion-chatbubbles'></i>"+data.articleReplys+
					"</li>"+
					"<li style='font-size: 18px'>"+
					"<i class='tf-ion-android-person'></i>"+data.articleViews+
					"</li>"+
					"</ul>";
				 
				document.getElementById("detailAjax").innerHTML = resultText;
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","articleAjaxtDetail",true)
	//4.
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	var articleId = document.getElementById("ArticleId").value;
	xhr.send("articleId="+articleId);
	
	
}





function queryReply(){
	
	if($('textarea').val()!=""){
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				var data = JSON.parse(this.responseText);
				var o = 0;
				var reports=0;
				var resultText = '';
				for(var i=0;i<data.length;i++){
					var time = new Date(data[i].articleReplyDate);
					console.log(data);
					o++
					reports++
					resultText +=
						"<div class='post-comments'>"+
						"<ul class='media-list comments-list m-bot-50 clearlist'>"+
						"<li class='media'>"+
						"<a class='pull-left' href='#!'>"+
						" <img class='media-object comment-avatar' src='./source/images/blog/avater-1.jpg' alt='' width='50' height='50'>"+
						"</a>"+
						"<div class='media-body'>"+
						"<div class='comment-info'>"+
						" <div class='comment-author'>"+
								"<a href='#!'>"+data[i].user.userId+"</a>"+
								"<time style='margin-left:1%'>"+time.toLocaleString()+"</time>"+
						"</div>"+
								data[i].articleReplyContent+
						"</div>"+
						" </div>"+
						" </li>"+
						"<div>"+
						"<li style='font-size: 18px ;float:left' class = 'judge"+i+"'>"+
								"<form action='frontReplyUpdatePage' method='post'>"+
								"<input type='hidden' name='replyId' value='"+data[i].articleReplyId+"'>"+
								"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
								"</form>"+
						"</li>"+
						"<li style='font-size: 18px' class = 'judge"+i+"'>"+
								"<input type='hidden' name='replyId' id ='replyId"+i+"' value="+data[i].articleReplyId+">"+
								"<button type='button' class='btn btn-outline-warning' onclick='delReply("+i+")'>刪除</button>"+
								"</form>"+
						"</li>"+
						"<li style='font-size: 18px;'  id = 'reports"+reports+"'>"+
								"<button type='button' class='btn btn-outline-warning' onclick='replyReport("+i+")'>檢舉</button>"+
						"</li>"+
						"</div>"+
						"</ul>"+
						"</div>";
				}
				detailAjax();
				document.getElementById("comments").innerHTML ="<h3 class='post-sub-heading'>"+o+" Comments</h3>";
				document.getElementById("mydiv").innerHTML = resultText;
				
				var report=1;
				for(let i=0;i<data.length;i++){
					judgeIndexPage(data[i].user.userId,i,report);
					report++;
				}
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","replyFrontDetail",true)
	//4.發送請求
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	var articleId = document.getElementById('ArticleId').value;
	var replyContent = $('textarea').val();
	xhr.send("articleId="+articleId+"&"+"replyContent="+replyContent)
	}
	else{
		var xhr = new XMLHttpRequest();
		//2.註冊回調函數
		xhr.onreadystatechange = function(){
			if(this.readyState ==4 ){
				if(this.status==200){
					var data = JSON.parse(this.responseText);
					var o = 0;
					var reports=0;
					var resultText = '';
					for(let i=0;i<data.length;i++){
						
						var time = new Date(data[i].articleReplyDate);
						o++
						reports++
							resultText +=
									"<div class='post-comments'>"+
									"<ul class='media-list comments-list m-bot-50 clearlist'>"+
									"<li class='media'>"+
										"<a class='pull-left' href='#!'>"+
										" <img class='media-object comment-avatar' src='./source/images/blog/avater-1.jpg' alt='' width='50' height='50'>"+
										"</a>"+
									"<div class='media-body'>"+
									"<div class='comment-info'>"+
									" <div class='comment-author'>"+
											"<a href='#!'>"+data[i].user.userId+"</a>"+
											"<time style='margin-left:1%'>"+time.toLocaleString()+"</time>"+
									"</div>"+
											data[i].articleReplyContent+
									"</div>"+
									" </div>"+
									" </li>"+
									"<div>"+
									"<li style='font-size: 18px;float:left' class = 'judge"+i+"'>"+
											"<form action='frontReplyUpdatePage' method='post'>"+
											"<input type='hidden' name='replyId' value='"+data[i].articleReplyId+"'>"+
											"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
											"</form>"+
									"</li>"+
									"<li style='font-size: 18px' class = 'judge"+i+"'>"+
											"<input type='hidden' name='replyId' id ='replyId"+i+"' value="+data[i].articleReplyId+">"+
											"<button type='button' class='btn btn-outline-warning' onclick='delReply("+i+")'>刪除</button>"+
											"</form>"+
									"</li>"+
									"<li style='font-size: 18px;'  id = 'reports"+reports+"'>"+
											"<button type='button' class='btn btn-outline-warning' onclick='replyReport("+i+")'>檢舉</button>"+
									"</li>"+
									"</div>"+
									"</ul>"+
									"</div>";
										
						}
					detailAjax();
					document.getElementById("comments").innerHTML ="<h3 class='post-sub-heading'>"+o+" Comments</h3>";
					document.getElementById("mydiv").innerHTML = resultText;
					var report=1;
					for(let i=0;i<data.length;i++){
						console.log(data[i].user)

						judgeIndexPage(data[i].user.userId,i,report);
						report++;
					}
				}else{
					alert(this.status);
				}
			}
		}
		xhr.open("post","replyFrontEmptyDetail",true)
		//4.發送請求
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
		var articleId = document.getElementById('ArticleId').value;
		var replyContent = $('textarea').val();
		xhr.send("articleId="+articleId)
		
	}


}



function announcementPage(){
	document.getElementById("searchTitle").value = ""
	
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				var data = JSON.parse(this.responseText);
				var category = ['全榖雜糧', '豆魚蛋肉', '蔬菜', '水果', '乳品', '油脂與堅果種子'];
				var photo = '';
				var list = '';
				var o = 0;
				var w=0;
				for(var i=0;i<data.length;i++){
					o++
					var time = new Date(data[i].date);
					photo +="<li><img src='./images/公告.jpg' alt='Image' style='position: relative'>"+
					"<form action='articleFrontDetail' method='post'>"+
					"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
					"<div onclick='this.parentNode.submit()'>"+
					"<h4 style='position: absolute; top: 125px; left:"+w+"px;height:100px;width:250px;word-break: normal;background-color:#fcfcd5;text-align: center;padding-top:12px'>"+data[i].title+"</h4>"+
					"</div>"+
					"</form></li>";
					list +="<li ></li>";
					w+=250;
			   }
				document.getElementById("photo").innerHTML = photo;
				document.getElementById("list").innerHTML = list;
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","QueryArticleReport",true)
	//4.發送請求
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	xhr.send("status="+2)
	
}









function del(id){
	Swal.fire({
		 title: '刪除文章',
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
		    	xhr.open("post","articleDelete",true);
		    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
		    	var articleId = document.getElementById("articleID"+id).value;
		    	var number = document.getElementById("number"+id).value;
		    	xhr.send("number="+number);
		    Swal.fire(
		    		 'Success!'
		    ).then((result) => {
		    	queryAll();
		    })
		  }
		})
	
}






function report(id){
	Swal.fire({
		 title: '檢舉文章',
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
		    	xhr.open("post","forumReport",true);
		    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
		    	var number = document.getElementById("number"+id).value;
		    	xhr.send("number="+number);
		    Swal.fire(
		    		 'Success!'
		    ).then((result) => {
		    	queryAll();
		    })
		  }
		})
	
}

function delReply(id){
	Swal.fire({
		 title: '刪除留言',
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
		    	xhr.open("post","replyDelete",true);
		    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
		    	var articleId = document.getElementById("ArticleId").value;
		    	var replyId = document.getElementById("replyId"+id).value;
		    	xhr.send("articleId="+articleId+"&"+"replyId="+replyId);
		    Swal.fire(
		    		 'Success!'
		    ).then((result) => {
		    	queryReply();
		    	})
		  }
		})
	
}



function replyReport(id){
	Swal.fire({
		 title: '檢舉留言',
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
		    	xhr.open("post","replyReport",true);
		    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
		    	var articleId = document.getElementById("ArticleId").value;
		    	var replyId = document.getElementById("replyId"+id).value;
		    	xhr.send("articleId="+articleId+"&"+"replyId="+replyId);
		    Swal.fire(
		    		 'Success!'
		      
		    ).then((result) => {
		    	
		    	queryReply();
		    	})
		  }
		})
	
}
		
$("#testReset").on("click",function(){
	editor.txt.clear();
})

function addCollect(){
	var xhr = new XMLHttpRequest();
	xhr.open("post","insertCollect",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
	var articleId = document.getElementById("ArticleId").value;
	xhr.send("articleId="+articleId);
	$("#favorite").empty();
	$("#favorite").append("<button type='button' class='btn btn-danger' onclick ='deleteCollect()'>取消收藏</button>");
}


function deleteCollect(){
	var xhr = new XMLHttpRequest();
	xhr.open("post","delCollect",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
	var articleId = document.getElementById("ArticleId").value;
	xhr.send("articleId="+articleId);
	$("#favorite").empty();
	$("#favorite").append("<button type='button' class='btn bg-gradient-primary' onclick ='addCollect()' >收藏</button>");

}


</script>
 <%ArticleBean detail = (ArticleBean)request.getSession().getAttribute("selectDetail"); %>
 <input type="hidden" name="userId" id ="userId" value="<%=Integer.parseInt(session.getAttribute("userId").toString())%>" readonly>
<div id ="detail"  style="margin:0 0 0 15%">
<table >
               <% String[] category = {"全榖雜糧","豆魚蛋肉","蔬菜","水果","乳品","油脂與堅果種子"};%>
            <div class='post'>
					<h1 class="post-title" style="font-size:30px;margin:0 0 0 -4%"><%=detail.getTitle()%>
					<button type='button' class='btn btn-warning btn-xs' style='margin-left:10px' name=<%=detail.getPlateformCategoryId()%> onclick='category(this)'>
					<%=category[detail.getPlateformCategoryId()-1]%></button></h1>
		           <div style="margin:0 0 0 4 %"><%=detail.getArticleContent()%>
					<div class="post-meta" style="margin-top:50px; text-align: left;">
					<div id="detailAjax" style="float:left"></div>
					 <div id ="collect"></div>
					</div>
					</div>
            </tbody>
</table>     


        <table>
       	   <tr>
				<input type="hidden" name="articleId" id ="ArticleId" value="<%=request.getParameter("articleId")%>" readonly>
				<input type="hidden" name="userId" id ="userId" value="<%=Integer.parseInt(session.getAttribute("userId").toString())%>" readonly>
			</tr>
            <tr>
                <div id="div1"></div>
                <textarea id="text1" name="replyContent" style="width:100%; height:200px ;display:none" cols="80" rows="20" required="required" ></textarea>
            </tr>
            <tr>
                <td><input type = "button"  id="testReset" name="submit" class="btn bg-gradient-primary" onclick="queryReply()" value="發佈"></td>
                <td><button type="button" class="btn btn-outline-warning"  id="replyInput">一鍵輸入</button></td>
            </tr>
        </table>

			<div class="post-social-share">
				        <h3 class="post-sub-heading">Share this post</h3>
				        <div class="social-media-icons">
								
																<div class="line-it-button" data-lang="zh_Hant" data-type="share-b" data-env="REAL" data-url="http://localhost:8091/articleFrontDetails?articleId=<%=request.getParameter("articleId")%>" data-color="default" data-size="large" data-count="false" data-ver="3" style="display: none;"></div>
				        </div>
			</div>
<div id = "comments" ></div>
<div id ="mydiv"></div>
</div>

<div id ="mydiv2"></div>		    

<script language='javascript' src='js/jquery-3.6.0.js'></script>
<script language='javascript' src='js/WangReply.js'></script>
<script src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js" async="async" defer="defer"></script>
<script>


function judgeIndexPage(id,i,report){
	var userID = document.getElementById('userId').value;
// 	document.getElementById('mydiv').children[1].firstChild.style.display="none";
	var x = document.getElementsByClassName('judge'+i);
	  if (id !=userID) {
		  for (var i = 0; i < x.length; i++) {
			  x[i].style.display="none";
		} 
	
	  }else{
		  console.log('reports'+report)
		  document.getElementById('reports'+report).style.display="none";
	  }
}

</script>
