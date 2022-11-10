<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ////////////   相關商品推播(productsingle.jsp用到)    ///////////// -->
    
<section class="products related-products section">
	<div class="container">
		<div class="row">
			<div class="title text-center">
				<h1 style= "float:left;">熱賣商品</h1>
			</div>
		</div>
		<br>
		
		
		<!-- owl.carousel -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
</link>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
</link>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<div class="owl-carousel owl-theme">
<c:forEach items="${findOnSale}" var="item" >
  <div class="item">
    <h4>${item.productName }</h4>
    <img class="img-responsive" src="../${item.productImage }" alt="product-img" />
  </div>
  </c:forEach>
  
</div>
		
		
		
		
		
		<script type="text/javascript">
		
		$(".owl-carousel").owlCarousel({
			items:6,
			  loop: true, // 循環播放
			  margin: 10, // 外距 10px
			  nav: true, // 顯示點點
			  autoplay:true,
			    autoplayTimeout:2000,
			    autoplayHoverPause:true
// 			  responsive: {
// 			    0: {
// 			      items: 1 // 螢幕大小為 0~600 顯示 1 個項目
// 			    },
// 			    600: {
// 			      items: 3 // 螢幕大小為 600~1000 顯示 3 個項目
// 			    },
// 			    1000: {
// 			      items: 5 // 螢幕大小為 1000 以上 顯示 5 個項目
// 			    }
// 			  }
			});

		
		
		</script>
		
		
	</div>
</section>



<!-- Modal -->
<div class="modal product-modal fade" id="product-modal">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<i class="tf-ion-close"></i>
	</button>
  	<div class="modal-dialog " role="document">
    	<div class="modal-content">
	      	<div class="modal-body">
	        	<div class="row">
	        		<div class="col-md-8">
	        			<div class="modal-image">
		        			<img class="img-responsive" src="./source/images/shop/products/modal-product.jpg" />
	        			</div>
	        		</div>
	        		<div class="col-md-3">
	        			<div class="product-short-details">
	        				<h2 class="product-title">GM Pendant, Basalt Grey</h2>
	        				<p class="product-price">$200</p>
	        				<p class="product-short-description">
	        					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem iusto nihil cum. Illo laborum numquam rem aut officia dicta cumque.
	        				</p>
	        				<a href="#!" class="btn btn-main">Add To Cart</a>
	        				<a href="#!" class="btn btn-transparent">View Product Details</a>
	        			</div>
	        		</div>
	        	</div>
	        </div>
    	</div>
  	</div>
</div>