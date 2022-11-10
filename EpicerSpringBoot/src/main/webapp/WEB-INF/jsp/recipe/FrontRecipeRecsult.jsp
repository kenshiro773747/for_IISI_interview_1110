<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- //////   文章(食譜/論壇) 右側有分類    ////////// -->    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
<style>
.offcanvas.show:not(.hiding), .offcanvas.showing {
    transform: none;
}
.offcanvas.hiding, .offcanvas.show, .offcanvas.showing {
    visibility: visible;
}
.offcanvas.offcanvas-start {
    top: 0;
    left: 0;
    width: var(--bs-offcanvas-width);
    border-right: var(--bs-offcanvas-border-width) solid var(--bs-offcanvas-border-color);
    transform: translateX(-100%);
}
.offcanvas {
    position: fixed;
    bottom: 0;
    z-index: var(--bs-offcanvas-zindex);
    display: flex;
    flex-direction: column;
    max-width: 100%;
    color: var(--bs-offcanvas-color);
    visibility: hidden;
    background-color: var(--bs-offcanvas-bg);
    background-clip: padding-box;
    outline: 0;
    transition: transform .3s ease-in-out;
}
.offcanvas, .offcanvas-lg, .offcanvas-md, .offcanvas-sm, .offcanvas-xl, .offcanvas-xxl {
    --bs-offcanvas-zindex: 1045;
    --bs-offcanvas-width: 400px;
    --bs-offcanvas-height: 30vh;
    --bs-offcanvas-padding-x: 1rem;
    --bs-offcanvas-padding-y: 1rem;
    --bs-offcanvas-color: ;
    --bs-offcanvas-bg: #fff;
    --bs-offcanvas-border-width: 1px;
    --bs-offcanvas-border-color: var(--bs-border-color-translucent);
    --bs-offcanvas-box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
}
*, ::after, ::before {
    box-sizing: border-box;
}
p {
 overflow:hidden visible;
 word-wrap: break-word;
 word-break: break-all;
}
.ingredient {
            text-align: center;
        }
.back {
	background-color:#FFF7FF;
	border: 2px solid #FFF7FF;
	border-radius: 10px;
}
</style>
<style>
        


button {
    appearance: auto;
    writing-mode: horizontal-tb !important;
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-weight: ;
    font-stretch: ;
    font-size: ;
    font-family: ;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    box-sizing: border-box;
    background-color: buttonface;
    margin: 0em;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonborder;
    border-image: initial;
}
button, select {
    text-transform: none;
}

button, input, optgroup, select, textarea {
    margin: 0;
    font: inherit;
    color: inherit;
}
button {
    overflow: visible;
}

button, select {
    text-transform: none;
}
button, input, select, textarea {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}
[type=button], [type=reset], [type=submit], button {
    -webkit-appearance: button;
}

.accordion-button {
    position: relative;
    display: flex;
    align-items: center;
    width: 100%;
    padding: var(--bs-accordion-btn-padding-y) var(--bs-accordion-btn-padding-x);
    font-size: 1rem;
    color: var(--bs-accordion-btn-color);
    text-align: left;
    background-color: var(--bs-accordion-btn-bg);
    border: 0;
    border-radius: 0;
    overflow-anchor: none;
    transition: var(--bs-accordion-transition);
}
[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
    cursor: pointer;
}

