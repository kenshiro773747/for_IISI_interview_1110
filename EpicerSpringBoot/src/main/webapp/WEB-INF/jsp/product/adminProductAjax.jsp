<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.product.*"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer管理員系統</title>

<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLindHead (結束) -->
<style type="text/css">

fieldset {
	            width: 900px;
                border-radius: 15px;
                margin: 10px auto;
                background-color: white;
}


span {
position:relative;
overflow:hidden;
white-space: nowrap;  
overflow: hidden;  
text-overflow: ellipsis; 
max-width:120px;
display:inline-block;

}

/* 想調整小表格的寬度 */
td .align-middle-1 {
position:relative;
overflow:hidden;
white-space: nowrap;  
overflow: hidden;  
text-overflow: ellipsis; 
max-width:10px;
display:inline-block;

}

.d-flex  {
position:relative;
overflow:hidden;
white-space: nowrap;  
overflow: hidden;  
text-overflow: ellipsis; 
max-width:200px;
display:inline-block;
}

/* 表格之間空白 */
.table> :not(caption)>*>* {
    padding: 0.1rem;
    background-color: var(--bs-table-bg);
    border-bottom-width: 1px;
    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
}
/* 按鍵下方空白 */
.btn {
     margin-bottom: 0rem;
    letter-spacing: -0.025rem;
    text-transform: none;
    box-shadow: 0 4px 6px rgb(50 50 93 / 10%), 0 1px 3px rgb(0 0 0 / 8%);
}
</style>

<script src="js/jquery-3.6.0.js"></script>

<script type="text/javascript">

