<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- //////   文章(食譜/論壇) 右側有分類    ////////// -->    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
<style>
.container{
margin-left:32px;
}
p {
 overflow:hidden visible;
 word-wrap: break-word;
 word-break: break-all;
}
.ingredient {
            text-align: center;
        }
.back {
	background-color:#FFF7FF;
	border: 2px solid #FFF7FF;
	border-radius: 10px;
}
.stepsection{
	border-bottom:1px solid grey;
}
</style>

    
</head>
<body id="body">


<!-- 主文內容 開始 -->

<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>

<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="食譜" />
<jsp:param name="pagination" value="食譜" />
</jsp:include>

     
     <div class="container row">
     <div class="col-12 col-md-8">
     <h1 style="margin-bottom:20px;border-bottom:1px black solid ;background-color: #DCB5FF;height:44px">修改食譜</h1>
    <form action="${pageContext.request.contextPath}/recipeupdate" enctype="multipart/form-data" method="post" id="updateForm">
    <input type="hidden" name="userId" value="1002">
    <input type="hidden" name="recipeId" value="${recipe.recipeId}" >
<!--         <div><label><input -->
<!--                      type="text" name="recipeName" placeholder="請填寫食譜標題" minlength="1" -->
<!--                     required="" value="" style="width: 250px; height: 30px;"></label> -->

