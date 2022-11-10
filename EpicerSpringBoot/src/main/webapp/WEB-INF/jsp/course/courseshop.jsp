<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.epicer.model.course.*,com.epicer.controller.*,com.epicer.util.*"%>
<!-- //////  商品網 (無推播)  //////// -->

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<!-- owl.carousel開始 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
</link>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
</link>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>



<style>

.col-md-4 .5555 {
    width: 33.33333333%;
    height: 300px;
}

/* 黑黑框框 */
.product-item .product-thumb {
    height: 200px;
}

/* 課程圖片 */
.product-item .product-thumb img {
    width: 100%;
    height: 200px;
}

.owl-theme .item {
	height: 25rem;
	background:;
	padding: 1rem;
}

.owl-carousel .item h4 {
	color: #fff;
	font-weight: 400;
	font-size: 1.4375rem;
	margin-top: 0rem;
}

.465 {
	position: relative;
}

h3 {
	font-size: 25px;
	color: lightyellow;
	position: absolute;
}

.owl-theme .teacher {
	height: 20rem;
	padding: 1rem;
}

.section {
     padding: 0px;
}


</style>
<!-- owl.carousel結束 -->


<script type="text/javascript">

$(function(){
	
	$('#sendstyle').on('change',function(){
		console.log('123');
		$(this).parent().submit();		
		
	})
})

</script>


</head>
<body id="body">


	<!-- 主文內容 開始 -->
	<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，
大家串聯在這，最最後要討論串連的地方///// -->
	<%@include file="../frontpartials/frontheadernavigation.jsp"%>
	<%@include file="../frontpartials/frontheadernavigationtwo.jsp"%>

	<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
	<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
		<jsp:param name="title" value="課程" />
		<jsp:param name="pagination" value="課程" />
	</jsp:include>




	<section class="products section">
		<div class="container">
			<div class="row">
			
				


				<h2 align='center'>熱門課程</h2>
				<div class="owl-carousel owl-theme widget-title">
					<!-- 文字置中 : 熱門課程 -->
					<%
List<Course> list2 = (List<Course>) request.getAttribute("listAll");
for (Course cd : list2) {
%>
					<div class="item 456">
						<form action="/999" method="post">
							<div onclick='this.parentNode.submit()'>
								<h3 align='center'>
									<b><%=cd.getCourseName()%></b>
								</h3>
								<p>
									<img src="images/<%=cd.getCourseImage()%>" width=200 height=200 />
								</p>
								<input type=hidden value="<%=cd.getCourseId()%>" name="courseid">
							</div>
						</form>
					</div>

					<%} %>
				</div>


				<script type="text/javascript">
var owl = $('.owl-carousel');
owl.owlCarousel({
    items:4,
    loop:true,
    margin:10,
    autoplay:true,
    autoplayTimeout:3000,
    autoplayHoverPause:true
});
$('.play').on('click',function(){
    owl.trigger('play.owl.autoplay',[1000])
})
$('.stop').on('click',function(){
    owl.trigger('stop.owl.autoplay')
})

</script>


				<!--  <script>
	$(".owl-carousel").owlCarousel({
		  loop: true, // 循環播放
		  margin: 10, // 外距 10px
		  nav: true, // 顯示點點
		  responsive: {
		    0: {
		      items: 1 // 螢幕大小為 0~600 顯示 1 個項目
		    },
		    600: {
		      items: 3 // 螢幕大小為 600~1000 顯示 3 個項目
		    },
		    1000: {
		      items: 5 // 螢幕大小為 1000 以上 顯示 5 個項目
		    }
		  }
		});
	</script>-->

<!-- ////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- ////教師輪播開始//// -->
<div class="col-md-3">


   <!-- sidebar開始 -->

    <div class="widget">
        <h4 class="widget-title">Sort By</h4>
        <form method="post" action="queryshopbystyle">
            <select id="sendstyle" name="style" class="form-control">
                <option disabled selected style="display: none">請選擇</option>
                <option>技術類</option>
                <option>甜點類</option>
                <option>主食類</option>
                <option>節慶套餐類</option>
            </select>
        </form>
    </div>