window.onload=function(){
	
	$.ajax({
		url: 'productManageAjax' ,
		dataType: 'json',
		complete: function (data) {
			
// 			$("#total").empty("");
// 			                console.log(JSON.stringify(data));
			var content = "";
			var productStatus = "";
			var productHot = "";
			for (let i = 0; i < data.responseJSON.length; i++) {

				productStatus = data.responseJSON[i].productStatus
				if (productStatus == 0) {
					productStatus = "未上架";
				} else if (productStatus == 1) {
					productStatus = "上架中";
				} else {
					productStatus = "無法辨別";
				}
				console.log(productStatus);
				

				productCategoryId = data.responseJSON[i].productCategoryId
				if (productCategoryId == 1) {
					productCategoryId="五穀根莖類";
				} else if (productCategoryId==2) {
					productCategoryId="奶類";
				} else if (productCategoryId==3) {
					productCategoryId="蛋豆魚肉類";
				} else if (productCategoryId==4) {
					productCategoryId="蔬菜類";
				} else if (productCategoryId==5) {
					productCategoryId="水果類";
				} else if (productCategoryId==6) {
					productCategoryId="油脂與堅果種子類";
				} else if (productCategoryId==7) {
					productCategoryId="調味品類";
				} else {
					productCategoryId="無法辨別";
				}
				console.log(productCategoryId);
				
				
				content1 =
					`
            

<tr>
  <td>
    <div class="d-flex">
 <input type="hidden" name="productId" value="`+ data.responseJSON[i].productId + `">
      <div>
<!--        照片位置         -->
      <img src="`+ data.responseJSON[i].productImage + `"  width="80px" border-radius="15px" margin="20px auto">
      </div>
       &nbsp;&ensp;
      <div class="d-flex flex-column justify-content-center">
      <a href="productDetail?ProductId=`+data.responseJSON[i].productId+ `">  
      <h6 class="mb-0 text-s">`+ data.responseJSON[i].productName + `</h6> </a>
        <p class="text-xs text-secondary mb-0" >
        `




				content2 =
					`
        </p>
      </div>
    </div>
    
  </td>
  <td class="align-middle text-center">
  <span class="text-secondary text-xs font-weight-bold">`+ data.responseJSON[i].productUnit + `</span>
  <!--可以顯示上下兩格的表格
    <p class="text-xs font-weight-bold mb-0">Manager</p>
    <p class="text-xs text-secondary mb-0">Organization</p>
    -->
  </td>
  
  <td class="align-middle-1 text-center">
    <span class="text-secondary text-xs font-weight-bold">`+ data.responseJSON[i].productPrice + `</span>
  </td>
  <td class="align-middle-1 text-center">
    <span class="text-secondary text-xs font-weight-bold">`+ data.responseJSON[i].productOrigin + `</span>
  </td>
  <td class="align-middle-1 text-center">
    <span class="text-secondary text-xs font-weight-bold">`+ data.responseJSON[i].productStock + `</span>
  </td>
  <td class="align-middle-1 text-center">
    <span class="text-secondary text-xs font-weight-bold">
    `


				content3 =

					`</span>
  </td>
   <td class="align-middle text-center" >
    <span class="text-secondary text-xs font-weight-bold" >`+ data.responseJSON[i].productDescription + `</span>
  </td>
  
  
  
  
  <td>
 <form  action="updateProduct" method="post">
    <input type="hidden" name="ProductId" value=`+ data.responseJSON[i].productId + ` >
    <input type="hidden" name="ProductName" value=`+ data.responseJSON[i].productName + ` >
    <input type="hidden" name="ProductCategoryId" value=`+ data.responseJSON[i].productCategoryId + `>
    <input type="hidden" name="productImage" value=`+ data.responseJSON[i].productImage + `>
    <input type="hidden" name="ProductUnit" value=`+ data.responseJSON[i].productUnit + ` >
    <input type="hidden" name="ProductPrice" value=`+ data.responseJSON[i].productPrice + ` >
    <input type="hidden" name="ProductOrigin" value=`+ data.responseJSON[i].productOrigin + `>
    <input type="hidden" name="ProductStock" value=`+ data.responseJSON[i].productStock + `>
    <input type="hidden" name="ProductStatus" value=`+ data.responseJSON[i].productStatus + `>
    <input type="hidden" name="ProductDescription" value=`+ data.responseJSON[i].productDescription + ` >
    <button class="btn bg-gradient-primary mb-0"    onclick="">
     <i class="ni ni-settings"></i>
	</button>
</form>
 </td>
 
 <td>
<form id="deleteProduct`+ data.responseJSON[i].productId + `" action="deleteProductAction" method="post">
    <input type="hidden" name="ProductId" value=`+ data.responseJSON[i].productId + ` >
    <input type="hidden" name="ProductName" value=`+ data.responseJSON[i].productName + ` >
    <input type="hidden" name="ProductCategoryId" value=`+ data.responseJSON[i].productCategoryId + `>
    <input type="hidden" name="productImage" value=`+ data.responseJSON[i].productImage + `>
    <input type="hidden" name="ProductUnit" value=`+ data.responseJSON[i].productUnit + ` >
    <input type="hidden" name="ProductPrice" value=`+ data.responseJSON[i].productPrice + ` >
    <input type="hidden" name="ProductOrigin" value=`+ data.responseJSON[i].productOrigin + `>
    <input type="hidden" name="ProductStock" value=`+ data.responseJSON[i].productStock + `>
    <input type="hidden" name="ProductStatus" value=`+ data.responseJSON[i].productStatus + `>
    <input type="hidden" name="ProductDescription" value=`+ data.responseJSON[i].productDescription + ` >
    <button type="button" class="btn bg-gradient-primary mb-0"  onclick="del(`+ data.responseJSON[i].productId + `)">
    	<i class="ni ni-scissors" ></i>
    	</button>
</form>
</td>
  
</tr>`;

				$("#total").append(content1 + productCategoryId + content2 + productStatus + content3);
			}



		}


	})
	
}






