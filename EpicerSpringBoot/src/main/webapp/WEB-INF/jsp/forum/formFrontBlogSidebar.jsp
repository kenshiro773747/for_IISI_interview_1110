<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <style>
 .wrap {	
            width: 250px;
            height: 180px;
            margin: 0 auto;
            background-color:#F5F5DC;
            position: relative;
            overflow: hidden;
        }

        .slide-img {
            position: absolute;
            left: 0;
            margin: 0;
            padding: 0;
            list-style-type: none;
            display: flex;
            /*left: -400px;*/
            width: 4000px;
        }

        .slide-img li {
            width: 250px;
            height: 180px;
        }

        .slide-img li img {
            width: 100%;
            height: 100%;

            /*依據元素內容調整比例*/
            object-fit: cover;
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
/***白色點點隱藏
       .pages li { 
          width: 30px; 
          height: 30px; 
          border-radius: 50%; 
          margin: 0 5px;
       } 
*/
        .slide-arrow {
            position: absolute;
            z-index: 1;
            font-size: 36px;
            width: 30px;
            height: 100%;
            display: flex;


            /*交錯軸置中*/
            align-items: center;
            /* 主軸置中*/
            justify-content: center;
            color: white;
            /*透明度*/
            opacity: .6;
            /*滑鼠型態*/
            cursor: pointer;
        }

        .right {
            right: 0;
        }

        .slide-arrow:hover {
            opacity: 1;
        }


/* 以上是jquery 輪播 */
 

 .sidebarFixed{
  z-index: 10;     
  position: fixed;      
  top:30%;
  left: 70%;
  opacity: 0.94;
  transition: opacity .5s ease-out;  

}

#side{
white-space:pre-wrap;
height:200px;
}
 
 </style>
 <script>
$(function () {

    /*
    1.放第一張圖
    2.放n張圖
    3.放分頁
    4.第一張圖移動
    5.n張圖移動
    6.分頁的換色
    7.左右的換頁
    */
    let index = 0
    let slideMove = 0
    $('.pages').on('mouseenter','li',  function () {
//     $('.pages li').on('mouseenter',  function () {
//         $('.slide-img').css('left', '-800px')
        index = $(this).index()
        console.log(index)
        slideMove = 0 - index * 250
        $('.slide-img').css('left', slideMove)
        $(this).css('background', 'white').siblings().css('background', 'transparent')
    })

    $('#slideNext').on('click', function () {
    let pagesli = $('.pages li').length
        index++;
        if (index >= pagesli) {
            index = 0
        }
        slideMove = 0 - index * 250
        $('.slide-img').css('left', slideMove)
        $('.pages li').eq(index).css('background', 'white').siblings().css('background', 'transparent')
    })

    $('#slidePrev').on('click', function () {
        index--;
        if (index < 0) {
            index = 4
        }
        slideMove = 0 - index * 250
        $('.slide-img').css('left', slideMove)
        $('.pages li').eq(index).css('background', 'white').siblings().css('background', 'transparent')
    })

    function moveImg() {
        slideMove = 0 - index * 250
        $('.slide-img').css('left', slideMove)
        $('.pages li').eq(index).css('background', 'white').siblings.css('background', 'transparent')
    }


})




</script>
    
 <!-- ///////////  文章頁的側邊 ///////////// -->
 <!-- ///////////  推播專區 ///////////// -->
 
 <!-- /////////// 申請寄發新文章通知信(輸入頁面) ///////////// -->
<aside class=" sidebar sidebarFixed">
	<div class="container" style="margin-top:2em">

			        <div class="wrap"  style="margin-right:230%">
			            <a class="slide-arrow right" id="slideNext">
			                <i class="fa-solid fa-circle-arrow-right"></i>
			            </a>
			            <a class="slide-arrow left" id="slidePrev">
			                <i class="fa-solid fa-circle-arrow-left"></i>
			            </a>
			            <ul class="slide-img" id="photo">
			            </ul>
			            <ul class="pages" id = list>
			            </ul>
			        </div>
	</div>
	
 <!-- /////////// 文章分類-風格2 (關鍵字方式/可用於食譜) ///////////// -->
	<!-- Widget tag -->
	<div class="widget widget-tag" style="margin-top:2em;">
		<h4 class="widget-title">Tag Cloud</h4>
		<ul class="widget-tag-list">
	         <li>
	        <a href="javascript: void(0)" onclick="queryAll()" >全部</a>
	        </li>
	        <li>
	        <a href="javascript: void(0)" name="1" onclick="category(this)">全榖雜糧</a>
	        </li>
	        <li>
	        <a href="javascript: void(0)" name="2" onclick="category(this)">豆魚蛋肉</a>
	        </li>
	        <li>
	        <a href="javascript: void(0)" name="3" onclick="category(this)">蔬菜</a>
	        </li>
	        </br>
	        <li>
	        <a href="javascript: void(0)" name="4" onclick="category(this)">水果</a>
	        </li>
	        <li>
	        <a href="javascript: void(0)" name="5" onclick="category(this)">乳品</a>
	        </li>
	        <li>
	        <a href="javascript: void(0)" name="6" onclick="category(this)">油脂與堅果種子</a>
	        </li>
	    </ul>
	</div> <!-- End tag  -->

</aside>