<!--         </div> -->
        <div id="description">
            <div class="st1 row justify-content-between align-item-center">
            <div class="col-8 col-md-4 align-self-center "><label><input
                     type="text" name="recipeName" placeholder="請填寫食譜標題" minlength="1"
                    required="" value="${recipe.recipeName}" style="width: 250px; height: 30px;"></label>

           </div>
            <div class="col-12 col-md-4">
                <img class = "img col-12 col-md-6"  onclick="getFile()" src="${pageContext.request.contextPath}/${recipe.imgPath}"style="width:240px;height:180px"/>
                 <input type='file' name="file1" accept="image/*" id="recipeImg" style="display:none"/>
                 </div>
                <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
                <script>
               function getFile(){
            	   $('#recipeImg').click();
               }
                </script>
                <script>
                    $('#recipeImg').on('change', function (e) {
                    	console.log('123')
                    	console.log(e.target.result)
                        const file = this.files[0];
						console.log($('.img'))
                        const fr = new FileReader();
                        fr.onload = function (e) {
                            $('.img').attr('src', e.target.result);
                        };

                        // 使用 readAsDataURL 將圖片轉成 Base64
                        fr.readAsDataURL(file);
                    });
                </script>
            </div>
            <div >
            <h3 style="margin-bottom:20px;border-bottom:1px black solid ;background-color: #DCB5FF;height:30px">食譜簡介</h3>
            <div>
                <label for="" class="t1">食譜分類:</label>
            <select name="recipeCategoryId" id="recipeCategoryId">
                <option value="1"<c:if test="${recipe.recipeCategoryId=='1'}">selected</c:if>>異國料理</option>
                <option value="2"<c:if test="${recipe.recipeCategoryId=='2'}">selected</c:if>>家常菜色</option>
                <option value="3"<c:if test="${recipe.recipeCategoryId=='3'}">selected</c:if>>烘焙點心&甜點</option>
                <option value="4"<c:if test="${recipe.recipeCategoryId=='4'}">selected</c:if>>素食/蔬食</option>
                <option value="5"<c:if test="${recipe.recipeCategoryId=='5'}">selected</c:if>>涼夏甜點</option>
                <option value="6"<c:if test="${recipe.recipeCategoryId=='6'}">selected</c:if>>季節節慶</option>
                <option value="8"<c:if test="${recipe.recipeCategoryId=='7'}">selected</c:if>>健康瘦身</option>
                <option value="9"<c:if test="${recipe.recipeCategoryId=='8'}">selected</c:if>>露營</option>
                <option value="10"<c:if test="${recipe.recipeCategoryId=='9'}">selected</c:if>>海鮮</option>


            </select>
           </div>
			<textarea placeholder="輸入食譜描述 (最多 200 字)" name="recipeDescription" rows="5" value="${recipe.recipeDescription}"
                        style="width: 516px; height: 302px;">${recipe.recipeDescription}</textarea></label>
            </div>
            <div class="descriptionvalidation"></div>
        </div>
        <div class="row">
        <div class="howmany col-12 col-md-3">

            <label for="" class="t1">份量:</label>
            <select name="howManyPeople" id="howmanypeople">
                <option value="null">未設定</option>
                <option value="1人份"<c:if test="${recipe.howManyPeople=='1人份'}">selected</c:if>>1人份</option>
                <option value="2人份"<c:if test="${recipe.howManyPeople=='2人份'}">selected</c:if>>2人份</option>
                <option value="3人份"<c:if test="${recipe.howManyPeople=='3人份'}">selected</c:if>>3人份</option>
                <option value="4人份"<c:if test="${recipe.howManyPeople=='4人份'}">selected</c:if>>4人份</option>
                <option value="5人份"<c:if test="${recipe.howManyPeople=='5人份'}">selected</c:if>>5人份</option>
                <option value="6人份"<c:if test="${recipe.howManyPeople=='6人份'}">selected</c:if>>6人份</option>
                <option value="7人份"<c:if test="${recipe.howManyPeople=='7人份'}">selected</c:if>>7人份</option>
                <option value="8人份"<c:if test="${recipe.howManyPeople=='8人份'}">selected</c:if>>8人份</option>
                <option value="9人份"<c:if test="${recipe.howManyPeople=='9人份'}">selected</c:if>>9人份</option>
                <option value="10人份"<c:if test="${recipe.howManyPeople=='10人份'}">selected</c:if>>10人份</option>
            </select>

        </div>
        <div class="howlong col-12 col-lg-6">

            <label for="" class="t1">花費時間:</label>
            <select name="cookTime" id="time">
                <option value="null">未設定</option>
                <option value="5分鐘"  <c:if test="${recipe.cookTime=='5分鐘'}">selected</c:if>>5分鐘</option>
                <option value="10分鐘" <c:if test="${recipe.cookTime=='10分鐘'}">selected</c:if>>10分鐘</option>
                <option value="15分鐘" <c:if test="${recipe.cookTime=='15分鐘'}">selected</c:if>>15分鐘</option>
                <option value="20分鐘" <c:if test="${recipe.cookTime=='20分鐘'}">selected</c:if>>20分鐘</option>
                <option value="25分鐘" <c:if test="${recipe.cookTime=='25分鐘'}">selected</c:if>>25分鐘</option>
                <option value="30分鐘" <c:if test="${recipe.cookTime=='30分鐘'}">selected</c:if>>30分鐘</option>
                <option value="35分鐘" <c:if test="${recipe.cookTime=='35分鐘'}">selected</c:if>>35分鐘</option>
                <option value="40分鐘" <c:if test="${recipe.cookTime=='40分鐘'}">selected</c:if>>40分鐘</option>
                <option value="45分鐘" <c:if test="${recipe.cookTime=='45分鐘'}">selected</c:if>>45分鐘</option>
                <option value="50分鐘" <c:if test="${recipe.cookTime=='50分鐘'}">selected</c:if>>50分鐘</option>
                <option value="55分鐘" <c:if test="${recipe.cookTime=='55分鐘'}">selected</c:if>>55分鐘</option>
                <option value="60分鐘" <c:if test="${recipe.cookTime=='60分鐘'}">selected</c:if>>60分鐘</option>
            </select>

        </div>
	</div>
    <section id="ingredientsection">
        <h3><span aria-label="食材敘述" style="margin-bottom:20px;border-bottom:1px black solid ;background-color: #DCB5FF;height:30px">食材 15 字以內，份量 10
                字以內</span></h3>

        <fieldset class="ingredientsfield">
         <c:forEach items="${requestScope.ingredients}" var="item">
            <div>
                <div data-disabled-sortable="false" aria-label="食材資訊" id="ingredient"><label><input type="text"
                            aria-label="食材" placeholder="食材" maxlength="15" value="${item.ingredient}"
                            name="ingredient"></label><label><input class="mdc-text-field__input" type="text"
                            aria-label="份量" placeholder="份量" maxlength="10" value="${item.amount}" name="amount" style="margin-right: 10px;margin-left: 10px;"></label><button
                        class="deleteingredient"><i class="fa-solid fa-trash"></i></button>
                </div>
                <div class="error"><span>${descriptionError.defaultMessage }</span></div>
            </div>
            
             </c:forEach>
        </fieldset><button data-color="blue" data-size="md" data-full-width="true" data-unfulfilled="false"
            data-pending="false" id="plusing" data-with-title="false" type="button"
            aria-label="新增食材"><span>加入食材</span></button>

    </section>
      <section id="step">
        <h3 style="margin-bottom:20px;border-bottom:1px black solid ;background-color: #DCB5FF;height:30px">步驟</h3>
        <fieldset class="steparea" id="stepfieldset">

			<c:forEach items="${requestScope.step}" var="item" varStatus="status">
            <section class="stepsection" id="stepsection" data-index="1">
                <header>
                    <h4 class="steporder">${status.index+1}</h4>
                </header>
                <div class="row">
                <div class="col-12 col-md-4">
                <img class = "stepimage col-12 col-md-5" id="recipephoto1" "" src="../${item.stepImage}"style="width:240px;height:180px"/>
                 <input type='file' name="stepimage" accept="image/*" id="recipephoto"  class="recipephoto"style="display:none"/>
                 <input type="hidden" name="stepIndex" value="">  
                 </div>
                <div class="col-12 col-md-6">
                <textarea placeholder="輸入步驟說明 (最多 150 字)" rows="4" name="step"
                            style="width: 350px; height: 150px;"value="${item.step}" >${item.step}</textarea>
                    <button class="deletestep"><i class="fa-solid fa-trash"></i></button>
                </div>
                </div>
            </section>
			</c:forEach>


        </fieldset>
        <script> 
        //$('.steparea').on('click', '.stepimage', function () 
        		$('.steparea').on('click', '.stepimage', function () {
            	   console.log($(this).next())
            	   $(this).next().click();
               })
         </script>
         <script>
                    $('.steparea').on('change','.recipephoto', function (e) {
                    	console.log("456")
                    	var index = $(this).parent().parent().parent().find('.steporder').text();
                    	$(this).next().val(index)
//                     	console.log(e.target.result)
                        const file = this.files[0];
							console.log($(this).prev());
                        const fr = new FileReader();
                        let img = $(this).prev();
                        fr.onload = function (e) {
//                         	console.log(e.target.result)
							console.log($(this))
                            img.attr('src', e.target.result);
                           
                        };

                        // 使用 readAsDataURL 將圖片轉成 Base64
                        fr.readAsDataURL(file);
                    });
           </script>
        <label class="plus">增加步驟</label>
    </section>
    <div class="sub">
    	<button type="button" class="update">修改</button>