$(function () {
$(".nav-link-1").click(function () {
	console.log(123);
	$.ajax({
		url: 'productManageAjax' ,
		dataType: 'json',
		complete: function (data) {
			$("#total").empty("");
// 			                console.log(JSON.stringify(data));
			var content = "";
			var productStatus = "";
			for (let i = 0; i < data.responseJSON.length; i++) {

				productStatus = data.responseJSON[i].productStatus
				if (productStatus == 0) {
					productStatus = "未上架";
				} else if (productStatus == 1) {
					productStatus = "上架中";
				} else {
					productStatus = "無法辨別";
				}
				console.log(productStatus);
				

				productCategoryId = data.responseJSON[i].productCategoryId
				if (productCategoryId == 1) {
					productCategoryId="五穀根莖類";
				} else if (productCategoryId==2) {
					productCategoryId="奶類";
				} else if (productCategoryId==3) {
					productCategoryId="蛋豆魚肉類";
				} else if (productCategoryId==4) {
					productCategoryId="蔬菜類";
				} else if (productCategoryId==5) {
					productCategoryId="水果類";
				} else if (productCategoryId==6) {
					productCategoryId="油脂與堅果種子類";
				} else if (productCategoryId==7) {
					productCategoryId="調味品類";
				} else {
					productCategoryId="無法辨別";
				}
				console.log(productCategoryId);
				
				
				content1 =
					`
            

<tr>
  <td>
    <div class="d-flex ">
 <input type="hidden" name="productId" value="`+ data.responseJSON[i].productId + `">
      <div>
<!--        照片位置         -->
      <img src="`+ data.responseJSON[i].productImage + `"  width="80px" border-radius="15px" margin="20px auto">
      </div>
       &nbsp;&ensp;
      <div class="d-flex flex-column justify-content-center">
      <a href="productDetail?ProductId=`+data.responseJSON[i].productId+ `">  
      <h6 class="mb-0 text-s">`+ data.responseJSON[i].productName + `</h6> </a>
        <p class="text-xs text-secondary mb-0" >
        `




				content2 =
					`
        </p>
      </div>
    </div>
    
  </td>
  <td class="align-middle text-center">
  <span class="text-secondary text-xs font-weight-bold">`+ data.responseJSON[i].productUnit + `</span>
  <!--可以顯示上下兩格的表格
    <p class="text-xs font-weight-bold mb-0">Manager</p>
    <p class="text-xs text-secondary mb-0">Organization</p>
    -->
  </td>
  
  <td class="align-middle text-center">
    <span class="text-secondary text-xs font-weight-bold">`+ data.responseJSON[i].productPrice + `</span>
  </td>
  <td class="align-middle text-center">
    <span class="text-secondary text-xs font-weight-bold">`+ data.responseJSON[i].productOrigin + `</span>
  </td>
  <td class="align-middle text-center">
    <span class="text-secondary text-xs font-weight-bold">`+ data.responseJSON[i].productStock + `</span>
  </td>
  <td class="align-middle text-center">
    <span class="text-secondary text-xs font-weight-bold">
    `


				content3 =

					`</span>
  </td>
   <td class="align-middle text-center" >
    <span class="text-secondary text-xs font-weight-bold" >`+ data.responseJSON[i].productDescription + `</span>
  </td>
  
  
  
  
  <td>
 <form  action="updateProduct" method="post">
    <input type="hidden" name="ProductId" value=`+ data.responseJSON[i].productId + ` >
    <input type="hidden" name="ProductName" value=`+ data.responseJSON[i].productName + ` >
    <input type="hidden" name="ProductCategoryId" value=`+ data.responseJSON[i].productCategoryId + `>
    <input type="hidden" name="productImage" value=`+ data.responseJSON[i].productImage + `>
    <input type="hidden" name="ProductUnit" value=`+ data.responseJSON[i].productUnit + ` >
    <input type="hidden" name="ProductPrice" value=`+ data.responseJSON[i].productPrice + ` >
    <input type="hidden" name="ProductOrigin" value=`+ data.responseJSON[i].productOrigin + `>
    <input type="hidden" name="ProductStock" value=`+ data.responseJSON[i].productStock + `>
    <input type="hidden" name="ProductStatus" value=`+ data.responseJSON[i].productStatus + `>
    <input type="hidden" name="ProductDescription" value=`+ data.responseJSON[i].productDescription + ` >
    <button class="btn bg-gradient-primary mb-0"    onclick="">
     <i class="ni ni-settings"></i>
	</button>
</form>
 </td>
 
 <td>
<form id="deleteProduct`+ data.responseJSON[i].productId + `" action="deleteProductAction" method="post">
    <input type="hidden" name="ProductId" value=`+ data.responseJSON[i].productId + ` >
    <input type="hidden" name="ProductName" value=`+ data.responseJSON[i].productName + ` >
    <input type="hidden" name="ProductCategoryId" value=`+ data.responseJSON[i].productCategoryId + `>
    <input type="hidden" name="productImage" value=`+ data.responseJSON[i].productImage + `>
    <input type="hidden" name="ProductUnit" value=`+ data.responseJSON[i].productUnit + ` >
    <input type="hidden" name="ProductPrice" value=`+ data.responseJSON[i].productPrice + ` >
    <input type="hidden" name="ProductOrigin" value=`+ data.responseJSON[i].productOrigin + `>
    <input type="hidden" name="ProductStock" value=`+ data.responseJSON[i].productStock + `>
    <input type="hidden" name="ProductStatus" value=`+ data.responseJSON[i].productStatus + `>
    <input type="hidden" name="ProductDescription" value=`+ data.responseJSON[i].productDescription + ` >
    <button type="button" class="btn bg-gradient-primary mb-0"  onclick="del(`+ data.responseJSON[i].productId + `)">
    	<i class="ni ni-scissors" ></i>
    	</button>
</form>
</td>
  
</tr>`;

				$("#total").append(content1 + productCategoryId + content2 + productStatus + content3);
			 }



        }

    });
});
})











