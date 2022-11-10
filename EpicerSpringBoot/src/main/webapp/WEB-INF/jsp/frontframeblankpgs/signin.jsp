<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- //////  會員登入畫面 ////// -->    

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
<style>
.msg{
color:red;
font-weight:bold

}

select{
	border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: gray;
  background-color:#fff;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 12px;
   border: 1px solid #ccc;
}


</style>
</head>
<body id="body">


<!-- 主文內容 開始 -->
<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
          <a class="logo" href="index.html">
            <img src="images/logo.png" alt="" style="width:300px">
          </a>
          <h2 class="text-center">建立您的帳戶</h2>
          <form class="text-left clearfix" action="check" method="post">
            <div class="form-group">
              <input type="text" id="name" name="name" class="form-control"  placeholder="姓名" required>
               <span id="sp1" class="msg"></span>
            </div>
             <div class="form-group" style="text-align: center">
              <input type="radio" name="gender"  value="0" required>男性
               <input type="radio" name="gender"  value="1">女性<br>
               <span id="sp2" class="msg"></span>
            </div>
            <div class="form-group">
              <input input type="date" id="birth" name="birth"  class="form-control"  placeholder="出生年月日" required>
              <span id="sp3" class="msg"></span>
            </div>
            <div class="form-group">
              <input type="email" id="account" name="account" class="form-control"  placeholder="信箱" required>
               <span id="sp4" class="msg"></span>
            </div>
            <div class="form-group">
              <input type="text"  id="password" name="password" placeholder="密碼" class="form-control"  required>
              <span id="sp5" class="msg"></span>
            </div>
            <div class="form-group">
              <input type="text" id="phone" name="phone" class="form-control"  placeholder="連絡電話" required>
               <span id="sp6" class="msg"></span>
            </div>
            <div class="form-group">
              <div class="twzipcode" id="container"></div>
                 <span id="sp7" class="msg"></span><br>
         <span id="sp8" class="msg"></span>
            </div>
            <div class="form-group">
              <input type="text" id="road" name="road"  class="form-control"  placeholder="完整地址" required>
               <span id="sp9" class="msg"></span>
            </div>
            
            
            
            
            <div class="text-center">
              <button type="submit" id="commit" class="btn btn-main text-center">送出</button>
            </div>
          </form>
          <p class="mt-20">會員<a href="userloginform">登錄</a></p>
          <p><a href="forgetpassword">忘記密碼</a></p>
        </div>
      </div>
    </div>
  </div>
</section>

<button id="mistake" class="btn btn-danger">一鍵輸入</button>
<button id="correct" class="btn btn-primary">一鍵輸入2</button>
<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>
 <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="js/Register.js"></script>
