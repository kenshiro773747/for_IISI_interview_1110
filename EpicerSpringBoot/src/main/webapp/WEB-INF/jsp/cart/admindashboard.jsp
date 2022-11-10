<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.cart.*"%>
<%@page import="com.epicer.util.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ---------------- 訂單統計 ------------------- -->
<!DOCTYPE html>
<%
Tools tools = new Tools();
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer管理員系統</title>
<script  src='js/sweetalert2.min.js'></script>
<script  src='js/jquery-3.6.0.js'></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">

<!-- eLinkHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLinkHead (結束) -->

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
	<%@include file="../includes/eSidenavAdmin.jsp" %>
<%-- 	<%@include file="../course/eSidenavTeacher.jsp" %> --%>
	<!-- ////////////////// Side Navber (結束) //////////////////-->
	<!-- //////////////////主畫面框架(開始) ////////////////// -->
	<main class="main-content position-relative border-radius-lg ">
		<!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->
<!-- ////////////////// 個人主文開始 //////////////////-->

<!-- ////////////////// 套版 //////////////////-->
<fieldset>
<div class="container-fluid py-4">
      <div class="row">
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                  
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">商品銷售額</p>
                    <h5 class="font-weight-bolder">
                    ${totalSale}
                    </h5>
                    <p class="mb-0">
                      <span class="text-success text-sm font-weight-bolder">+21%</span>
                      相較昨日
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
                    <i class="ni ni-money-coins text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">總訂單數</p>
                    <h5 class="font-weight-bolder">
                      ${totalOrders}
                    </h5>
                    <p class="mb-0">
                      <span class="text-success text-sm font-weight-bolder">+3%</span>
                       相較上周
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-danger shadow-danger text-center rounded-circle">
                    <i class="ni ni-world text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">課程營業額</p>
                    <h5 class="font-weight-bolder">
                    ${totalCourseIncome}
                    </h5>
                    <p class="mb-0">
                      <span class="text-danger text-sm font-weight-bolder">-2%</span>
                       相較昨日
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-success shadow-success text-center rounded-circle">
                    <i class="ni ni-paper-diploma text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">總報名人數</p>
                    <h5 class="font-weight-bolder">
                    ${totalStudent}
                    </h5>
                    <p class="mb-0">
                      <span class="text-success text-sm font-weight-bolder">+5%</span> 相較上周
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-warning shadow-warning text-center rounded-circle">
                    <i class="ni ni-cart text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row mt-4">
        <div class="col-lg-7 mb-lg-0 mb-4">
          <div class="card z-index-2 h-100">
            <div class="card-header pb-0 pt-3 bg-transparent">
              <h6 class="text-capitalize">商品銷售分布</h6>
              <p class="text-sm mb-0">
                <i class="fa fa-arrow-up text-success"></i>
                相較於8月<span class="font-weight-bold">上升 4% </span>
              </p>
            </div>
            <div class="card-body p-3">
              <div class="chart">
<%--                 <canvas id="chart-line" class="chart-canvas" height="300"></canvas> --%>
<%--                 <canvas id="pie-chart" class="chart-canvas" height="300"></canvas> --%>
                <canvas id="myChart" width="400" height="400"></canvas>
              </div>
            </div>
          </div>
        </div>
        
         
        <div class="col-lg-5">
          <div class="card card-carousel overflow-hidden h-100 p-0">
            <div id="carouselExampleCaptions" class="carousel slide h-100" data-bs-ride="carousel">
              <div class="carousel-inner border-radius-lg h-100">
                <div class="carousel-item h-100 active" style="background-image: url('../source/images/index/indexforum4.jpg');
      background-size: cover;">
                  <div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
                    <div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
                      <i class="ni ni-camera-compact text-dark opacity-10"></i>
                    </div>
                    <h5 class="text-white mb-1">為生活而創意,擋不住美食的誘惑</h5>
                    <p>try it！The taste is great！try it！</p>
                  </div>
                </div>
                <div class="carousel-item h-100" style="background-image: url('../source/images/index/indexgrocery1.jpg');
      background-size: cover;">
                  <div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
                    <div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
                      <i class="ni ni-bulb-61 text-dark opacity-10"></i>
                    </div>
                    <h5 class="text-white mb-1">美好的一天使於美味的食物</h5>
                    <p>Every day food, gourmet beauty carved.</p>
                  </div>
                </div>
                <div class="carousel-item h-100" style="background-image: url('../source/images/index/indexrecipe3.jpg');
      background-size: cover;">
                  <div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
                    <div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
                      <i class="ni ni-trophy text-dark opacity-10"></i>
                    </div>
                    <h5 class="text-white mb-1">你們的支持是我們的行動力!</h5>
                    <p>Spend the same money, eat a better meal.</p>
                  </div>
                </div>
              </div>
              <button class="carousel-control-prev w-5 me-3" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next w-5 me-3" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          </div>
        </div>
      </div>
