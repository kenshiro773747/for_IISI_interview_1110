<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- //////   文章(食譜/論壇) 單頁+討論區留言板    ////////// -->  

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">


<!-- 主文內容 開始 -->

<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>

<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="論壇/食譜" />
<jsp:param name="pagination" value="論壇/食譜" />
</jsp:include>


<section class="page-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="post post-single">
					<div class="post-thumb">
						<img class="img-responsive" src="./source/images/blog/blog-post-1.jpg" alt="">
					</div>
					<h2 class="post-title">How To Wear Bright Shoes</h2>
					<div class="post-meta">
						<ul>
							<li>
								<i class="tf-ion-ios-calendar"></i> 20, MAR 2017
							</li>
							<li>
								<i class="tf-ion-android-person"></i> POSTED BY ADMIN
							</li>
							<li>
								<a href="#!"><i class="tf-ion-ios-pricetags"></i> LIFESTYLE</a>,<a href="#!"> TRAVEL</a>, <a href="#!">FASHION</a>
							</li>
							<li>
								<a href="#!"><i class="tf-ion-chatbubbles"></i> 4 COMMENTS</a>
							</li>
						</ul>
					</div>
					<div class="post-content post-excerpt">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit vitae placeat ad architecto nostrum asperiores vel aperiam, veniam eum nulla. Maxime cum magnam, adipisci architecto quibusdam cumque veniam fugiat quae. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio vitae ab doloremque accusamus sit, eos dolorum officiis a perspiciatis aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, facere. </p>
						<blockquote class="quote-post">
				            <p>
				                Lid est laborum dolo rumes fugats untras. Etharums ser quidem rerum facilis dolores nemis omnis fugats vitaes nemo minima rerums unsers sadips amets.. Sed ut perspiciatis unde omnis iste natus error
				            </p>
				        </blockquote>
				        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum illo deserunt necessitatibus quibusdam sint, eos explicabo tenetur molestiae vero facere, aspernatur sit mollitia perferendis reiciendis. Deleniti magni explicabo sed alias fugit amet animi molestias ipsum maiores. Praesentium sint, id laborum quos. Tempora inventore est, dolor corporis quis doloremque nostrum, eos velit culpa quasi labore. Provident laborum porro nihil iste, magnam officia nemo praesentium autem, libero vel officiis. Omnis pariatur nam voluptatem voluptate at officia repellat ea beatae eligendi? Mollitia error saepe, aperiam facere. Optio maiores deleniti veritatis eaque commodi atque aperiam, debitis iste alias eligendi ut facilis earum! Impedit, tempore.</p>
				        <pre>.blog-classic {
						    margin-bottom: 70px;
						    padding-bottom: 70px;
						    border-bottom: 1px solid #efefef;
						}
						</pre>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex error esse a dolore, architecto sapiente, aliquid commodi, laudantium eius nemo enim. Enim, fugit voluptatem rem molestiae. Sed totam quis accusantium iste nesciunt id exercitationem cumque repudiandae voluptas perspiciatis, consequatur quasi, molestias, culpa odio adipisci. Nesciunt optio fugiat iste quam modi, ex vitae odio pariatur! Corrupti explicabo at harum qui doloribus, sit dicta nemo, dolor, enim eum molestias fugiat obcaecati autem eligendi? Nisi delectus eaque architecto voluptatibus, unde sit minus quae quod eligendi soluta recusandae doloribus, officia, veritatis voluptatum eius aliquam quos. Consectetur, nisi? Veritatis totam, unde nostrum exercitationem tempora suscipit, molestias, deserunt ipsum laborum aut iste eaque? Vitae delectus dicta maxime non mollitia? Sapiente eos a quia eligendi deserunt repudiandae modi molestias tenetur autem pariatur ullam itaque, quas eveniet, illo quam rerum ex obcaecati voluptatum nesciunt incidunt culpa provident illum soluta. Voluptas possimus nesciunt inventore perspiciatis neque fugiat, magnam natus repellendus praesentium eum voluptatum, alias incidunt, tempora reprehenderit recusandae et numquam itaque ratione dolor voluptatibus in commodi ut! Neque deserunt nostrum commodi dolor natus quo, non vitae deleniti, vero voluptatem error aspernatur veniam expedita numquam amet quia in dolores velit esse molestiae! Iusto architecto accusantium quisquam recusandae quod vero quia.</p>
				    </div>
				    <div class="post-social-share">
				        <h3 class="post-sub-heading">Share this post</h3>
				        <div class="social-media-icons">
				        	<ul>
								<li><a class="facebook" href="https://themefisher.com/"><i class="tf-ion-social-facebook"></i></a></li>
								<li><a class="twitter" href="https://themefisher.com/"><i class="tf-ion-social-twitter"></i></a></li>
								<li><a class="dribbble" href="https://themefisher.com/"><i class="tf-ion-social-dribbble-outline"></i></a></li>
								<li><a class="instagram" href="https://themefisher.com/"><i class="tf-ion-social-instagram"></i></a></li>
								<li><a class="googleplus" href="https://themefisher.com/"><i class="tf-ion-social-googleplus"></i></a></li>
							</ul>
				        </div>
				    </div>

				    <div class="post-comments">
				    	<h3 class="post-sub-heading">10 Comments</h3>
				    	<ul class="media-list comments-list m-bot-50 clearlist">
						    <!-- Comment Item start-->
						    <li class="media">

						        <a class="pull-left" href="#!">
						            <img class="media-object comment-avatar" src="./source/images/blog/avater-1.jpg" alt="" width="50" height="50">
						        </a>

						        <div class="media-body">
						            <div class="comment-info">
						                <h4 class="comment-author">
						                    <a href="#!">Jonathon Andrew</a>
						                	
						                </h4>
						                <time>July 02, 2015, at 11:34</time>
						                <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
						            </div>

						            <p>
						                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at magna ut ante eleifend eleifend.
						            </p>

						            <!--  second level Comment start-->
						            <div class="media">

						                <a class="pull-left" href="#!">
						                    <img class="media-object comment-avatar" src="./source/images/blog/avater-2.jpg" alt="" width="50" height="50">
						                </a>

						                <div class="media-body">

						                    <div class="comment-info">
						                        <div class="comment-author">
						                            <a href="#!">Senorita</a>
						                        </div>
						                        <time>July 02, 2015, at 11:34</time>
						                        <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
						                    </div>

						                    <p>
						                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at magna ut ante eleifend eleifend.
						                    </p>


						                    <!-- third level Comment start -->
						                    <div class="media">

						                        <a class="pull-left" href="#!">
						                            <img class="media-object comment-avatar" src="./source/images/blog/avater-3.jpg" alt="" width="50" height="50">
						                        </a>

						                        <div class="media-body">

						                            <div class="comment-info">
						                                <div class="comment-author">
						                                    <a href="#!">Senorita</a>
						                                </div>
						                                <time>July 02, 2015, at 11:34</time>
						                                <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
						                            </div>

						                            <p>
						                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at magna ut ante eleifend eleifend.
						                            </p>


						                        </div>

						                    </div>
						                    <!-- third level Comment end -->

						                </div>

						            </div>
						            <!-- second level Comment end -->

						        </div>

						    </li>
						    <!-- End Comment Item -->

						    <!-- Comment Item start-->
						    <li class="media">

						        <a class="pull-left" href="#!">
						            <img class="media-object comment-avatar" src="./source/images/blog/avater-4.jpg" alt="" width="50" height="50">
						        </a>

						        <div class="media-body">

						            <div class="comment-info">
						                <div class="comment-author">
						                    <a href="#!">Jonathon Andrew</a>
						                </div>
						                <time>July 02, 2015, at 11:34</time>
						                <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
						            </div>

						            <p>
						                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at magna ut ante eleifend eleifend.
						            </p>

						        </div>

						    </li>
						    <!-- End Comment Item -->

						    <!-- Comment Item start-->
						    <li class="media">

						        <a class="pull-left" href="#!">
						            <img class="media-object comment-avatar" src="./source/images/blog/avater-1.jpg" alt="" width="50" height="50">
						        </a>

						        <div class="media-body">

						            <div class="comment-info">
						                <div class="comment-author">
						                    <a href="#!">Jonathon Andrew</a>
						                </div>
						                <time>July 02, 2015, at 11:34</time>
						                <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
						            </div>

						            <p>
						                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at magna ut ante eleifend eleifend.
						            </p>

						        </div>

						    </li>
						    <!-- End Comment Item -->

						</ul>
				    </div>

				    <div class="post-comments-form">
				    	<h3 class="post-sub-heading">Leave You Comments</h3>
				    	<form method="post" action="#" id="form" role="form" >

				            <div class="row">

				                <div class="col-md-6 form-group">
				                    <!-- Name -->
				                    <input type="text" name="name" id="name" class=" form-control" placeholder="Name *" maxlength="100" required="">
				                </div>

				                <div class="col-md-6 form-group">
				                    <!-- Email -->
				                    <input type="email" name="email" id="email" class=" form-control" placeholder="Email *" maxlength="100" required="">
				                </div>


				                <div class="form-group col-md-12">
				                    <!-- Website -->
				                    <input type="text" name="website" id="website" class=" form-control" placeholder="Website" maxlength="100">
				                </div>

				                <!-- Comment -->
				                <div class="form-group col-md-12">
				                    <textarea name="text" id="text" class=" form-control" rows="6" placeholder="Comment" maxlength="400"></textarea>
				                </div>

				                <!-- Send Button -->
				                <div class="form-group col-md-12">
				                    <button type="submit" class="btn btn-small btn-main ">
				                        Send comment
				                    </button>
				                </div>


				            </div>

				        </form>
				    </div>


				</div>

			</div>
		</div>
	</div>
</section>

<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

</body>
</html>