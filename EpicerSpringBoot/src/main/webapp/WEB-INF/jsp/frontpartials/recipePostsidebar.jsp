<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- ///////////  文章頁的側邊 ///////////// -->
 <!-- ///////////  推播專區 ///////////// -->
 
 
 <!-- /////////// 申請寄發新文章通知信(輸入頁面) ///////////// -->
<aside class="sidebar">
	<div class="widget widget-subscription">
		<h4 class="widget-title">食譜搜尋</h4>
		  <div class="form-group">
		    <input type="text" class="keyword" placeholder="輸入想搜尋的關鍵字">
		  </div>
		  <button  class="btn btn-main" id="search">Search</button>
	</div>

 <!-- /////////// 最新發文 ///////////// -->
	<!-- Widget Latest Posts -->
	<div class="widget widget-latest-post">
		<h4 class="widget-title">Latest Posts</h4>
		<div class="media">
			<a class="pull-left" href="http://localhost:8091/reciperesult/1023">
				<img class="media-object" src="${pageContext.request.contextPath}/images/南瓜米粉.webp" alt="Image">
			</a>
			<div class="media-body">
				<h4 class="media-heading"><a href="http://localhost:8091/reciperesult/1023">南瓜米粉</a></h4>
<!-- 				<p style="overflow:hidden ">西班牙的開胃小點 烹調非常的簡單 橄欖油不可少 再備三樣食材及法國麵包 宅在家輕鬆的下廚就可品嚐異國風味的美食</p> -->
			</div>
		</div>
		<div class="media">
			<a class="pull-left" href="http://localhost:8091/reciperesult/1021">
				<img class="media-object" src="${pageContext.request.contextPath}/images/紅酒燉肉.webp" alt="Image">
			</a>
			<div class="media-body">
				<h4 class="media-heading"><a href="http://localhost:8091/reciperesult/1021">紅酒燉肉</a></h4>
<!-- 				<p style="overflow:hidden ">蘋果磅蛋糕 是目前蘋果料理中我最最最喜歡的一道 材料簡單 成功率也高 就算是新手也不用太害怕的一個小蛋糕 推薦給大家!!</p> -->
			</div>
		</div>
		<div class="media">
			<a class="pull-left" href="http://localhost:8091/reciperesult/1028">
				<img class="media-object" src="${pageContext.request.contextPath}/images/三杯雞.webp" alt="Image">
			</a>
			<div class="media-body">
				<h4 class="media-heading"><a href="http://localhost:8091/reciperesult/1028">三杯雞</a></h4>
<!-- 				<p style="overflow:hidden">加了青辣椒的炸醬麵不只口感更豐富還多了一分的清香。怕辣的人可以使用青龍（糯米椒）代替，但敢吃辣的人推薦一定要試試看用牛角椒或羊角椒下去炒喔！外公口味的炸醬麵就是炒蛋、蔥花、豆乾、青辣椒滿滿的料加爆！配上小黃瓜絲或豆芽就是眷村炸醬麵的味道！</p> -->
			</div>
		</div>
		<div class="media">
			<a class="pull-left" href="http://localhost:8091/reciperesult/1049">
				<img class="media-object" src="${pageContext.request.contextPath}/images/奶油燉菜.webp" alt="Image">
			</a>
			<div class="media-body">
				<h4 class="media-heading"><a href="http://localhost:8091/reciperesult/1049"> 奶油燉菜</a></h4>
<!-- 				<p style="overflow:hidden ">中秋團圓烤肉，就是需要來點生菜解油膩! 生菜爽脆蝦仁鮮甜，再搭配上新東陽蜜汁豬肉乾的鹹甜好滋味，增添整道菜色的豐富與層次。蝦鬆一人一份剛剛好，輕鬆方便好入口!</p> -->
			</div>
		</div>
	</div>
	<!-- End Latest Posts -->


 <!-- /////////// 文章分類-風格1 ///////////// -->
	<!-- Widget Category -->
	 <div class="widget widget-category">
            <h4 class="widget-title">Categories</h4>
            <ul class="widget-category-list">
                <li class="category" value="1"><a >異國料理</a>
                </li>
                <li class="category" value="2"><a >家常菜色</a>
                </li>
                <li class="category" value="3"><a>烘焙點心&甜點</a>
                </li>
                <li class="category" value="4"><a >素食/蔬食</a>
                </li>
                <li class="category" value="5"><a>涼夏甜點</a>
                </li>
                <li class="category" value="6"><a>季節節慶</a>
                </li>
                <li class="category" value="7"><a>健康瘦身</a>
                </li>
                <li class="category" value="8"><a>露營</a>
                </li>
                <li class="category" value="9"><a>海鮮</a>
                </li>
            </ul>
        </div> <!-- End category  -->