$(function () {
    $(".nav-link-2").click(function () {
        var productCategoryId = $(this).attr("value");
        var str = $(this).text();
        console.log(productCategoryId)
        console.log(str)
        
        $.ajax({
            url: 'productCategoryAjax/' + productCategoryId,
            dataType: 'json',
            complete: function (data) {
            	$("#total").empty("");
                console.log(JSON.stringify(data));
                var content = "";
               
                var productStatus = "";
                for (let i = 0; i < data.responseJSON.length; i++) {

                    productStatus = data.responseJSON[i].productStatus
                    if (productStatus == 0) {
                    	productStatus = "未上架";
					} else if (productStatus==1) {
						productStatus = "上架中";
					} else {
						productStatus = "無法辨別";
					}
                    console.log(productStatus);
                    
                    content1 =
                        `
                        
            
            <tr>
	          <td>
	            <div class="d-flex px-2 py-1">
	         <input type="hidden" name="productId" value="`+ data.responseJSON[i].productId + `">
	              <div>
	<!--        照片位置         -->
	              <img src="`+ data.responseJSON[i].productImage + `"  width="80px" border-radius="15px" margin="20px auto">
	              </div>
	               &nbsp;&ensp;
	              <div class="d-flex flex-column justify-content-center">
	              <a href="productDetail?ProductId=`+data.responseJSON[i].productId+ `">  
	              <h6 class="mb-0 text-s">`+ data.responseJSON[i].productName + `</h6> </a>
	                <p class="text-xs text-secondary mb-0" >
	                `
	                
                    
	                
	                
	                content2=
					`
	                </p>
	              </div>
	            </div>
	            
	          </td>
	          <td class="align-middle text-center">
	          <span class="text-secondary text-xs font-weight-bold">`+ data.responseJSON[i].productUnit + `</span>
	          <!--可以顯示上下兩格的表格
	            <p class="text-xs font-weight-bold mb-0">Manager</p>
	            <p class="text-xs text-secondary mb-0">Organization</p>
	            -->
	          </td>
	          
	          <td class="align-middle text-center">
	            <span class="text-secondary text-xs font-weight-bold">`+ data.responseJSON[i].productPrice + `</span>
	          </td>
	          <td class="align-middle text-center">
	            <span class="text-secondary text-xs font-weight-bold">`+ data.responseJSON[i].productOrigin + `</span>
	          </td>
	          <td class="align-middle text-center">
	            <span class="text-secondary text-xs font-weight-bold">`+ data.responseJSON[i].productStock + `</span>
	          </td>
	          <td class="align-middle text-center">
	            <span class="text-secondary text-xs font-weight-bold">
	            `
	            
				
	            content3=
	            	
	            `</span>
	          </td>
	           <td class="align-middle text-center" >
	            <span class="text-secondary text-xs font-weight-bold" >`+ data.responseJSON[i].productDescription + `</span>
	          </td>
	          
	          
	          
	          
	          
	          <td>
			 <form  action="updateProduct" method="post">
	            <input type="hidden" name="ProductId" value=`+ data.responseJSON[i].productId + ` >
	            <input type="hidden" name="ProductName" value=`+ data.responseJSON[i].productName + ` >
	            <input type="hidden" name="ProductCategoryId" value=`+ data.responseJSON[i].productCategoryId + `>
	            <input type="hidden" name="productImage" value=`+ data.responseJSON[i].productImage + `>
	            <input type="hidden" name="ProductUnit" value=`+ data.responseJSON[i].productUnit + ` >
	            <input type="hidden" name="ProductPrice" value=`+ data.responseJSON[i].productPrice + ` >
	            <input type="hidden" name="ProductOrigin" value=`+ data.responseJSON[i].productOrigin + `>
	            <input type="hidden" name="ProductStock" value=`+ data.responseJSON[i].productStock + `>
	            <input type="hidden" name="ProductStatus" value=`+ data.responseJSON[i].productStatus + `>
	            <input type="hidden" name="ProductDescription" value=`+ data.responseJSON[i].productDescription + ` >
	            <button class="btn bg-gradient-primary mb-0"    onclick="">
	             <i class="ni ni-settings"></i>
	     	</button>
	        </form>
	         </td>
	         
	         <td>
	        <form id="deleteProduct`+ data.responseJSON[i].productId + `" action="deleteProductAction" method="post">
                <input type="hidden" name="ProductId" value=`+ data.responseJSON[i].productId + ` >
	            <input type="hidden" name="ProductName" value=`+ data.responseJSON[i].productName + ` >
	            <input type="hidden" name="ProductCategoryId" value=`+ data.responseJSON[i].productCategoryId + `>
	            <input type="hidden" name="productImage" value=`+ data.responseJSON[i].productImage + `>
	            <input type="hidden" name="ProductUnit" value=`+ data.responseJSON[i].productUnit + ` >
	            <input type="hidden" name="ProductPrice" value=`+ data.responseJSON[i].productPrice + ` >
	            <input type="hidden" name="ProductOrigin" value=`+ data.responseJSON[i].productOrigin + `>
	            <input type="hidden" name="ProductStock" value=`+ data.responseJSON[i].productStock + `>
	            <input type="hidden" name="ProductStatus" value=`+ data.responseJSON[i].productStatus + `>
	            <input type="hidden" name="ProductDescription" value=`+ data.responseJSON[i].productDescription + ` >
	            <button type="button" class="btn bg-gradient-primary mb-0"  onclick="del(`+ data.responseJSON[i].productId + `)">
	            	<i class="ni ni-scissors" ></i>
	            	</button>
	        </form>
	        </td>
	          
	        </tr>`;

                    $("#total").append(content1 + str + content2 + productStatus + content3 );
                }



            }

        });
    });
})
      </script>  