<!--       <div class="row mt-4"> -->
<!--         <div class="col-lg-7 mb-lg-0 mb-4"> -->
<!--           <div class="card "> -->
<!--             <div class="card-header pb-0 p-3"> -->
<!--               <div class="d-flex justify-content-between"> -->
<!--                 <h6 class="mb-2">Sales by Country</h6> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="table-responsive"> -->
<!--               <table class="table align-items-center "> -->
<!--                 <tbody> -->
<!--                   <tr> -->
<!--                     <td class="w-30"> -->
<!--                       <div class="d-flex px-2 py-1 align-items-center"> -->
<!--                         <div> -->
<!--                           <img src="../assets/img/icons/flags/US.png" alt="Country flag"> -->
<!--                         </div> -->
<!--                         <div class="ms-4"> -->
<!--                           <p class="text-xs font-weight-bold mb-0">Country:</p> -->
<!--                           <h6 class="text-sm mb-0">United States</h6> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                     <td> -->
<!--                       <div class="text-center"> -->
<!--                         <p class="text-xs font-weight-bold mb-0">Sales:</p> -->
<!--                         <h6 class="text-sm mb-0">2500</h6> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                     <td> -->
<!--                       <div class="text-center"> -->
<!--                         <p class="text-xs font-weight-bold mb-0">Value:</p> -->
<!--                         <h6 class="text-sm mb-0">$230,900</h6> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                     <td class="align-middle text-sm"> -->
<!--                       <div class="col text-center"> -->
<!--                         <p class="text-xs font-weight-bold mb-0">Bounce:</p> -->
<!--                         <h6 class="text-sm mb-0">29.9%</h6> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <td class="w-30"> -->
<!--                       <div class="d-flex px-2 py-1 align-items-center"> -->
<!--                         <div> -->
<!--                           <img src="../assets/img/icons/flags/DE.png" alt="Country flag"> -->
<!--                         </div> -->
<!--                         <div class="ms-4"> -->
<!--                           <p class="text-xs font-weight-bold mb-0">Country:</p> -->
<!--                           <h6 class="text-sm mb-0">Germany</h6> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                     <td> -->
<!--                       <div class="text-center"> -->
<!--                         <p class="text-xs font-weight-bold mb-0">Sales:</p> -->
<!--                         <h6 class="text-sm mb-0">3.900</h6> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                     <td> -->
<!--                       <div class="text-center"> -->
<!--                         <p class="text-xs font-weight-bold mb-0">Value:</p> -->
<!--                         <h6 class="text-sm mb-0">$440,000</h6> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                     <td class="align-middle text-sm"> -->
<!--                       <div class="col text-center"> -->
<!--                         <p class="text-xs font-weight-bold mb-0">Bounce:</p> -->
<!--                         <h6 class="text-sm mb-0">40.22%</h6> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <td class="w-30"> -->
<!--                       <div class="d-flex px-2 py-1 align-items-center"> -->
<!--                         <div> -->
<!--                           <img src="../assets/img/icons/flags/GB.png" alt="Country flag"> -->
<!--                         </div> -->
<!--                         <div class="ms-4"> -->
<!--                           <p class="text-xs font-weight-bold mb-0">Country:</p> -->
<!--                           <h6 class="text-sm mb-0">Great Britain</h6> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                     <td> -->
<!--                       <div class="text-center"> -->
<!--                         <p class="text-xs font-weight-bold mb-0">Sales:</p> -->
<!--                         <h6 class="text-sm mb-0">1.400</h6> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                     <td> -->
<!--                       <div class="text-center"> -->
<!--                         <p class="text-xs font-weight-bold mb-0">Value:</p> -->
<!--                         <h6 class="text-sm mb-0">$190,700</h6> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                     <td class="align-middle text-sm"> -->
<!--                       <div class="col text-center"> -->
<!--                         <p class="text-xs font-weight-bold mb-0">Bounce:</p> -->
<!--                         <h6 class="text-sm mb-0">23.44%</h6> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <td class="w-30"> -->
<!--                       <div class="d-flex px-2 py-1 align-items-center"> -->
<!--                         <div> -->
<!--                           <img src="../assets/img/icons/flags/BR.png" alt="Country flag"> -->
<!--                         </div> -->
<!--                         <div class="ms-4"> -->
<!--                           <p class="text-xs font-weight-bold mb-0">Country:</p> -->
<!--                           <h6 class="text-sm mb-0">Brasil</h6> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                     <td> -->
<!--                       <div class="text-center"> -->
<!--                         <p class="text-xs font-weight-bold mb-0">Sales:</p> -->
<!--                         <h6 class="text-sm mb-0">562</h6> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                     <td> -->
<!--                       <div class="text-center"> -->
<!--                         <p class="text-xs font-weight-bold mb-0">Value:</p> -->
<!--                         <h6 class="text-sm mb-0">$143,960</h6> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                     <td class="align-middle text-sm"> -->
<!--                       <div class="col text-center"> -->
<!--                         <p class="text-xs font-weight-bold mb-0">Bounce:</p> -->
<!--                         <h6 class="text-sm mb-0">32.14%</h6> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                 </tbody> -->
<!--               </table> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--         <div class="col-lg-5"> -->
<!--           <div class="card"> -->
<!--             <div class="card-header pb-0 p-3"> -->
<!--               <h6 class="mb-0">Categories</h6> -->
<!--             </div> -->
<!--             <div class="card-body p-3"> -->
<!--               <ul class="list-group"> -->
<!--                 <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg"> -->
<!--                   <div class="d-flex align-items-center"> -->
<!--                     <div class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center"> -->
<!--                       <i class="ni ni-mobile-button text-white opacity-10"></i> -->
<!--                     </div> -->
<!--                     <div class="d-flex flex-column"> -->
<!--                       <h6 class="mb-1 text-dark text-sm">Devices</h6> -->
<!--                       <span class="text-xs">250 in stock, <span class="font-weight-bold">346+ sold</span></span> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="d-flex"> -->
<!--                     <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i class="ni ni-bold-right" aria-hidden="true"></i></button> -->
<!--                   </div> -->
<!--                 </li> -->
<!--                 <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg"> -->
<!--                   <div class="d-flex align-items-center"> -->
<!--                     <div class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center"> -->
<!--                       <i class="ni ni-tag text-white opacity-10"></i> -->
<!--                     </div> -->
<!--                     <div class="d-flex flex-column"> -->
<!--                       <h6 class="mb-1 text-dark text-sm">Tickets</h6> -->
<!--                       <span class="text-xs">123 closed, <span class="font-weight-bold">15 open</span></span> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="d-flex"> -->
<!--                     <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i class="ni ni-bold-right" aria-hidden="true"></i></button> -->
<!--                   </div> -->
<!--                 </li> -->
<!--                 <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg"> -->
<!--                   <div class="d-flex align-items-center"> -->
<!--                     <div class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center"> -->
<!--                       <i class="ni ni-box-2 text-white opacity-10"></i> -->
<!--                     </div> -->
<!--                     <div class="d-flex flex-column"> -->
<!--                       <h6 class="mb-1 text-dark text-sm">Error logs</h6> -->
<!--                       <span class="text-xs">1 is active, <span class="font-weight-bold">40 closed</span></span> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="d-flex"> -->
<!--                     <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i class="ni ni-bold-right" aria-hidden="true"></i></button> -->
<!--                   </div> -->
<!--                 </li> -->
<!--                 <li class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg"> -->
<!--                   <div class="d-flex align-items-center"> -->
<!--                     <div class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center"> -->
<!--                       <i class="ni ni-satisfied text-white opacity-10"></i> -->
<!--                     </div> -->
<!--                     <div class="d-flex flex-column"> -->
<!--                       <h6 class="mb-1 text-dark text-sm">Happy users</h6> -->
<!--                       <span class="text-xs font-weight-bold">+ 430</span> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="d-flex"> -->
<!--                     <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i class="ni ni-bold-right" aria-hidden="true"></i></button> -->
<!--                   </div> -->
<!--                 </li> -->
<!--               </ul> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->


