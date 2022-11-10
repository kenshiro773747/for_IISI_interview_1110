<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- //////   文章(食譜/論壇) 右側有分類    ////////// -->    
    
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
<style>
p {
overflow:hidden visible;

}
</style>
 <style>
        .wrap {
            width: 720px;
            height: 160px;
            background-color: white;
            margin: 0 auto;
            position: relative;
            overflow: hidden; 
            left:0px;
        }

        .slide-img {
            position: absolute;
            left: 0;
            margin: 0;
            padding: 0;
            list-style: none;
            display: flex;
            width: 4000px;
			
        }

        .slide-img li {
            width: 240px;
            height: 160px;

        }

        .slide-img li img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.7; 
            filter: alpha(opacity=50); 
        }

        .pages {
            position: absolute;
            list-style: none;
            bottom: 10px;
            display: flex;
            margin: 0;
            padding: 0;
            width: 100%;
            justify-content: center;
		
        }

        .pages li {
            border: 3px solid white;
            width: 15px;
            height: 15px;
            border-radius: 50%;
            margin: 0 5px;
        }

        .slide-arrow {
            position: absolute;
            z-index: 2;
            background-color: 	#FFD2D2;
            font-size: 36px;
            width: 30px;
            height: 100%;
            display: flex;
            align-items: center;
            color: white;
            /* 透明度 */
            opacity: 0.3;
            /* 滑鼠型態 */
            cursor: pointer;
        }

        .right {
            right: 0;
        }

        .slide-arrow:hover {
            opacity: 1;
        }
        slide-img li p {
        position: relative;
        font-size: 36px;
         display: flex;
         z-index: 2;
         align-items: center;
        }
    </style>
</head>
<body id="body">


<!-- 主文內容 開始 -->

<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>

<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="食譜" />
<jsp:param name="pagination" value="食譜" />
</jsp:include>
<div class="page-wrapper" style="padding-top: 20px;">
	<div class="container">
		<div class="row col-12 col-md-8 ">
		
        <div class="wrap" style="margin-bottom:40px">
            <a class="slide-arrow right" id="slideNext"> <i class="fa-solid fa-square-caret-right"></i></a>
            <a class="slide-arrow left" id="slidePrev"><i class="fa-solid fa-square-caret-left"></i></a>
            <ul class="slide-img" style="left: 0px;margin-top: 0px;">
                <li ><a><img src="images/蒜香奶油烤鮭魚.webp" alt=""></a><p>蒜香奶油烤鮭魚</p></li>
                <li ><a><img src="images/塔香糖醋炒茄子.webp" alt=""></a><p>塔香糖醋炒茄子</p></li>
                <li><a><img src="images/塔香雞胸肉餅.webp" alt=""></a><p>塔香雞胸肉餅</p></li>
                <li><a><img src="images/嫩雞胸佐芒果莎莎醬(電鍋版).webp" alt=""></a><p>嫩雞胸佐芒果莎莎醬</p></li>
                <li><a><img src="images/蒜蓉豆腐蒸蝦.webp" alt=""></a><p>蒜蓉豆腐蒸蝦</p></li>
                <li><a><img src="images/西班牙蒜蝦佐法棍.webp" alt=""></a><p>西班牙蒜蝦佐法棍</p></li>
	            </ul>
            <ul class="pages" style="margin-bottom:0px">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
              <div class="col-12 col-md-10 " style="margin-bottom:35px">           
                <div class="row justify-content-start p-5">
                    <div class="col-11 col-md-12 p-4 ">
                        <div class="item row">
                        <div class="col-md-6 col-12">
                            <img src="" alt="" class="img-fluid w-100 " id="categoryImg" >
                           </div>
                            <div class="col-md-6 col-12">
                                <h3 id="categoryName"></h3>
                                <p id="categoryDescription"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="row recipearea justify-content-start" id="info">
                
            </div>


            <div class="page col text-center">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center pagecontainer">
                        <li class="page-item">
                            <a class="page-link" aria-label="Previous" id="first">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
         </div>
        
      		<div class="col-md-4">
					<!-- ///////////  文章頁的側邊 -推播專區 ///////////// -->
				<!-- @@include('blocks/post-sidebar.htm') -->
				<%@include file="../frontpartials/recipePostsidebar.jsp" %>
      		</div>
		</div>
	</div>