</head>

<!-- 收藏的按鈕 -->
<!--             <td> -->
<!-- 			 <form  action="likeProduct" method="get"> -->
<!-- 	            <input type="hidden" name="ProductId" value=`+ data.responseJSON[i].productId + ` > -->
<!-- 	            <button class="btn bg-gradient-primary mb-0"    onclick=""> -->
<!-- 	             <i class="ni ni-basket"></i> -->
<!-- 	     	</button> -->
<!-- 	        </form> -->
<!-- 	         </td> -->

<body class="g-sidenav-show   bg-gray-100">


		
	<!-- ////////////////// 介面最外層框架 //////////////////-->
	<div class="min-height-300 bg-dark position-absolute w-100"></div>
	<!-- ////////////////// Side Navber (開始) //////////////////-->
	<%@include file="../includes/eSidenavAdmin.jsp"%>
	<!-- ////////////////// Side Navber (結束) //////////////////-->
	<!-- //////////////////主畫面框架(開始) ////////////////// -->
	<main class="main-content position-relative border-radius-lg ">
		<!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->
<!-- ////////////////// 個人主文開始 //////////////////-->

<%-- <% session.setAttribute("userId", 1003); %> --%>


<fieldset>
	<div class="card">
	<form action="exportcsv" method="post">
	<button  class="btn btn-default" onclick="action" style="float:right;    margin: 10px; " >輸出檔案</button>
     </form>
     
	<h5 ALIGN=CENTER>商品列表</h5>
	  <br>
	
     
	<div class="nav-wrapper position-relative end-0">
   <ul class="nav nav-pills nav-fill p-1" role="tablist">
   <li class="nav-item">
         <a id="all" class="nav-link-1 mb-0 px-0 py-1 active"     role="tab" aria-controls="profile" aria-selected="true" value="">
         搜全部
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link-2 mb-0 px-0 py-1 active"   role="tab" aria-controls="profile" aria-selected="true"  value="1">
         五穀根莖類
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link-2 mb-0 px-0 py-1 active"    role="tab" aria-controls="dashboard" aria-selected="false"  value="2">
         奶類
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link-2 mb-0 px-0 py-1 active"   role="tab" aria-controls="dashboard" aria-selected="false"  value="3">
         蛋豆魚肉類
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link-2 mb-0 px-0 py-1 active"  role="tab" aria-controls="dashboard" aria-selected="false"  value="4">
         蔬菜類
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link-2 mb-0 px-0 py-1 active"   role="tab" aria-controls="dashboard" aria-selected="false"  value="5">
         水果類
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link-2 mb-0 px-0 py-1 active"   role="tab" aria-controls="dashboard" aria-selected="false"  value="6">
         油脂與堅果種子類
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link-2 mb-0 px-0 py-1 active"   role="tab" aria-controls="dashboard" aria-selected="false"  value="7">
         調味品類
         </a>
      </li>
    </ul>
