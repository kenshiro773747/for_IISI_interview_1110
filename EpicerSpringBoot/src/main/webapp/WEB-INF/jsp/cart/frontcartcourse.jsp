<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.cart.*"%>
<%@page import="java.math.BigDecimal"%>
<%@ page import="java.util.*,org.hibernate.Session, org.hibernate.SessionFactory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.epicer.model.*"%>
<%@page import="com.epicer.util.*"%>
<%@page import="java.util.*"%>
    
<!-- ////// 購物車畫面  /////// -->
    
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>

<style>


</style>
</head>

<body id="body">

<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>


<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="購物車" />
<jsp:param name="pagination" value="課程報名" />
</jsp:include>



<div class="page-wrapper">
  <div class="cart shopping">
    <div class="container">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="block">
            <div class="product-list">
              <form name="Form" action="queryById" method="get">
                <table class="table">
                <%
                	Tools tools = new Tools();
					List<CartOfCourse> listCart = (List<CartOfCourse>) request.getAttribute("courseQueryById");
					session.getAttribute("userId");
				%> 
                  <thead>
                    <tr>
                      <th class="">課程名稱</th>
                      <th class="">上課日期</th>
                      
                      <th class="">授課教師</th>
                      <th class="">費用</th>

                      <th class="">&nbsp;</th>
                    </tr>
                  </thead>
                  <tbody>
                  <%
					for (CartOfCourse c : listCart) {
				%>
                    <tr class="">
                      <td class="">
                        <div class="course-info">
                          <img width="80" src="<%=c.getCartCourse().getCourseImage()%>" alt="" />
                          <a href="#!"><%=c.getCartCourse().getCourseName()%></a>
                        </div>
                      </td>
                      <td class=""><%=tools.getStringDateTime(c.getCartCourse().getCourseDate()) %></td>
                      <td class=""><%=c.getCartCourse().getTeacher().getTeacherName()%></td>
                      <td class=""><%=c.getCartCourse().getCoursePrice()%></td>
                      <td class="">
						<ul>
						<li class="" onclick="deleteCartId('<%=c.getCartCourseId() %>');">
						<a href="#!" class="deleteItem  btn-icon btn btn-main btn-icon">
						<i class="tf-ion-ios-trash-outline"></i>刪除
						</a></li>
						</ul>
                      </td>
                      	<input type = "hidden" name="userEmail" value="<%=c.getQuantity()%>">
                      
                    <%
						}
						%>
                    </tr>
                  </tbody>
                </table>
                
                    <h4 style="text-align:center;font-weight:bold;">- 課程人數： ${tQuantity} ，總報名費： $  ${tPrice} -</h4>
                <a href="http://localhost:8091/queryallcoursemenu" class="pull-left" style="font-weight:bold;"><i class="fa-solid fa-angle-left"></i> &nbsp;返回課程頁</a>
                <a href="http://localhost:8091/ordercheck" class="btn btn-main pull-right">結帳</a>
              </form>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>




<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

	<script>
		//按鈕功能
		//刪除
		function deleteCartId(cartId){
// 			Swal.fire({
// 				  title: '確定要刪除嗎?( ´•̥̥̥ω•̥̥̥` )',
// 				  text: "還來得及反悔喔!",
// 				  icon: 'warning',
// 				  showCancelButton: true,
// 				  confirmButtonColor: '#3085d6',
// 				  cancelButtonColor: '#d33',
// 				  confirmButtonText: '刪除!'
// 				}).then((result) => {
// 				  if (result.isConfirmed) {
// 				    Swal.fire(
// 				      '刪除成功!',
// 				      '可以回商品頁重新加單喔!',
// 				      'success'
// 				    )
// 				    $(window.location.href = "deleteCartItem?cartId=" + cartId).submit();
// 				  }
// 				})
			window.location.href = "deleteCartItem?cartId=" + cartId;
		}
		</script>
</body>
</html>