<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@page import="com.epicer.model.product.*" %>
    <%@page import="java.util.List" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="zh">

        <head>
          <meta charset="utf-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
          <title>Epicer管理員系統</title>

          <!-- eLindHead (開始) -->
          <%@include file="../includes/eLinkHead.jsp" %>
            <!-- eLindHead (結束) -->
            <style type="text/css">
              fieldset {
                width: 900px;
                border-radius: 15px;
                margin: 20px auto;
                background-color: white;
              }

              .col-lg-7 {
                flex: 0 0 auto;
                width: 50%;
              }


              .col-8 {
                flex: 0 0 auto;
                width: 66.666667%;
                height: 110px;
              }

              .py-4 {
                padding-top: 0rem !important;
                padding-bottom: 1.5rem !important;
              }
            </style>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        </head>

        <body class="g-sidenav-show   bg-gray-100">



          <!-- ////////////////// 介面最外層框架 //////////////////-->
          <div class="min-height-300 bg-dark position-absolute w-100"></div>
          <!-- ////////////////// Side Navber (開始) //////////////////-->
          <%@include file="../includes/eSidenavAdmin.jsp" %>
            <!-- ////////////////// Side Navber (結束) //////////////////-->
            <!-- //////////////////主畫面框架(開始) ////////////////// -->
            <main class="main-content position-relative border-radius-lg ">
              <!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
              <%@include file="../includes/eHead.jsp" %>
                <!-- ////////////////// End 上方 Navbar //////////////////-->
                <!-- ////////////////// 個人主文開始 //////////////////-->

                <% session.setAttribute("userId", 1003); %>


                  <fieldset>

                    <div class="card">
                      <br>
                      <h5 ALIGN=CENTER>課程分析</h5>
                      <br>








                      <!-- End Navbar -->
                      <div class="container-fluid py-4">
                        <div class="row">
                          <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                            <div class="card">
                              <div class="card-body p-3">
                                <div class="row">
                                  <div class="col-8">
                                    <div class="numbers">
                                      <p class="text-sm mb-0 text-uppercase font-weight-bold">課程總數</p>
                                      <h5 class="font-weight-bolder">
                                        ${q1 }
                                      </h5>
                                    </div>
                                  </div>
                                  <div class="col-4 text-end">
                                    <div
                                      class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
                                      <i class="ni ni-bag-17 text-lg opacity-10" aria-hidden="true"></i>
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
                                      <p class="text-sm mb-0 text-uppercase font-weight-bold">最高價商品</p>
                                      <h5 class="font-weight-bolder">
                                        ${q2.courseName }

                                      </h5>
                                      <p class="mb-0">
                                        <span class="text-success text-sm font-weight-bolder">價格$${q2.coursePrice
                                          }</span>

                                      </p>
                                    </div>
                                  </div>
                                  <div class="col-4 text-end">
                                    <div
                                      class="icon icon-shape bg-gradient-danger shadow-danger text-center rounded-circle">
                                      <i class="ni ni-zoom-split-in text-lg opacity-10" aria-hidden="true"></i>
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
                                      <p class="text-sm mb-0 text-uppercase font-weight-bold">最低價商品</p>
                                      <h5 class="font-weight-bolder">
                                        ${q3.courseName }

                                      </h5>
                                      <p class="mb-0">
                                        <span class="text-success text-sm font-weight-bolder">價格$${q3.coursePrice
                                          }</span>

                                      </p>
                                    </div>
                                  </div>
                                  <div class="col-4 text-end">
                                    <div
                                      class="icon icon-shape bg-gradient-success shadow-success text-center rounded-circle">
                                      <i class="ni ni-zoom-split-in text-lg opacity-10" aria-hidden="true"></i>
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
                                
                                  <div class="col-6">
                                    <a href="http://localhost:8091/666"><h4>管理課程</h4></a>
                                  </div>
                                  
                                   <div class="col-6">
                                    <a href="http://localhost:8091/777"><h4>管理老師</h4></a>
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
                                <h6 class="text-capitalize">類別顯示商品數量</h6>
                              </div>
                              <div class="card-body p-3">
                                <div class="chart">
                                  <!--               這是範本的套組 -->
                                  <canvas id="myChart" width="400" height="400"></canvas>
                                </div>
                              </div>
                            </div>
                          </div>

                          <script>
                            const ctx = document.getElementById('myChart');
                            const myChart = new Chart(ctx, {
                              type: 'bar',
                              data: {
                                labels: ['技術類', '甜點類', '主食類', '節慶套餐類'],
                                datasets: [{
                                  axis: 'y',
                                  label: '數量',
                                  data: [2, 3, 5, 3],
                                  backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(255, 159, 64, 0.2)',
                                    'rgba(255, 205, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)'
                                
                                  ],
                                  borderColor: [
                                    'rgb(255, 99, 132)',
                                    'rgb(255, 159, 64)',
                                    'rgb(255, 205, 86)',
                                    'rgb(75, 192, 192)'
                                    
                                  ],
                                  borderWidth: 1
                                }]
                              },
                              options: {
                                scales: {
                                  y: {
                                    beginAtZero: true
                                  }
                                }
                              }
                            });

                          </script>


                          <div class="col-lg-7 mb-lg-0 mb-4">
                            <div class="card z-index-2 h-100">
                              <div class="card-header pb-0 pt-3 bg-transparent">
                                <h6 class="text-capitalize">老師擁有的學生</h6>
                              </div>
                              <div class="card-body p-3">
                                <div class="chart">
                                  <canvas id="myChart1" width="1000" height="600"></canvas>
                                </div>
                              </div>
                            </div>
                          </div>



                        </div>



                        <!--   Core JS Files   -->
                        <script src="../assets/js/core/popper.min.js"></script>
                        <script src="../assets/js/core/bootstrap.min.js"></script>
                        <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
                        <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
                        <script src="../assets/js/plugins/chartjs.min.js"></script>
                        <script src="../../assets/js/plugins/chartjs.min.js"></script>
                        <script>
                          const data1 = {
                            '阿陳師': 2,
                            '阿羿師': 3,
                            '阿翔師': 7,
                            '阿行師': 4,
                            '詹姆師': 2,
                            '阿儂師':3
                          };

                          const ctx1 = document.getElementById('myChart1').getContext('2d');
                          const myChart1 = new Chart(ctx1, {
                            type: 'pie',
                            data: {
                              labels: Object.keys(data1),
                              
                              backgroundColor: [
        		 			      'rgb(255, 99, 132)',
        		 			      'rgb(75, 192, 192)',
        		 			      'rgb(255, 205, 86)',
        		 			      'rgb(201, 203, 207)',
        		 			      'rgb(54, 162, 235)'
        		 			    ],
                                
                                borderColor: [
                                  'rgb(255, 99, 132)',
                                  'rgb(255, 159, 64)',
                                  'rgb(222, 150, 60)',
                                  'rgb(277, 170, 60)',
                                  'rgb(255, 205, 86)',
                                  'rgb(75, 192, 192)'
                                  
                                ]
                              
                              ,datasets: [
                                {
                                  label: 'Number of GitHub Stars',
                                  data: Object.values(data1),
                                },
                              ],
                            },

                          });



                        </script>


                      </div>
                  </fieldset>



                  <!-- ////////////////// 個人主文結束 //////////////////-->
                  <!--////////////////// Footer(開始) //////////////////-->
                  <%@include file="../includes/eFooter.jsp" %>
                    <!-- ////////////////// Footer(結束) //////////////////-->

                    <!-- ////////////////// 中間主畫面(結束) ////////////////// -->
            </main>
            <!-- ////////////////// 主畫面框架(結束) //////////////////-->

            <!-- ////////////////// (右上設定鈕)Sidenav Type 調整樣式 ////////////////// -->
            <!-- ////////////////// Sidebar Backgrounds 開始 //////////////////-->
            <%@include file="../includes/eSidenavTypeSetting.jsp" %>
              <!-- ////////////////// Sidebar Backgrounds 結束 ////////////////// -->

              <!-- ////////////////// 框架Script url (開始)(不能少) ////////////////// -->
              <%@include file="../includes/eScriptForBody.jsp" %>
                <!-- ////////////////// 框架Script (結束) //////////////////-->


        </body>

        </html>