<!-- sidebar結束 -->

<br>
<br>
<br>

    <div class="widget">

        <h4 align='center'><b >專業教師群</b></h4>
        <div class="owl-carousel owl-theme">
            <% List<Teacher> tlist = (List<Teacher>)request.getAttribute("tlist");
                    for(Teacher t : tlist){
                    %>
                    <div class="teacher">
                        <img src="images/<%=t.getTeacherImage()%>" height=150 width=100 />
                        <b><%=t.getTeacherName()%></b><br>
                        <p><%=t.getTeacherDescription() %></p>
                    </div>
                    <% } %>


        </div>
    </div>




    <script type="text/javascript">
        var owl = $('.owl-carousel');
        owl.owlCarousel({
            items: 1,
            loop: true,
            margin: 10,
            autoHeight: true,
            autoWidth: false,
            autoplay: true,
            autoplayTimeout: 3000,
            autoplayHoverPause: true,

        });
    </script>





    <!-- ////教師輪播結束//// -->


</div>
				<!-- ////////////////////////////////////////////////////////////////////////////////////////// -->



				<!-- ///////////////   商品顯示頁面 (多頁) --可用在首頁(第三段) & 商品頁 ///////////// -->

				<!-- test begin -->
<div class="col-md-9">
				<div class="row">
				<%
				TimeTest timeTest = new TimeTest();
				//
				Long currenttime = timeTest.getTime();
				String stime = timeTest.TransLongToString(currenttime);
				Long ltime = timeTest.getLongFromString(stime);
				//
				List<Course> list = (List<Course>) request.getAttribute("listAll");

				for (Course cd : list) {
					if(cd.getCourseDate()>=ltime){
				%>

				<!--  <a href="http://localhost:8091/999/<%=cd.getCourseId()%>">-->

				<div class="product-item  col-md-4 5555">
					<div class="product-thumb">

						<span class="bage">Sale</span> <img class="img-responsive"
							src="images/<%=cd.getCourseImage()%>" alt="product-img" 
							height=200 />

						<div class="preview-meta">
							<ul>
								<li><span data-toggle="modal" data-target="#product-modal">


										<form action="/999" method="post">
											<input type=hidden value="<%=cd.getCourseId()%>"
												name="courseid">
											<button type="submit">
												<i class="tf-ion-ios-search-strong"></i>
											</button>
										</form>

								</span></li>
								<!--  <li><a href="#!"><i class="tf-ion-ios-heart"></i></a></li>-->
								<li>
								<%
 								Long today = timeTest.getTime(); 
  								boolean allow = cd.getCourseDate()> today; 
 								if (allow == true ){
 								%> 
								<form ALIGN=center action="addcoursetocart" method="post">
								<a href="addcoursetocart?userId=1002&courseId=<%=cd.getCourseId()%>"><i class="tf-ion-android-cart"></i></a>
								<input type="hidden" name="userId" value=1002> 
								</form>
								<%} %>
								
								</li>
							</ul>
						</div>
					</div>
					<div class="product-content">
						<h4>
							<a href="product-single.html"><%=cd.getCourseName()%></a>
						</h4>
						<p class="price">
							$<%=cd.getCoursePrice()%>>
						</p>
						<p class="price"><%=timeTest.TransLongToString(cd.getCourseDate())%>>
						</p>
					</div>
				</div>



				<%
					}
				}
				%>






				<!-- test done -->

				<!--  //////////////////////////下面是新倍的//////////////////////////////// -->

				<!-- 放這裡 -->
</div>
</div>

			</div>
		</div>
	</section>


	<!-- 相關商品開始 -->



	<!-- 相關商品結束 -->



	<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
	<%@include file="../frontpartials/footer.jsp"%>
	<!-- 主文內容 結束 -->

	<!-- //////**極重要!!!!不可少//////<script>//////// -->
	<%@include file="../frontpartials/frontscripttobodyend.jsp"%>




</body>
</html>