.accordion-button:not(.collapsed) {
    color: var(--bs-accordion-active-color);
    background-color: var(--bs-accordion-active-bg);
    box-shadow: inset 0 calc(-1 * var(--bs-accordion-border-width)) 0 var(--bs-accordion-border-color);
}
.accordion-item:first-of-type .accordion-button {
    border-top-left-radius: var(--bs-accordion-inner-border-radius);
    border-top-right-radius: var(--bs-accordion-inner-border-radius);
}
.accordion {
    --bs-accordion-color: #212529;
    --bs-accordion-bg: #fff;
    --bs-accordion-transition: color 0.15s ease-in-out,background-color 0.15s ease-in-out,border-color 0.15s ease-in-out,box-shadow 0.15s ease-in-out,border-radius 0.15s ease;
    --bs-accordion-border-color: var(--bs-border-color);
    --bs-accordion-border-width: 1px;
    --bs-accordion-border-radius: 0.375rem;
    --bs-accordion-inner-border-radius: calc(0.375rem - 1px);
    --bs-accordion-btn-padding-x: 1.25rem;
    --bs-accordion-btn-padding-y: 1rem;
    --bs-accordion-btn-color: #212529;
    --bs-accordion-btn-bg: var(--bs-accordion-bg);
    --bs-accordion-btn-icon: url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23212529'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e);
    --bs-accordion-btn-icon-width: 1.25rem;
    --bs-accordion-btn-icon-transform: rotate(-180deg);
    --bs-accordion-btn-icon-transition: transform 0.2s ease-in-out;
    --bs-accordion-btn-active-icon: url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%230c63e4'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e);
    --bs-accordion-btn-focus-border-color: #86b7fe;
    --bs-accordion-btn-focus-box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
    --bs-accordion-body-padding-x: 1.25rem;
    --bs-accordion-body-padding-y: 1rem;
    --bs-accordion-active-color: #0c63e4;
    --bs-accordion-active-bg: #e7f1ff;
}
.container{
	margin-left:32px;
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
<input type="hidden" id="categoryId" value="2" >
<input type="hidden" id="recipeId" value="${recipe.recipeId }" >
<div class="page-wrapper" style="padding-top: 20px;">
	<div class="container row">
		 <div class="row col-md-8">
            <div class="col-12 col-md-12">
                <h1>${recipe.recipeName}</h1>
                <div class="row justify-content-start">
                    <div class="col-11 col-md-12 p-4 ">
                        <div class="item row back">
                            <img src="${pageContext.request.contextPath}/${recipe.imgPath}" alt="" class="img-fluid col-md-6 "style="padding-top:20px">
                            <div class="col-md-6 col-12 ">
                                <h3>UserName</h3>
                                <p>
                                    ${recipe.recipeDescription}
                                </p>
                                 <div class="like" style="width:80px;">
                                    <img src="${pageContext.request.contextPath}/images/1533.png" class="card-img-top w-100" alt="收藏食譜" id="like" style="width:60px">
                                </div>
                                <div class="like2" style="width:80px;display:none;">
                                    <img src="${pageContext.request.contextPath}/images/1534.png" class="card-img-bottom w-100" alt="收藏食譜" id="unlike" style="width:60px">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           <div class="detail back row">
            <div class="col-md-6 col-12 "style="margin-bottom: 25px;">
                <h3 style="text-align: center;">份量</h3>
                <div class="content">
                    <div class="data" style="text-align: center;border-top:1px solid grey;padding-bottom:10px"><h3>${recipe.howManyPeople}</h3></div>
                </div>
            </div>
            
            <div class="col-md-6 col-12" style="margin-bottom: 25px;">
                <h3 style="text-align: center;">時間</h3>
                <div class="content">
                    <div class="data" style="text-align: center;border-top:1px solid grey;padding-bottom:10px"><h3>${recipe.cookTime}</h3></div>
                </div>
            </div>
           </div>
             	
            <div class=" row recipe-details-ingredients col-12 back" style="margin-bottom: 25px;">
                <div class="ingredients accordion" id="accordionExample">
                <div class="accordion-item ">
                        <h2 class="accordion-header " id="headingOne">
                            <button class="accordion-button " type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"style="padding-top: 0px;padding-bottom: 0px;height: 40px;">
                               <h3 >食材</h3> 
                            </button>
                        </h2>
                        <div id="collapseOne"
                            class="accordion-collapse collapse show row justify-content-between col-12 col-md-12"
                            aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                   <c:forEach items="${requestScope.ingredients}" var="item">
                    <div class="ingredient col-11 col-md-6 row" style="margin-bottom:10px;">
                        <div class="ingredetail col-md-6 col-12" >${item.ingredient}</div>
                        <div class="amount col-md-6 col-12">${item.amount}</div>
                    </div>
                    </c:forEach>
                    </div>
                </div>
                </div>
            </div>
             <div class="productRecommand">
        <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample"
            aria-controls="offcanvasExample">
            推薦商品
        </button>
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample"
            aria-labelledby="offcanvasExampleLabel"style="margin-left:20px">
            <div class="offcanvas-header">
                <h3 class="offcanvas-title" id="offcanvasExampleLabel">商品推薦</h3>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close">返回食譜頁面</button>
            </div>
            <div>
                <h3> 點擊商品連結到商品頁面</h3>
                </div>
            <div>
            <c:forEach items="${requestScope.product}" var="product" >
            <div class="offcanvas-body row"style="margin-left:0px">
                
                <div style="margin-bottom: 10px;">
                    <a href="${pageContext.request.contextPath}/productDetail?ProductId=${product.productId}"><img src="${pageContext.request.contextPath}/${product.productImage}" alt="" style="width:100px">${product.productName }</a>
                    <input type="hidden" name="ProductId" value="${product.productId}">
                </div>
               
            </div>
            </c:forEach>
            </div>
        </div>
    </div>
            
            <div class=" row steparea back">
            <h3 style="margin-bottom:20px;border-bottom:1px black solid ;background-color: #DCB5FF;height:40px">詳細步驟</h3>
            <c:forEach items="${requestScope.step}" var="item" varStatus="status" >
                <div class="col-12 col-md-12 mb-5" style="margin-bottom: 25px;">
                    <figure class="figure row">
                        <img src="../${item.stepImage}" class="figure-img img-fluid rounded col-md-6 col-12" alt="..." style="width:200px">
                        <figcaption class="figure-caption text-start col-md-6 col-12">
                        <h3><span>${status.index+1}.</span></h3>
                        ${item.step}
                        </figcaption>
                    </figure>
                </div>
                </c:forEach>
                

            </div>
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
   
    $(document).ready(function(){
         var param ={"userId":1002,"recipeId":${recipe.recipeId }};
        $.ajax({
        	type: 'post',
            url: 'http://localhost:8091/checkCollection',
            data:param,
            dataType: 'json',
            success:function(data){
            	if(data=='0'){
            	console.log(data)
            		like();
            	}
            	//unlike();
            }
          
        })
    })
    function like (){
    	$('.like').attr("style", "width:60px;display:none;")
        $('.like2').attr("style", "width:60px;")
    }
    function unlike(){
    	  $('.like2').attr("style", "width:60px;display:none;")
          $('.like').attr("style", "width:60px;")
    }
        $('#like').click(function () {
            like();
            var param ={"userId":1002,"recipeId":${recipe.recipeId }};
            $.ajax({
            	type: 'post',
                url: 'http://localhost:8091/like',
                data:param,
                dataType: 'json',
                success:function(data){
                	console.log(data)
                }
              
            })
            
        })
        $('#unlike').click(function () {
            unlike();
            var param ={"userId":1002,"recipeId":${recipe.recipeId }};
            $.ajax({
            	type: 'post',
                url: 'http://localhost:8091/unlike',
                data:param,
                dataType: 'json',
                success:function(data){
                	console.log(data)
                }
              
            })
        })
    </script>
  <script>
  $(function () {
            'use strict'

            /*
            放第一張圖
            放全部的圖
            放分業
            第一章圖移動
            n張圖移動
            分業換色
            左右換頁
            */
            let index = 0
            let slideMove = 0
            let timer
            $('.pages li').eq(0).css('background', 'white')
            $('.pages li').click(function () {
                // $('.slide-img').css('left', '-800px')
                index = $(this).index()
                // console.log(index)
                slideMove = 0 - index * 300
                $('.slide-img').css('left', slideMove)
                $(this).css('background', 'white').siblings().css('background', 'transparent')
            })
            let pagesli = $('.pages li').length
            $('#slideNext').click(function () {
                index++
                if (index >= pagesli) {
                    index = 0
                }
                slideMove = 0 - index * 300
                $('.slide-img').css('left', slideMove)
                $('.pages li').eq(index).css('background', 'white').siblings().css('background', 'transparent')
            })
            $('#slidePrev').click(function () {
                index--
                if (index < 0) {
                    index = pagesli - 1
                }
                slideMove = 0 - index * 300
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
                slideMove = 0 - index * 300
                $('.slide-img').css('left', slideMove)
                $('.pages li').eq(index).css('background', 'white').siblings().css('background', 'transparent')
            }
            $('.slide-img').mouseover(function () {

                clearInterval(timer);
                console.log('mouseover')
            })
            $('.slide-img').mouseleave(function () {
                slideMove = 0 - index * 300;
                $('.side-img').css('left', slideMove);
                $('.pages li').eq(index).css('background', 'white').siblings().css('background', 'transparent');
                timer = setInterval(count, 3000);
            })
        })
        
    </script>
</body>
</html>