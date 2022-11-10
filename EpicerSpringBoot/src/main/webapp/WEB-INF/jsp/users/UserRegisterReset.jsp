<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RegisterFrom</title>
    <link rel="stylesheet" href="css/RegisterFrom.css">
</head>
<body style="background-color: antiquewhite">
<%@ include file="../frontincludes/epicerNavbar.jsp" %>
    <div class="container">
<div class="title">RegisterForm</div>
<form action="check" method="post">
<div class="userdetail">
    <div class="inputbox">
        <span class="detail">Password</span>
         <input type="text" id="password" name="password" value='${user.getPassword()}' required>
        <span id="sp5" class="msg"></span><span class="msg">${show.password.getMessage()}</span>
    </div>
    <div class="inputbox">
        <span class="detail">Address</span>
         <input type="text" id="road" name="road" value='${user.getAddress()}' required>
        <span id="sp9" class="msg"></span><span class="msg">${show.address.getMessage()}</span>
    </div>
    <div class="inputbox">
        <span class="detail">Account</span>
       <input type="text" id="account" name="account" value='${user.getAccount()}' required>
        <span id="sp4" class="msg"></span><span class="msg">${account.getMessage()}</span>
    </div>
    <div class="inputbox">
        <span class="detail">City</span>
        <div class="twzipcode"></div>
        <span id="sp7" class="msg"></span>
         <span id="sp8" class="msg"></span><input type="hidden" id="ann" value="${user.getTownship()}" />
    </div>
    <div class="inputbox">
        <span class="detail">Birth</span>
        <input type="date" id="birth" name="birth" required value="${birth}">
        <span id="sp3" class="msg"></span><span class="msg">${show.birth.getMessage()}</span>
    </div>
    <div class="inputbox">
        <span class="detail">Phone</span>
         <input type="text" id="phone" name="phone" value='${user.getPhone()}' required>
        <span id="sp6" class="msg"></span><span class="msg">${show.phone.getMessage()}</span>
    </div>
  
    <div class="inputbox">
        <span class="detail">Name</span>
         <input type="text" id="name" name="name" value='${user.getName()}' required>
        <span id="sp1" class="msg"></span><span class="msg">${show.name.getMessage()}</span>
    </div>
</div>
<div class="genderdetail">
    <input type="radio" name="gender" id="dot-1" value="0">
    <input type="radio" name="gender" id="dot-2" value="1">
    <input type="radio" name="gender" id="dot-3" value="2">
<span class="gendertitle">Gender</span>
<div class="category">
<label for="dot-1">
<span class="dot one"></span>
<span class="gender">Male</span>
</label>
<label for="dot-2">
    <span class="dot two"></span>
    <span class="gender">Female</span>
    </label>
    <label for="dot-3">
        <span class="dot three"></span>
        <span class="gender">None</span>
        </label>
</div>
</div>
<span id="sp2" class="msg"></span><span class="msg">${show.gender.getMessage()}</span>
<div class="button">
    <input type="submit" value="Send">
</div>
</form>
    </div>
    <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="js/Register.js"></script>
<script type="text/javascript" src="js/test.js"></script>
  <script>
    $(function(){
    	
    	
    	
    	 const twzipcode = new TWzipcode(".twzipcode");
    	  $('#action').on('click',function(){
    	let target = $("#ann").val();
    	twzipcode.set({
		    'district': target
		});
    	  });
    	 
  
//-----------------------------------------------------------------------------------------------------------------//      	
        //for 一鍵輸入
         $('#action').on("blur",function(){        	 
            checkName();
            checkGender();
            checkAge();
            checkAccount();
            checkPassword();
            checkPhone();
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
         function selectcity() {
         let county = twzipcode.get('county');
          if(typeof county === "string"){
              if(county == null || county ==""){
            	  var msg= "居住城市必填";
                  $('#sp7').text(msg);
        }else{
          var msg= "OK";
              $('#sp7').text(msg);
        }
        }
          */
//-----------------------------------------------------------------------------------------------------------------//  
        //居住區域必填 非空  觸發 onblur onsubmit
        $('#township').on('blur',function(){
            checkTownship()
        });
        
        function checkTownship(){
            let township = $('#township').val()
            if(typeof township ==="string"){
                if(township == null  || township == "" ){
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