<script type="text/javascript" src="js/test.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
 <script>
    $(function(){
    	
    	 const twzipcode = new TWzipcode(".twzipcode");
    	 
    	 
    	 /*
    		$('#commit').on('click',function(){
    			checkName();
    			 checkGender();
    			  checkAge();
    			  checkAccount();
    			 checkPassword();
    			 checkPhone();
    			selectcity();
    		checkTownship();
    		checkRoad();
    		
    		})
    		*/
    	
    	 
    	 //一鍵輸入
    	  $('#correct').on('click',function(){
    		  $('#name').attr("value","蘇逢時"); 
    		  $("#birth").attr("value","1992-05-25"); 
    		  $('#account').attr("value","epicer2022@gmail.com");
    		  $('#password').attr("value","asdf1234");
    		  $('#phone').attr("value","0903060859");
    		  twzipcode.set({
    			    'county': '臺中市',
    			    'district': '太平區'
    			});
    		  
    		  let county = twzipcode.get('county');
    		  let district = twzipcode.get('district');
    		  $('#road').attr("value",county+district);
        	
    	  });
    	 
    	  $('#mistake').on('click',function(){
    		  $('#name').attr("value","Tommy"); 
    		  $("#birth").attr("value","2022-05-25"); 
    		  $('#account').attr("value","epicer2022你好啊");
    		  $('#password').attr("value","asdfah");
    		  $('#phone').attr("value","0903060859#AB");
   
        	
    	  });
    	 
    	 
    	 
    	 
//-----------------------------------------------------------------------------------------------------------------//      	
        //for 一鍵輸入
         $('#mistake').on("blur",function(){        	 
        	 checkName();
			 checkGender();
			  checkAge();
			  checkAccount();
			 checkPassword();
			 checkPhone();
			selectcity();
		checkTownship();
		checkRoad();
         });
         
         $('#correct').on("blur",function(){        	 
        	 checkName();
			 checkGender();
			  checkAge();
			  checkAccount();
			 checkPassword();
			 checkPhone();
			selectcity();
		checkTownship();
		checkRoad();
         });
//-----------------------------------------------------------------------------------------------------------------//         
        //檢查姓名
             $('#name').on('blur',function(){
            checkName()
        });
        
        function checkName(){
            let name =$('#name').val()
            if(typeof name ==="string"){
                if (name == null || name ==""){
                    var msg="姓名必須填寫";
                    $('#sp1').text(msg)
                    return false;
                }else{ //非空
         var eng =new RegExp("[A-Za-z]+");
         var num =new RegExp("[0-9]+"); 
                if(eng.test(name)|| num.test(name)){ //是否含英數
                    var msg="請輸入中文姓名";
                    $('#sp1').text(msg)
                    return false;
                }else{ 
                    if(name.length >= 2){
                        var msg="ok";
                        $('#sp1').text(msg)
                        return true;
                    }else{
                        var msg="請輸入有效姓名";
                        $('#sp1').text(msg)
                        return false;
                    }
                }
            }
        }else{
            var msg="請輸入有效姓名"; 
            $('#sp1').text(msg)
            return false
        }
        } 
//-----------------------------------------------------------------------------------------------------------------//        
        //性別必填 觸發: onblur/onsubmit
        $("#birth").on('focus',function(){
            checkGender()
        });
        
        function checkGender(){
           var gender =$("input[name='gender']:checked").val(); //radio 取值，注意寫法
           if( typeof gender ==="undefined"){ // 注意檢查完全沒有選取的寫法，這行是精華
           var msg = "性別必填";
           $('#sp2').text(msg);
           return false;
        }else{
            var msg = "ok";
            $('#sp2').text(msg);
            return true;
        }
        }
        
//-----------------------------------------------------------------------------------------------------------------//          
        //確認年齡 須為18歲以上 觸發:onblur/onsubmit
        $('#birth').on('blur',function(){
            checkAge()
        })
        
        
        function checkAge(){
        var datestr =$('#birth').val();
        var year = datestr.split("-")[0];
        var month = datestr.split("-")[1];
        var date = datestr.split("-")[2];
        var datedate = new Date(year,month,date);
        var milli = datedate.getTime();
        var now =new Date().getTime();
        var age =  Math.floor((now-milli)/(365 * 24 * 3600 * 1000))
        if(typeof datestr ==="string"){
        if(datestr == null || datestr ==""){
            var msg="年齡必填"
            $('#sp3').text(msg)
            return false
        }else{
            if(age < 18){
                var msg="年齡需滿18歲"
                $('#sp3').text(msg)
                return false
            }else{
               var msg="ok"
               $('#sp3').text(msg)
               return true
            }
        }
        
        }else{
            var msg="年齡必填"
            $('#sp3').text(msg)
            return false
        }   
        
        }
//-----------------------------------------------------------------------------------------------------------------//          
          //檢查帳號 非空/不能有中文/序列4以上含有'@' 觸發：onblur onsubmit
          $('#account').on('blur', function(){
           checkAccount()
          })
          
          
          
          function checkAccount(){
            let account = $('#account').val()
                    if(typeof account === "string"){
                        if (account ==null || account ==""){
                    var msg = "帳號必須填寫";  
                    $('#sp4').text(msg);  
                    return false
                }else{
                if (account.indexOf("@") > 4){ 
                     var eng =new RegExp("[a-zA-z]"); //要改成有中文不行
                     if(eng.test(account)){
                        var msg="OK";
                        $('#sp4').text(msg);  
                    return true
                    }else{
                    var msg ="請輸入英文字母";
                    $('#sp4').text(msg);  
                    return false
                }
                }else{
                    var msg ="請輸入有效信箱";
                    $('#sp4').text(msg);  
                    return false
                }
            }
        }else{
            var msg ="請輸入有效信箱";
            $('#sp4').text(msg);  
                    return false
        } 
        }
//-----------------------------------------------------------------------------------------------------------------//          
        //檢查密碼 判斷 非空/不能有中文/須為8-16個字 觸發:onblur onsubmit
        $('#password').on('blur',
        function(){
            checkPassword();
        });
        
        function checkPassword(){
            let password = $('#password').val()
                    if(typeof password === "string"){
                        if (password ==null || password ==""){
                    var msg = "密碼必須填寫";  
                    $('#sp5').text(msg);  
                    return false
                }else{
                     var eng =new RegExp("[a-zA-z]"); //要改成有中文不行
                     if(eng.test(password)){
                         if(password.length <=7 || password.length >=17){
                             var msg="密碼須為8至16字含英文數字";  
                             $('#sp5').text(msg);  
                    return false                    
                            }else{
                                var msg="OK ";
                                $('#sp5').text(msg);  
                    return true
                            }
                    }else{
                    var msg ="密碼須為8至16字含英文數字";
                    $('#sp5').text(msg);  
                    return false
                }
        
            }
        } else{
            var msg="密碼須為8至16字含英文數字";  
            $('#sp5').text(msg);  
                    return false   
        }
        }
//-----------------------------------------------------------------------------------------------------------------//          
        //檢查電話  判斷 非空/不能有中文+英文/開頭為09/
        $('#phone').on('blur', function(){
        checkPhone()
        });
        
        function checkPhone(){
                var phone = $('#phone').val();
                if(typeof phone === "string"){
                if(phone == null || phone ==""){
                    var msg="連絡電話必填"
                    $('#sp6').text(msg);
                    return false
                }else{
                    var chinese =new RegExp("[\u4E00-\u9FA5]+");
                    var eng =new RegExp("[A-Za-z]+");
                    if(chinese.test(phone) || eng.test(phone)){
                        var msg = "請輸入有效電話號碼"
                        $('#sp6').text(msg);
                    return false
                    }else{
                        if(phone.indexOf('0') == 0 && phone.indexOf('9') == 1){
                        if(phone.length < 10 || phone.length > 10){
                            var msg = "請輸入有效號碼"   
                            $('#sp6').text(msg);
                    return false
                        }else{
                            var msg = "ok"   
                            $('#sp6').text(msg);
                    return true
                        }
                        }else{
                            var msg = "請輸入手機號碼"  
                            $('#sp6').text(msg);
                    return false
                        }
                    }
                }
                }else{
                    var msg = "請輸入有效電話號碼" 
                    $('#sp6').text(msg);
                    return false  
                }
            }
//-----------------------------------------------------------------------------------------------------------------//          
        //居住城市必填 判斷 必選 觸發 onblur onsubmit
  /*
        $(".twzipcode").on('blur',function(){
	  selectcity();
  });
          */
        	    function selectcity() {
        	        var county = twzipcode.get('county');
        	         if(typeof  county ==="string"){
        	   	 if( county == null  ||  county == "" ){
        	        var msg= "居住城市必填";
        	             $('#sp7').html(msg);
        	             return false;		
        	   	}else{
        	   		  var msg= "ok";
        	             $('#sp7').html(msg);
        	             return true;		
        	   	}
        	   }else {//非字串
        	   	var msg= "居住城市必填";
        	             $('#sp7').html(msg);
        	             return false;	
        	   }
        	       }
//-----------------------------------------------------------------------------------------------------------------//  
        //居住區域必填 非空  觸發 onblur onsubmit
        $('#township').on('blur',function(){
            checkTownship()
        });
        
        function checkTownship(){
        	let district = twzipcode.get('district')
                if(typeof district ==="string"){
                    if(district == null  || district == "" ){
                        var msg ="區域必填";
                        $('#sp8').text(msg)
                        return false
                    }else{
                        var msg ="ok";
                        $('#sp8').text(msg)
                        return true
                    }
                }else{
                    var msg ="區域必填";
                    $('#sp8').text(msg)
                        return false
                }
               
              }
//-----------------------------------------------------------------------------------------------------------------//          
        //居住路段必填 判斷 非空 觸發 onblur onsubmit
         $(".twzipcode").on('change',function(){
          let county = twzipcode.get('county');
   		  let district = twzipcode.get('district');
   		  $('#road').attr("value",county+district);
        });
        
        
        $('#road').on('blur',function(){
        checkRoad()
        selectcity()
        checkTownship()
        
        });
        
        
        function checkRoad(){
            let road = $('#road').val()
            if(typeof road ==="string"){
                if(road == null  || road == "" ){
                    var msg ="路段必填";
                    $('#sp9').text(msg)
                    return false
                }else{
                    var msg ="ok";
                    $('#sp9').text(msg)
                    return true
                }
            }else{
                var msg ="請輸入有效字元";
                $('#sp9').text(msg)
                return false
            }
          
          }
          })
          
    

    

    </script>
</body>
</html>