</div>



<!-- 	<div class="input-group " > -->
<!--           <input type="search" class="light-table-filter" data-table="table align-items-center mb-0" class="form-control" placeholder="請輸入關鍵字" type="text" > -->
<!--           <span class="input-group-text"><i class="ni ni-zoom-split-in"></i></span> -->
<!--         </div> -->

        <div class="col-md-12">
        <div class="form-group">
					<div class="input-group input-group-alternative mb-0">
						<span class="input-group-text"><i
							class="ni ni-zoom-split-in"></i></span> <input type="search"
							class="light-table-filter form-control" data-table="table align-items-center mb-0"
							placeholder="請輸入關鍵字">
					</div>
				</div>
	</div>

	
<!-- 	下拉式選單 -->
<!-- 	<div class="dropdown"> -->
<!--   <button class="btn bg-gradient-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false"> -->
<!--     Primary -->
<!--   </button> -->
<!--   <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton"> -->
<!--     <li><a class="dropdown-item" href="#">搜全部</a></li> -->
<!--     <li><a class="dropdown-item" href="#">五穀根莖類</a></li> -->
<!--     <li><a class="dropdown-item" href="#">奶類</a></li> -->
<!--     <li><a class="dropdown-item" href="#">奶類</a></li> -->
<!--     <li><a class="dropdown-item" href="#">奶類</a></li> -->
<!--     <li><a class="dropdown-item" href="#">奶類</a></li> -->
<!--     <li><a class="dropdown-item" href="#">奶類</a></li> -->
<!--   </ul> -->
<!-- </div> -->
	
	
  <div class="table-responsive">
    <table class="table align-items-center mb-0">
    
    	<colgroup>
              <col width="5%">
              <col width="10%">
              <col width="5%">
              <col width="5%">
              <col width="5%">
              <col width="5%">
              <col width="5%">
              <col width="10%">
              <col width="10%">
            </colgroup>
    
      <thead>
        <tr>
          <th class="text-uppercase text-secondary text-s font-weight-bolder opacity-7 ">商品/類別</th>
          <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">單位</th>
          <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">價格</th>
          <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">產地</th>
          <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">庫存</th>
          <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">上架狀態</th>
          <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">商品描述</th>
          <th colspan="3" class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">操作</th>
        </tr>
      </thead>
     
     <tbody id="total">
     <colgroup>
              <col width="15px">
              <col width="5px">
              <col width="5px">
              <col width="5px">
              <col width="5px">
              <col width="5px">
              <col width="10px">
              <col width="5px">
              <col width="5px">
            </colgroup>
     
     
     
     </tbody>
     
     
     
     
    </table>
</div>
</fieldset>

<script type="text/javascript">

function del(i) {
	Swal.fire({
	  title: '確定要刪除?',
	  text: '將無法回復',
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'delete'
	})
	.then((result) => {
		if(result.isConfirmed){
	    Swal.fire(
	      '已刪除!',
	      '商品已從資料庫移除!',
	      'success'
	    )
		.then((result) => {
	  	  $("#deleteProduct"+i).submit();
		})
	}
		})
	}	

</script>

<!-- ////////////////// 個人主文結束 //////////////////-->
		<!--////////////////// Footer(開始) //////////////////-->
		<%@include file="../includes/eFooter.jsp"%>
		<!-- ////////////////// Footer(結束) //////////////////-->

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
		      var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
		      Arr.forEach.call(tables, function(table) {
		        Arr.forEach.call(table.tBodies, function(tbody) {
		          Arr.forEach.call(tbody.rows, _filter);
		        });
		      });
		    }

		    // 資料篩選函數，顯示包含關鍵字的列，其餘隱藏
		    function _filter(row) {
		      var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
		      row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
		    }

		    return {
		      // 初始化函數
		      init: function() {
		        var inputs = document.getElementsByClassName('light-table-filter');
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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>































</body>

</html>