<!--         <input type="submit" value="送出"> -->
        <input type="reset" value="清除">
    </div>
    </form>
    </div>
    
    <div class="col-md-4">
					<!-- ///////////  文章頁的側邊 -推播專區 ///////////// -->
				<!-- @@include('blocks/post-sidebar.htm') -->
				<%@include file="../frontpartials/recipePostsidebar.jsp" %>
      </div>
       </div>
       <script src="https://kit.fontawesome.com/2cf249db39.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
    $('.update').click(function(){
    	var form = $('#updateForm');
    	updateCheck(form);
    })
	function updateCheck(form){
    	Swal.fire({
  		  title: '確定要修改嗎?',
  		  showDenyButton: true,
  		  showCancelButton: true,
  		  confirmButtonText: '確定',
  		  denyButtonText: '取消',
  		}).then((result) => {
  		  /* Read more about isConfirmed, isDenied below */
  		  if (result.isConfirmed) {
  		    Swal.fire('修改成功', '', '成功').then((result)=>{
  			  form.submit();
  		    	
  		    })
  		  } else if (result.isDenied) {
  		    Swal.fire('並未修改', '', 'info')
  		  }
  		})
    }
    
        $(function () {
        	 $('#plusing').click(function () {
                 let content = `<div>
         <div  data-disabled-sortable="false"
                         aria-label="食材資訊" id="ingredient"><label><input type="text" aria-label="食材"  placeholder="食材" maxlength="15"
                                 value="" name="ingredient"></label><label><input
                                 class="mdc-text-field__input" type="text" aria-label="份量" placeholder="份量" maxlength="10"
                                 value="" name="amount"style="margin-right: 10px;margin-left: 10px;"></label><button
                         class="deleteingredient"><i class="fa-solid fa-trash"></i></button>
                                 </div><div class="ingredientvalidation"></div></div>
                                 `
                 $('.ingredientsfield').append(content)
             })
             $('.ingredientsfield').on('click', 'button', function () {
            	 $(this).parent().parent().remove();
              
             })
            
            
            
            let i = 3;

            $('#step').on('click', '.plus', function () {
                i++;
                let content =
                    `
<section class="stepsection" id="stepsection" data-index="`+ i + `">
    <header >
        <h4 class="steporder" >` + i + `</h4>
    </header>
    <div class="row">
    	<div class="col-12 col-md-4">
    		<img class = "stepimage col-12 col-md-5" id="stepimage`+i+`" " src="https://assets-icook.icook.network/packs/media/default/recipe-editor-step-cover-deaf4b04.png"style="width:240px;height:180px"/>
    		 <input type='file' name="stepimage" accept="image/*" id="recipephoto" class="recipephoto" style="display:none"/>
     	</div>
  		  <div class="col-12 col-md-6">
    			<textarea placeholder="輸入步驟說明 (最多 150 字)" rows="4" name="step"
                style="width: 350px; height: 150px;" ></textarea>
       			 <button class="deletestep"><i class="fa-solid fa-trash"></i></button>
   		 </div>
    </div>
	</section>

    `
                $('.steparea').append(content)
            })

            $('.steparea').on('click', 'button', function () {
                let j = $(this).parent().parent().parent().find('.steporder').text();
                let nextindex = $(this).parent().parent().parent().next().find('.steporder');

                for (j; j < i; j++) {
                    console.log(j);
                    // console.log($(this).parent().parent().find('.steporder').text())
                    nextindex.text(j);
                    nextindex = nextindex.parent().parent().next().find('.steporder');
                }
                i = j;
                i--;
                $(this).parent().parent().parent().remove();

            })
        })
			
    </script>
    
<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</body>
</html>