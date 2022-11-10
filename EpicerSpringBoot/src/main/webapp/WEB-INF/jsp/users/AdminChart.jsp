<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer Admin System</title>

<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLindHead (結束) -->
<style>
table{
text-align: center;
margin-left:150px;
background: white;
border: 1px solid transparent;
border-radius: 5px;

}



.popup-overlay {
visibility:hidden;
}

.popup-content {
visibility:hidden;
}


.popup-overlay.active{
visibility:visible;
}

.popup-content.active {
visibility:visible;
}


.flip-card {
  background-color: transparent;
  width: 250px;
  height: 150px;
  margin-top:50px;
  margin-bottom: 50px
}

/* This container is needed to position the front and back side */
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
}


/* Position the front and back side */
.flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
   opacity: 0.9;
  text-align: center
}

/* Style the front side (fallback if image is missing) */

/* Style the back side */
.flip-card-back {
  background-color: white;
  color: black;
  opacity: 0.9;
  text-align: center
}

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
	<%@include file="../includes/eSidenavAdmin.jsp"%>
	<!-- ////////////////// Side Navber (結束) //////////////////-->
	<!-- //////////////////主畫面框架(開始) ////////////////// -->
	<main class="main-content position-relative border-radius-lg ">
		<!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->
<!-- ////////////////// 個人主文開始 //////////////////-->

	<fieldset>	
<div class="container-fluid py-4">
      <div class="row">
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">總註冊人數</p>
                    <h5 class="font-weight-bolder" id="p1" >
                      $53,000
                    </h5>
                    <p class="mb-0">
                      <span class="text-success text-sm font-weight-bolder">+55%</span><br>
                      相較於昨日
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
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">今日登入人數</p>
                    <h5 class="font-weight-bolder" id="p2">
                      2,300
                    </h5>
                    <p class="mb-0">
                      <span class="text-success text-sm font-weight-bolder">+3%</span><br>
                      相較於昨日
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
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">昨日登入人數</p>
                    <h5 class="font-weight-bolder" id="p3">
                      +3,462
                    </h5>
                    <p class="mb-0">
                      <span class="text-danger text-sm font-weight-bolder">-2%</span><br>
                      相較於今日
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
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">今日訂單數</p>
                    <h5 class="font-weight-bolder">
                      150 筆
                    </h5>
                    <p class="mb-0">
                      <span class="text-success text-sm font-weight-bolder">+5%</span><br>
                      相較於昨日
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
              <h6 class="text-capitalize">年齡比例圖</h6>
              <p class="text-sm mb-0">
                <i class="fa fa-arrow-up text-success"></i>
                <span class="font-weight-bold">更新</span> 於 2022/10/01
              </p>
            </div>
            <div class="card-body p-3">
              <div class="chart">
              <canvas id="myChart2" class="chart-canvas" height="200"></canvas>
               <!-- <canvas id="chart-line" class="chart-canvas" height="300"></canvas>  --> 
              </div>
            </div>
          </div>
        </div>
        
 <div class="col-lg-5">
<div class="card">
<div class="card-header bg-transparent">
<div class="row align-items-center">
<div class="col">
<h6 class="text-uppercase text-muted ls-1 mb-1">性別比例圖</h6>
 <i class="fa fa-arrow-up text-success"></i>
<span class="font-weight-bold">更新</span> 於 2022/10/01
</div>
</div>
</div>
<div class="card-body">
<div class="chart">
<canvas id="myChart" class="chart-canvas"></canvas>
</div>
</div>
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
              <h6 class="text-capitalize">地區分布圖</h6>
              <p class="text-sm mb-0">
                <i class="fa fa-arrow-up text-success"></i>
                <span class="font-weight-bold">更新</span> 於 2022/10/01
              </p>
            </div>
            <div class="card-body p-3">
              <div class="chart">
              <canvas id="myChart3" class="chart-canvas" height="200"></canvas>
               <!-- <canvas id="chart-line" class="chart-canvas" height="300"></canvas>  --> 
              </div>
            </div>
          </div>
        </div>

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
	