</div>


<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            var nowPage = 1;
            var totalPage = 4;
            var limitRows = 6;
            var totalRows = 0;
            var startRows = 0;
            var endRows = 4;
            var list = new Array();
            var tab = $('#info');
            var now = $('#now');
            var total = $('#total');
            let categoryId = Number($('#categoryId').val());
            $.ajax({
                type: 'get',
                url: 'recipeAjax',
                dataType: 'json',
                success: function (data) {
                	console.log(JSON.stringify(data))
                    var tg = Math.floor(data.length / limitRows);
                    if (Math.floor(data.length % limitRows) == 0) {
                        totalPage = tg;
                    } else {
                        totalPage = tg + 1;
                    }
                    ///存入到陣列////
                    list = data;
                    /////初始化顯示資料///
					generate(totalPage);
                    disp(nowPage, list);
                }
            })
			function generate(totalPage) {
            	
                for (var i = 1; i < (totalPage + 1); i++) {
                    let content = `<li class="page-item appended" ><a class="page-link page-index">`
                        + i + `</a></li>`
                    $('.pagecontainer').append(content);
                }
                let next = `<li class="page-item appended">
                    <a class="page-link " aria-label="Next" id="next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>`
                	$('.pagecontainer').append(next);

            }
            // ///2.按頁號顯示資料
            function disp(n, d) {
                ///先刪除之前的,再建立新的
                $("div").remove(".recipecard");
                ////求每頁從1開始,要得到陣列開始下標要減一為從0開始
                startRows = (n - 1) * limitRows;
                endRows = startRows + limitRows;
                for (var i = startRows; i < endRows ; i++) {
                    var t = '<div class="col-11 col-md-4 p-4 recipecard h-50 " style="height:400px">'+
                         '<div class="item">'+
                             '<a href="${pageContext.request.contextPath}/reciperesult/'+list[i].recipeId+'">'+'<img src="'+list[i].imgPath+'" alt="" class="img-fluid w-100"  >'+
                            '<h3>' + list[i].recipeName + '</h3>'+
                            '<p style="height:150px">' + list[i].recipeDescription + '</p></div></div>';
                    tab.append(t);
                }
            } //disp
            // //3.下一頁////
            $('.pagecontainer').on('click','#next',function () {
            	console.log(345)
                ++nowPage;
                //alert(nowPage)
                if (nowPage > totalPage) {
                    ////此處減一是因為陣列下標是最大長度減一的
                    nowPage = totalPage;
                }
                //先顯示頁數後展示數

                ///要後顯示,否則頁數切換不正確
                disp(nowPage, list);
            });
            ///////4.上一頁/////
            $("#first").click(function () {
                --nowPage;
                if (nowPage < 1) {
                    ////此處為0,傳遞的是陣列的最小標
                    nowPage = 1;
                }
                //先顯示頁數後展示資料
                disp(nowPage, list);
            });
            /////5.首頁
            $("#start").click(function () {
                //先顯示頁數後展示資料
                nowPage = 1; //注意變數的值要設

                disp(nowPage, list);
            });
            /////6.尾頁
            $("#end").click(function () {
                //先顯示頁數後展示資料
                nowPage = totalPage; //注意變數的值要設

                disp(nowPage, list);
            });
            $('.pagecontainer').on('click','.page-index',function () {
            	console.log($(this).text())
                nowPage = Number($(this).text());
                disp(nowPage, list);
            })
        });
    </script>
    <script>
        $(function () {
            'use strict'
            let index = 0
            let slideMove = 0
            let timer
            $('.pages li').eq(0).css('background', 'white')
            $('.pages li').click(function () {
                // $('.slide-img').css('left', '-800px')
                index = $(this).index()
                // console.log(index)
                slideMove = 0 - index * 240
                $('.slide-img').css('left', slideMove)
                $(this).css('background', 'white').siblings().css('background', 'transparent')
            })
            let pagesli = $('.pages li').length
            $('#slideNext').click(function () {
                index++
                if (index >= pagesli) {
                    index = 0
                }
                slideMove = 0 - index * 240
                $('.slide-img').css('left', slideMove)
                $('.pages li').eq(index).css('background', 'white').siblings().css('background', 'transparent')
            })
            $('#slidePrev').click(function () {
                index--
                if (index < 0) {
                    index = pagesli - 1
                }
                slideMove = 0 - index * 240
                $('.slide-img').css('left', slideMove)
                $('.pages li').eq(index).css('background', 'white').siblings().css('background', 'transparent')
            })
            $(document).ready(function imgauto() {
                index = 0
                timer = setInterval(count, 3000);
            });
            function count() {
                ++index;
                if (index >= pagesli) {
                    index = 0
                }
                slideMove = 0 - index * 240
                $('.slide-img').css('left', slideMove)
                $('.pages li').eq(index).css('background', 'white').siblings().css('background', 'transparent')
            }
            $('.slide-img').mouseover(function () {

                clearInterval(timer);
                console.log('mouseover')
            })
            $('.slide-img').mouseleave(function () {
                slideMove = 0 - index * 240;
                $('.side-img').css('left', slideMove);
                $('.pages li').eq(index).css('background', 'white').siblings().css('background', 'transparent');
                timer = setInterval(count, 3000);
            })
        })
    </script>
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
 
     <script>
        $('#search').click(function () {
            var nowPage = 1;
            var totalPage = 4;
            var limitRows = 6;
            var totalRows = 0;
            var startRows = 0;
            var endRows = 4;
            var list = new Array();
            var tab = $('#info');
            var now = $('#now');
            var total = $('#total');
            var keyword = $('.keyword').val();
            console.log(keyword)
            var param = {"keyword":""+keyword}
            $.ajax({
                type: 'get',
                url: 'recipelist/',
                data:param,
                dataType: 'json',
                success: function (data) {
                	console.log(JSON.stringify(data))
                    var tg = Math.floor(data.length / limitRows);
                    if (Math.floor(data.length % limitRows) == 0) {
                        totalPage = tg;
                    } else {
                        totalPage = tg + 1;
                    }
                    ///存入到陣列////
                    list = data;
                    /////初始化顯示資料///
					generate(totalPage);
                    disp(nowPage, list);
                }
            })
			function generate(totalPage) {
            	$("li").remove(".appended");
                for (var i = 1; i < (totalPage + 1); i++) {
                    let content = `<li class="page-item appended" ><a class="page-link page-index">`
                        + i + `</a></li>`
                    $('.pagecontainer').append(content);
                }
                let next = `<li class="page-item appended">
                    <a class="page-link " aria-label="Next" id="next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>`
                	$('.pagecontainer').append(next);

            }
            function disp(n, d) {
                $("div").remove(".recipecard");
                startRows = (n - 1) * limitRows;
                endRows = startRows + limitRows;
                for (var i = startRows; i < endRows ; i++) {
                    var t = '<div class="col-11 col-md-4 p-4 recipecard h-50">'+
                         '<div class="item">'+
                             '<a href="${pageContext.request.contextPath}/reciperesult/'+list[i].recipeId+'">'+'<img src="'+list[i].imgPath+'" alt="" class="img-fluid w-100"  >'+
                            '<h3>' + list[i].recipeName + '</h3>'+
                            '<p style="height:150px">' + list[i].recipeDescription + '</p></div></div>';
                    tab.append(t);
                }
            } //disp
            $('.pagecontainer').on('click','#next',function () {
            	console.log(345)
                ++nowPage;
                if (nowPage > totalPage) {
                    nowPage = totalPage;
                }

                disp(nowPage, list);
            });
            $("#first").click(function () {
                --nowPage;
                if (nowPage < 1) {
                    nowPage = 1;
                }
                disp(nowPage, list);
            });
            /////5.首頁
            $("#start").click(function () {
                nowPage = 1; //注意變數的值要設

                disp(nowPage, list);
            });
            /////6.尾頁
            $("#end").click(function () {
                nowPage = totalPage; //注意變數的值要設

                disp(nowPage, list);
            });
            $('.pagecontainer').on('click','.page-index',function () {
            	console.log($(this).text())
                nowPage = Number($(this).text());
                disp(nowPage, list);
            })
        });
    </script>
</body>
</html>