</fieldset>



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
	
	
	<script>
  const data = {
		  labels: [
		    '玉米粒',
		    '馬鈴薯',
		    '栗南瓜',
		    '鮮乳',
		    '保久乳',
		    '起司絲',
		    '燕麥奶',
		    '溫體土雞腿肉',
		    '松阪豬',
		    '牛肉',
		    '鮭魚',
		    '高山高麗菜',
		    '蒜頭',
		    '洋蔥',
		    '檸檬',
		    '芝麻',
		    '奶油',
		    '橄欖油',
		    '義大利麵醬',
		    '原味高湯',
		    '玫瑰鹽粗粒',
		    '超級大干貝'
		    
		  ],
		  datasets: [{
		    label: 'My First Dataset',
		    data: [7,11,10,3,3,0,3,0,7,5,0,2,1,4,0,6,7,3,9,1,1,0],
		    backgroundColor: [
		      'rgb(255, 99, 132)',
		      'rgb(54, 162, 235)',
		      'rgb(255, 205, 86)',
		      'rgb(220, 220, 220)',
		      'rgb(255, 250, 240)',
		      'rgb(250, 240, 230)',
		      'rgb(255, 222, 173)',
		      'rgb(240, 255, 255)',
		      'rgb(230, 230, 250)',
		      'rgb(255, 228, 225)',
		      'rgb(190, 190, 190)',
		      'rgb(123, 104, 238)',
		      'rgb(135, 206, 250)',
		      'rgb(127, 255, 212)',
		      'rgb(238, 232, 170)',
		      'rgb(255, 215, 0)',
		      'rgb(205, 133, 63)',
		      'rgb(255, 160, 122)',
		      'rgb(141, 238, 238)',
		      'rgb(84, 255, 159)',
		      'rgb(102, 205, 0)',
		      'rgb(102, 210, 100)'
		    ],
		    hoverOffset: 4
		  }]
		};
  const config = {
		  type: 'doughnut',
		  data: data,
		};
</script>
<script>
  const myChart = new Chart(
    document.getElementById('myChart'),
    config
  );
</script>

</body>

</html>