<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Line Chart</div>
					<div class="panel-body">
						<div class="canvas-wrapper">
							<canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Bar Chart</div>
					<div class="panel-body">
						<div class="canvas-wrapper">
							<canvas class="main-chart" id="bar-chart" height="200" width="600"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->		
		
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">Pie Chart</div>
					<div class="panel-body">
						<div class="canvas-wrapper">
							<canvas class="chart" id="pie-chart" ></canvas>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">Doughnut Chart</div>
					<div class="panel-body">
						<div class="canvas-wrapper">
							<canvas class="chart" id="doughnut-chart" ></canvas>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Label:</h4>
						<div class="easypiechart" id="easypiechart-blue" data-percent="92" ><span class="percent">92%</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Label:</h4>
						<div class="easypiechart" id="easypiechart-orange" data-percent="65" ><span class="percent">65%</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Label:</h4>
						<div class="easypiechart" id="easypiechart-teal" data-percent="56" ><span class="percent">56%</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Label:</h4>
						<div class="easypiechart" id="easypiechart-red" data-percent="27" ><span class="percent">27%</span>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
<script src="js/jquery-3.6.0.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart-data.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script>
		!function ($) {
		    $(document).on("click","ul.nav li.parent > a > span.icon", function(){          
		        $(this).find('em:first').toggleClass("glyphicon-minus");      
		    }); 
		    $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	
<script>
$(function(){
	
	queryGender(); //性別比
	queryAge();  //年齡層
	queryCity();
	
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
	

	

}); //底
</script>
</body>
</html>
