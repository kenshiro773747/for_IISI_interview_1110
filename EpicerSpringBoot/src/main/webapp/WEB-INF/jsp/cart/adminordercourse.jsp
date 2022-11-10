<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.cart.*"%>
<%@page import="com.epicer.util.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ---------------- 課程訂單 ------------------- -->
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
<title>Epicer管理員系統-訂單管理</title>
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
<div>
	<div class="col-md-5">
     <div class="form-group">
					<div class="input-group mb-2">
						<span class="input-group-text"><i
							class="ni ni-zoom-split-in"></i></span> <input type="search"
							class="light-table-filter form-control" data-table="order-table"
							placeholder="查詢課程報名">
					</div>
				</div>
    </div>


<div class="card">
  <div class="table-responsive">
    <table class="table align-items-center mb-0  order-table" >
      <thead>
  
        <tr>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;訂單編號</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">會員編號</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">課程編號</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">報名人數</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">課程費用</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">&nbsp;&nbsp;付款狀態</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;訂購日期</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;報名資訊</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">&nbsp;</th>
          <th></th>
        </tr>
      </thead>
      <%
      request.setAttribute("userId", 1002);
      		List<OrderCoursecart> courseList = (List<OrderCoursecart>) request.getAttribute("allcourselist");
      // 		List<OrderProductDetails> orderDetails = (List<OrderProductDetails>) request.getAttribute("allorderdetails");
      		for (OrderCoursecart oc : courseList) {
      %>
      <tbody>
      <!-- ////////////////// 外框上部 //////////////////-->
        <tr>
<!--         <form action="allorderlist" method="get"> -->
<%-- 		<input type = "hidden" name="orderProductId" value="<%=op.getOrderProductId()%>"> --%>
		<input type="hidden" name="id" value=<%=request.getParameter("id")%>>
          
          <td>
            <div class="d-flex px-2">
              <div>
                <img src="https://cdn-icons-png.flaticon.com/512/1261/1261052.png" class="avatar avatar-sm rounded-circle me-2">
              </div>
              <div class="my-auto">
                <h6 class="mb-0 text-xs">EpicerCourse<%=oc.getOrderCourseId()%></h6>
              </div>
            </div>
          </td>
          
          <td><p class="text-xs font-weight-bold mb-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=oc.getOrderUser()%></p></td>
     	  <td><p class="text-xs font-weight-bold mb-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=oc.getCourseid()%></p></td>
          <td><p class="text-xs font-weight-bold mb-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=oc.getTotalquantity()%></p></td>
          <td><p class="text-xs font-weight-bold mb-0">&nbsp;&nbsp;&nbsp;$ <%=oc.getTotalprice()%></p></td>
          <td>
          		<!-- ----付款狀態---- -->
				<% if(oc.getPaystatus().equals("未付款")){%>
				<span class="badge bg-gradient-dark"><%out.println("未付款");%></span>
				<%}else if(oc.getPaystatus().equals("已付款")){%>
				<span class="badge bg-gradient-primary"><%out.println("已付款");%></span>
				<%}else if(oc.getPaystatus().equals("取消報名")){%>
				<span class="badge bg-gradient-danger"><%out.println("已取消");%></span>
				<%}else{ %>
				<span class="badge bg-gradient-light"><%out.println("無法辨識");%></span>
				<%} %>

          </td>
          
          <td><p class="text-xs font-weight-bold mb-0"><%= oc.getMerchantTradeDate()%></p></td>
<%--           <td><p class="text-xs font-weight-bold mb-0"><%=op.getCouponId()%></p></td> --%>
<%--           <td><p class="text-xs font-weight-bold mb-0"><%=op.getOrderName()%></p></td> --%>
<%--           <td><p class="text-xs font-weight-bold mb-0"><%=op.getOrderPhone()%></p></td> --%>
<%--           <td><p class="text-xs font-weight-bold mb-0"><%=op.getOrderAddress()%></p></td> --%>
<%--           <td><p class="text-xs font-weight-bold mb-0"><%=op.getOrderEmail()%></p></td> --%>
			<!-- ------  查詢明細 ----- -->
          <td>
          	<button type="button" class="btn btn-primary btn-sm"  data-bs-toggle="modal" data-bs-target="#exampleModal<%=oc.getOrderCourseId()%>" data-bs-whatever="#"><i class="ni ni-bullet-list-67" ></i> &nbsp;明細</button>
			<div class="modal fade" id="exampleModal<%=oc.getOrderCourseId()%>" tabindex="-1" aria-labelledby="orderDetails" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    
			      <div class="modal-header">
			        <h5 class="modal-title" id="orderDetails" style="margin: 0 center">訂單明細</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			          <div class="mb-3">
			          	<label for="recipient-name" class="col-form-label">訂單編號：</label>EpicerCourse<%=oc.getOrderCourseId()%> <br>
			            <label for="recipient-name" class="col-form-label">學員姓名：</label><%=oc.getOrdername()%> <br>
			            <label for="recipient-name" class="col-form-label">學員電話：</label><%=oc.getOrderphone()%><br>
			            <label for="recipient-name" class="col-form-label">學員地址：</label><%=oc.getOrderaddress()%><br>
			            <label for="recipient-name" class="col-form-label">電子信箱：</label><%=oc.getOrderemail()%><br>
<%-- 			            <label for="recipient-name" class="col-form-label">使用優惠碼：</label><%=op.getCouponId()%><br> --%>
<%-- 			            <label for="recipient-name" class="col-form-label">運費金額：</label> $ <%=op.getShipbill()%><br> --%>
			            <label for="recipient-name" class="col-form-label">報名課程：</label><%=oc.getCourseName()%><br>
						<% if(oc.getPaystatus().equals("取消報名")){%>
						<hr>
						<label for="recipient-name" class="col-form-label" style="color: red;">報名已取消 (╥﹏╥) 原因：<%=oc.getCancelNote()%></label><br>
						<%}else{%>
						<%}%>
			      </div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
<!-- 			        <button type="button" class="btn btn-primary">Send message</button> -->
			      </div>
			      
			    </div>
			  </div>
			</div>

			</td>
			
			<!-- ------  狀態修改 - 改物流就好(變成已出貨)--課程沒有 ----- -->
          
          <td>


			</div>
          
          </td>
          <td>
          		<input type = "hidden" name="OrderCourseId" value="<%=oc.getOrderCourseId()%>">
          
          
          
<!--            <form action="adminorderdetail" method="post"> -->
<%--       		 <input type = "hidden" name="orderProductId" value="<%=op.getOrderProductId()%>"> --%>
<%--       		 <button type="submit"><%=op.getOrderProductId()%></button> --%>
<!--           </form>	 -->
          
		</td>

         	<!-- ///////// 功能按鈕(備用) ///////// -->
<!--           <td class="align-middle"> -->
<!--             <button class="btn btn-link text-secondary mb-0"> -->
<!--               <i class="fa fa-ellipsis-v text-xs" aria-hidden="true"></i> -->
<!--             </button> -->
<!--           </td> -->
<!--           </form> -->
        </tr>
			<!-- ////////////////// 外框底部 //////////////////-->
      </tbody>
      <%
		}
		%>
    </table>
  	</div>
  </div>