</aside>
 <script>
        $('#search').click(function () {
            var nowPage = 1;
            var totalPage = 4;
            var limitRows = 6;
            var totalRows = 0;
            var startRows = 0;
            var endRows = 4;
            var list = new Array();
            var tab = $('#info');
            var now = $('#now');
            var total = $('#total');
            var keyword = $('.keyword').val();
            console.log(keyword)
            var param = {"keyword":""+keyword}
            $.ajax({
                type: 'get',
                url: 'recipelist/',
                data:param,
                dataType: 'json',
                success: function (data) {
                	console.log(JSON.stringify(data))
                    var tg = Math.floor(data.length / limitRows);
                    if (Math.floor(data.length % limitRows) == 0) {
                        totalPage = tg;
                    } else {
                        totalPage = tg + 1;
                    }
                    ///存入到陣列////
                    list = data;
                    /////初始化顯示資料///
					generate(totalPage);
                    disp(nowPage, list);
                }
            })
			function generate(totalPage) {
            	$("li").remove(".appended");
                for (var i = 1; i < (totalPage + 1); i++) {
                    let content = `<li class="page-item appended" ><a class="page-link page-index">`
                        + i + `</a></li>`
                    $('.pagecontainer').append(content);
                }
                let next = `<li class="page-item appended">
                    <a class="page-link " aria-label="Next" id="next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>`
                	$('.pagecontainer').append(next);

            }
            function disp(n, d) {
                $("div").remove(".recipecard");
                startRows = (n - 1) * limitRows;
                endRows = startRows + limitRows;
                for (var i = startRows; i < endRows ; i++) {
                    var t = '<div class="col-11 col-md-4 p-4 recipecard h-50">'+
                         '<div class="item">'+
                             '<a href="${pageContext.request.contextPath}/reciperesult/'+list[i].recipeId+'">'+'<img src="'+list[i].imgPath+'" alt="" class="img-fluid w-100"  >'+
                            '<h3>' + list[i].recipeName + '</h3>'+
                            '<p style="height:150px">' + list[i].recipeDescription + '</p></div></div>';
                    tab.append(t);
                }
            } //disp
           
        });
    </script>
    <script>
    	$('.category').click(function(){
    		  var nowPage = 1;
              var totalPage = 4;
              var limitRows = 6;
              var totalRows = 0;
              var startRows = 0;
              var endRows = 4;
              var list = new Array();
              var tab = $('#info');
              var now = $('#now');
              var total = $('#total');
              let categoryId = Number($(this).val());
              console.log(categoryId)
              $.ajax({
                  type: 'get',
                  url: `categories/` + categoryId,
                  dataType: 'json',
                  success: function (data) {
                  	console.log(JSON.stringify(data))
                      var tg = Math.floor(data[0].length / limitRows);
                      if (Math.floor(data[0].length % limitRows) == 0) {
                          totalPage = tg;
                      } else {
                          totalPage = tg + 1;
                      }
                      list = data[0];
  					category(data[1]);
  					generate(totalPage);
                     disp(nowPage, list);
                  }
              })
              function category(data){
              	$('#categoryName').text(data.categoryName);
              	$('#categoryDescription').text(data.categoryDescriptionString)
              	$('#categoryImg').attr("src",data.categoryImg)
              }
  			function generate(totalPage) {
  				$("li").remove(".appended");
                  for (var i = 1; i < (totalPage + 1); i++) {
                      let content = `<li class="page-item appended" ><a class="page-link page-index">`
                          + i + `</a></li>`
                      $('.pagecontainer').append(content);
                  }
                  let next = `<li class="page-item appended">
                      <a class="page-link " aria-label="Next" id="next">
                      <span aria-hidden="true">&raquo;</span>
                  </a>
              </li>`
                  	$('.pagecontainer').append(next);

              }
              function disp(n, d) {
            	  console.log(d);
                  $("div").remove(".recipecard");
                  startRows = (n - 1) * limitRows;
                  endRows = startRows + limitRows;
                  for (var i = startRows; i < endRows ; i++) {
                      var t = '<div class="col-11 col-md-4 p-4 recipecard h-50">'+
                           '<div class="item">'+
                               '<a href="${pageContext.request.contextPath}/reciperesult/'+list[i].recipeId+'">'+'<img src="'+list[i].imgPath+'" alt="" class="img-fluid w-100"  >'+
                              '<h3>' + list[i].recipeName + '</h3>'+
                              '<p style="height:150px">' + list[i].recipeDescription + '</p></div></div>';
                      tab.append(t);
                  }
              } //disp
         
    	});
    </script>
