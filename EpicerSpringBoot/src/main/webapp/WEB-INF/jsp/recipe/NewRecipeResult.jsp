<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer管理員系統</title>
    <link rel="stylesheet" href="../css/nicepageForRecipe2.css" media="screen">
    <script class="u-script" type="text/javascript" src="../js/jquery.js" "="" defer=""></script>
    <script class="u-script" type="text/javascript" src="../js/nicepageForRecipe.js" "="" defer=""></script>
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLindHead (結束) -->
 <style>
        .wrap {
            width: 900px;
            height: 200px;
            background-color: black;
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
            /* left: -1600px; */
            width: 4000px;
			
        }

        .slide-img li {
            width: 300px;
            height: 200px;

        }

        .slide-img li img {
            width: 100%;
            height: 100%;
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
            background-color: purple;
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
    </style>
</head>

<body class="g-sidenav-show   bg-gray-100">

	<!-- ////////////////// 介面最外層框架 //////////////////-->
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<!-- ////////////////// Side Navber (開始) //////////////////-->
	<%@include file="../includes/eSidenavAdmin.jsp"%>
	<!-- ////////////////// Side Navber (結束) //////////////////-->
	<!-- //////////////////主畫面框架(開始) ////////////////// -->
	<main class="main-content position-relative border-radius-lg ">
		<!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->
<!-- ////////////////// 個人主文開始 //////////////////-->
<fieldset style="width:1000px; background-color:white ;border-radius:15px; margin:20px auto;text-align:center">
 <section >
    
             
                    <div class="u-container-layout u-container-layout-2" >
                      <h3 class="u-text u-text-default u-text-1" >食譜名稱<br>${recipe.recipeName}</h3>
                    </div>
                 
                  <div class="u-container-style u-layout-cell u-size-30 u-layout-cell-3">
                    <div class="u-container-layout u-container-layout-3">
                      <p class="u-text u-text-default u-text-2">食譜描述<br>${recipe.recipeDescription}
                        <br>
                      </p>
                    </div>
                  </div>

        <img class="u-image u-image-default u-image-1" src="${pageContext.request.contextPath}/${recipe.imgPath}" alt="" width="300" height="300">

        <div class="u-clearfix u-layout-wrap u-layout-wrap-2">
          <div class="u-layout">
            <div class="u-layout-col">
              <div class="u-size-30">
                <div class="u-layout-col">
                  <div class="u-container-style u-layout-cell u-size-60 u-layout-cell-4">
                    <div class="u-container-layout u-valign-top u-container-layout-4">
                      <div class="u-clearfix u-custom-html u-custom-html-1">
                        <form accept-charset="UTF-8" id="global-search" action="recipelist" method="post">
                          <div class="to-search">
                            <div class="search-by-keyword">
                              <div class="focus-input search-container search-recipe select-input"> 搜尋：<input type="search" class="light-table-filter" data-table="order-table" placeholder="請輸入食譜名" name="searchByRecipe">
                                <input type="submit">
                              </div>
                            </div>
                            <h3>
                              <a class="header-action-link" href="http://localhost:8091/to/add" rel="nofollow"><i class="icon-plus-regular"></i>&nbsp;寫食譜 
                              </a>
                            </h3>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
        <div class="wrap">
            <a class="slide-arrow right" id="slideNext"> <i class="fa-solid fa-square-caret-right"></i></a>
            <a class="slide-arrow left" id="slidePrev"><i class="fa-solid fa-square-caret-left"></i></a>
            <ul class="slide-img" style="left: 0px;margin-top: 0px;">
                <li><img src="images/蒜香奶油烤鮭魚.webp" alt=""></li>
                <li><img src="images/塔香糖醋炒茄子.webp" alt=""></li>
                <li><img src="images/塔香雞胸肉餅.webp" alt=""></li>
                <li><img src="images/嫩雞胸佐芒果莎莎醬(電鍋版).webp" alt=""></li>
                <li><img src="images/蒜蓉豆腐蒸蝦.webp" alt=""></li>
                <li><img src="images/涼夏甜點.jpg" alt=""></li>
                <li><img src="images/西班牙蒜蝦佐法棍.webp" alt=""></li>
            </ul>
            <ul class="pages" style="margin-bottom:0px">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
            </div>
          </div>
        </div>
    </section>

</fieldset>



    <section class="u-align-center u-clearfix u-section-2" id="sec-d976">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-table u-table-responsive u-table-1">
         <table class="u-table-entity u-table-entity-1">
            <colgroup>
              <col width="49.9%">
              <col width="50.1%">
            </colgroup>
            <thead class="u-palette-1-base u-table-header u-table-header-1">
              <tr style="height: 41px;">
                <th class="u-border-1 u-border-palette-1-base u-table-cell">烹調時間</th>
                <th class="u-border-1 u-border-palette-1-base u-table-cell">幾人份</th>
              </tr>
            </thead>
            <tbody class="u-table-body">
              <tr style="height: 75px;">
                <td class="u-border-1 u-border-grey-30 u-table-cell">${recipe.cookTime}</td>
                <td class="u-border-1 u-border-grey-30 u-table-cell">${recipe.howManyPeople}</td>
              </tr>
    
            </tbody>
          </table>
          <table class="u-table-entity u-table-entity-1">
            <colgroup>
              <col width="49.9%">
              <col width="50.1%">
            </colgroup>
            <thead class="u-palette-1-base u-table-header u-table-header-1">
              <tr style="height: 41px;">
                <th class="u-border-1 u-border-palette-1-base u-table-cell">食材</th>
                <th class="u-border-1 u-border-palette-1-base u-table-cell">份量 </th>
              </tr>
            </thead>
            <tbody class="u-table-body">
 	<c:forEach items="${requestScope.ingredients}" var="item">
              <tr style="height: 75px;">
                <td class="u-border-1 u-border-grey-30 u-table-cell">${item.ingredient}</td>
                <td class="u-border-1 u-border-grey-30 u-table-cell">${item.amount}</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div class="u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <div class="u-clearfix u-custom-html u-expanded-width u-custom-html-1">
                  <a href="#推薦食譜">推薦食譜</a>
                </div>
              </div>
            </div>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-2">
                <div class="u-clearfix u-custom-html u-expanded-width u-custom-html-2">
                  <a href="#推薦食譜">推薦食譜</a>
                </div>
              </div>
            </div>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-3">
                <div class="u-clearfix u-custom-html u-expanded-width u-custom-html-3">
                  <a href="#推薦食譜">推薦食譜</a>
                </div>
              </div>
            </div>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-4">
                <div class="u-clearfix u-custom-html u-expanded-width u-custom-html-4">
                  <a href="#推薦食譜">推薦食譜</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-section-3" id="sec-e031">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-table u-table-responsive u-table-1">
          <table class="u-table-entity u-table-entity-1">
            <colgroup>
              <col width="100%">
            </colgroup>
            <thead class="u-palette-1-base u-table-header u-table-header-1">
              <tr style="height: 20px;">
                <th class="u-table-cell">步驟敘述</th>
              </tr>
            </thead>
            <tbody class="u-table-alt-palette-1-light-3 u-table-body">
          <c:forEach items="${requestScope.step}" var="item" varStatus="status" >
              <tr style="height: 76px;">
                <td class="u-table-cell"><h3><span>${status.index+1}.</span></h3>${item.step}</td>
              </tr>
                </c:forEach>
            </tbody>
          </table>


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
 <script src="/jquery-3.6.0.js"></script>

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
    <script src="https://kit.fontawesome.com/2cf249db39.js" crossorigin="anonymous"></script>
</body>

</html>