</fieldset>
  <!-- ----- 換頁----- -->
<!--   <nav aria-label="Page navigation example"> -->
<!--   <ul class="pagination justify-content-center"> -->
<!--     <li class="page-item disabled"> -->
<!--       <a class="page-link" href="javascript:;" tabindex="-1"> -->
<!--         <i class="fa fa-angle-left"></i> -->
<!--         <span class="sr-only">Previous</span> -->
<!--       </a> -->
<!--     </li> -->
<!--     <li class="page-item"><a class="page-link" href="javascript:;">1</a></li> -->
<!--     <li class="page-item active"><a class="page-link" href="javascript:;">2</a></li> -->
<!--     <li class="page-item"><a class="page-link" href="javascript:;">3</a></li> -->
<!--     <li class="page-item"> -->
<!--       <a class="page-link" href="javascript:;"> -->
<!--         <i class="fa fa-angle-right"></i> -->
<!--         <span class="sr-only">Next</span> -->
<!--       </a> -->
<!--     </li> -->
<!--   </ul> -->
<!--   </nav> -->
  
	

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
				(function(document) {
					'use strict';

					// 建立 LightTableFilter
					var LightTableFilter = (function(Arr) {

						var _input;

						// 資料輸入事件處理函數
						function _onInputEvent(e) {
							_input = e.target;
							var tables = document.getElementsByClassName(_input
									.getAttribute('data-table'));
							Arr.forEach.call(tables, function(table) {
								Arr.forEach.call(table.tBodies,
										function(tbody) {
											Arr.forEach.call(tbody.rows,
													_filter);
										});
							});
						}

						// 資料篩選函數，顯示包含關鍵字的列，其餘隱藏
						function _filter(row) {
							var text = row.textContent.toLowerCase(), val = _input.value
									.toLowerCase();
							row.style.display = text.indexOf(val) === -1 ? 'none'
									: 'table-row';
						}

						return {
							// 初始化函數
							init : function() {
								var inputs = document
										.getElementsByClassName('light-table-filter');
								Arr.forEach.call(inputs, function(input) {
									input.oninput = _onInputEvent;
								});
							}
						};
					})(Array.prototype);

					// 網頁載入完成後，啟動 LightTableFilter
					document.addEventListener('readystatechange', function() {
						if (document.readyState === 'complete') {
							LightTableFilter.init();
						}
					});

				})(document);
			</script>


</body>

</html>