<script src="js/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<script>
$(function(){
	
	/***********************************************************************/		
	queryGender(); //性別比
	queryAge();  //年齡層
	queryCity(); //區域
	queryUserAmount();
	queryLoginAmount();
	queryKinoLoginAmount();
	
	/*******************************昨日登錄人數****************************************/	
	function queryKinoLoginAmount(){
		$.ajax({
			  type:"POST",
			  url:'/kinologinamount',
			  contentType:'application/json',
		       //data:JSON.stringify(user),
			  success:function(res){
		    var today =new Date().getTime();
		    var kinou = today-(24*60*60*1000);
		    var yester = new Date(kinou);
			console.log('這xu3dsdsd'+res);
		     $('#p3').html(res+'人');
		     $('#d2').html(yester.toLocaleString( ))
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax		
	}
	/*******************************今日登錄人數****************************************/		
	function queryLoginAmount(){
		$.ajax({
			  type:"POST",
			  url:'/loginamount',
			  contentType:'application/json',
		       //data:JSON.stringify(user),
			  success:function(res){
				  console.log('這xu3'+res);
		     $('#p2').html(res+'人');
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax		
	}
	/*******************************總註冊人數/singupamount"****************************************/	
	function queryUserAmount(){
		$.ajax({
			  type:"POST",
			  url:'/usersamount',
			  contentType:'application/json',
		       //data:JSON.stringify(user),
			  success:function(res){
			console.log('這'+res);
		    var date = new Date();
		     $('#p1').html(res+'人');
		     $('.d1').html(date.toLocaleString( ));
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax		
	}
	/*******************************區域****************************************/	
	function queryCity(){
		
		$.ajax({
			  type:"GET",
			  url:"/city",
			  contentType:'application/json',
		       //data:JSON.stringify(user),
			  success:function(res){
				  console.log(res);
		       console.log(res.north);
		       
		       
		       const data = {
		 			  labels: [
		 			    '北部(基隆市、臺北市、新北市、桃園市、新竹市、新竹縣)',
		 			    '中部(苗栗縣、臺中市、彰化縣、南投縣、雲林縣)',
		 			    '南部(嘉義市、嘉義縣、臺南市、高雄市)',
		 			    '東部(屏東縣、臺東縣、花蓮縣、宜蘭縣)',
		 			    '離島(澎湖縣、金門縣、連江縣)'
		 			  ],
		 			  datasets: [{
		 			    label: '居住地分布',
		 			    data: [res.north, res.center,res.south, res.east, res.island],
		 			    backgroundColor: [
		 			      'rgb(255, 99, 132)',
		 			      'rgb(75, 192, 192)',
		 			      'rgb(255, 205, 86)',
		 			      'rgb(201, 203, 207)',
		 			      'rgb(54, 162, 235)'
		 			    ]
		 			  }]
		 			};
		 	
		 	
		 	
		 	new Chart("myChart3", {
		 			  type: 'polarArea',
		 			  data: data,
		 			  options: {}
		 			});
		       
		       
		     
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax	
	}
	
	/*******************************年齡****************************************/	
	
	function queryAge(){
		$.ajax({
			  type:"GET",
			  url:"/age",
			  contentType:'application/json',
		       //data:JSON.stringify(user),
			  success:function(res){
				  console.log(res);
		       console.log(res.sixty);
		       var eighteen =res.eighteen
		       var twenty =res.ninteen
		       var fourty =res.fourty
		       var fifty =res.fivty
		       var sixty =res.sixty
		       
		   	const data = {
		    			  labels:  ['18~28歲', '29~39歲', '40~50歲', '51~61歲', '61歲以上'],
		    			  datasets: [{
		    			    axis: 'y',
		    			    label: '該年齡人數',
		    			    data: [ eighteen, twenty, fourty, fifty, sixty],
		    			    fill: false,
		    			    backgroundColor: [
		    			      'rgba(255, 99, 132, 0.2)',
		    			      'rgba(255, 159, 64, 0.2)',
		    			      'rgba(255, 205, 86, 0.2)',
		    			      'rgba(75, 192, 192, 0.2)',
		    			      'rgba(54, 162, 235, 0.2)',
		    			    ],
		    			    borderColor: [
		    			      'rgb(255, 99, 132)',
		    			      'rgb(255, 159, 64)',
		    			      'rgb(255, 205, 86)',
		    			      'rgb(75, 192, 192)',
		    			      'rgb(54, 162, 235)',
		    			    ],
		    			    borderWidth: 1
		    			  }]
		    			};

		    			
		    			
		    			new Chart("myChart2",  {
		    				  type: 'bar',
		    				  data,
		    				  options: {
		    				    indexAxis: 'y',
		    				  }
		    				});
		       
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax	
	}
	
	/*********************************性別**************************************/
	
	function queryGender(){	
		var user = 0;
		$.ajax({
			  type:"GET",
			  url:"/gender",
			  contentType:'application/json',
		       //data:JSON.stringify(user),
			  success:function(res){
				 var male = res.code;
				 var female =res.object;
				 console.log(male)
				 
				 	 const data = {
				  labels: [
				    '女性',
					 '男性', 
				  ],
				  datasets: [{
				    label: '用戶性別比',
				    data: [female, male,],
				    backgroundColor: [
				      'rgb(255, 99, 132)',
				      'rgb(54, 162, 235)',
				    ],
				    hoverOffset: 4
				  }]
				};

		new Chart("myChart", {
			  type: 'doughnut',
			  data: data,
		})
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax
	}
	
	/**********************************各個選項*************************************/	
	
	$('#chose').on('change',function(){
		var chose= $('#chose').val();
		console.log(chose);
		if(chose==1){
			$( ".age" ).remove();
			$( ".city" ).remove();
			$('#append').append('<option class="gender" value="male">男性</option><option class="gender" value="female">女性</option>');	
			return;
		}else if(chose==2){
			$( ".gender" ).remove();
			$( ".city" ).remove();
			$('#append').append('<option class="age" value="eighteen">18-28歲</option><option class="age" value="twenty">29-39歲</option><option class="age" value="fourty">40-50歲</option><option class="age" value="fifty">51-61歲</option><option class="age" value="sixty">61歲以上</option>');		
		return;
		}else{
			$( ".age" ).remove();
			$( ".gender" ).remove();
			$('#append').append('<option class="city" value="north">北部</option><option class="city" value="center">中部</option><option class="city" value="south">南部</option><option class="city" value="east">東部</option><option class="city" value="island">離島</option>');	
			return;
		}
	}); //change

	/*********************************查詢分流**************************************/	
	$('#preview').on('click',function(){
		var chose = $('#chose').val()
		console.log(chose)
		if(chose==1){
			genderPreview();
		}else if (chose==2){
			genderPreview();
		}else{
			genderPreview();
		}
	})
	
	
	/*********************************年齡預覽*************************************/
	

	
	
	
/***********************************性別預覽************************************/	
	function genderPreview(){
		$(".popup, .popup-content").addClass("active");
		var app = $('#append').val()
		console.log(app);
		$.ajax({
			  type:"PUT",
			  url:"/gendertable",
			  contentType:'application/json',
		      data:app,
			  success:function(res){
				 resulttext=""
				console.log(res)
				var d = new Date(res[0].birth).toLocaleDateString();
				 console.log(d)
				for(let i=0;i<res.length;i++){
					
					var strd = new Date(res[i].birth).toLocaleDateString();
					var strl = new Date(res[i].logindate).toLocaleDateString();
					
					var strgender =""
					if(res[i].gender=='1'){
						strgender ="男"
					}else{
						strgender ="女"
					}
					
					
					var desstatus=""
					if(res[i].status =='0'){
						desstatus="管理者"
					}else if(res[i].status =='1'){
						desstatus="一般會員"
					}else if(res[i].status =='3'){
						desstatus="臨時會員"
					}else{
						desstatus="已停權"
					}
					
					var row=
					'<tr>'
					+'<td>'+res[i].id+'</td>'
					+'<td>'+desstatus+'</td>'
					+'<td>'+res[i].name+'</td>'
					+'<td>'+strgender+'</td>'
					+'<td>'+res[i].account+'</td>'
					+'<td>'+strd+'</td>'
					+'<td>'+res[i].phone+'</td>'
					+'<td>'+res[i].address+'</td>'
					+'<td>'+strl+'</td>'
					+'<td>'+" "+'</td>'
					+'</tr>'
					resulttext+=row;
				}
                   var table='<table id="previewtable" class="table align-items-center mb-0">'				 
				 
				$('.popup-content').append(table+'<tr><th>ID</th> <th>權限</th> <th>姓名</th> <th>性別</th> <th>帳號</th> <th>出生/年/月/日</th>  <th>聯絡電話</th><th>完整地址</th> <th>上次登錄</th> <th>備註</th> </tr>'+resulttext+'</table>');
				$('.popup-content').css("display", "block");
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax
	}
	
/********************************彈跳視窗***************************************/
	
	$(".close, .popup").on("click", function(){
		$('#previewtable').remove();
		$(".popup, .popup-content").removeClass("active");
		});//click
	
	
/*******************************匯出檔案****************************************/	
	$('#append').on("change", function(){
		var a = $('#append').val();
		console.log(a);
		var url='http://localhost:8091/exportcsv/'+a
		var exportcsv='<a href="'+url+'"><button class="btn btn-default">匯出CSV</button></a>'
	    $('#export').html(exportcsv)
		console.log(exportcsv);
		})//click
}); //底
</script>
</body>

</html>