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
    <button id="action">Input</button>
<div class="title">RegisterForm</div>
<form action="check" method="post">
<div class="userdetail">
    <div class="inputbox">
        <span class="detail">Password</span>
        <input type="text" id="password" name="password" placeholder="password" required>
        <span id="sp5" class="msg"></span>
    </div>
    <div class="inputbox">
        <span class="detail">Address</span>
        <input type="text" id="road" name="road" placeholder="address" required>
        <span id="sp9" class="msg"></span>
    </div>
    <div class="inputbox">
        <span class="detail">Account</span>
        <input type="text" id="account" name="account" placeholder="account" required>
        <span id="sp4" class="msg"></span>
    </div>
    <div class="inputbox">
        <span class="detail">City</span>
        <div class="twzipcode" id="container"></div>
        <span id="sp7" class="msg"></span>
         <span id="sp8" class="msg"></span>
    </div>
    <div class="inputbox">
        <span class="detail">Birth</span>
        <input type="date" id="birth" name="birth" required>
        <span id="sp3" class="msg"></span>
    </div>
    <div class="inputbox">
        <span class="detail">Phone</span>
        <input type="text" id="phone" name="phone" placeholder="phone" required>
        <span id="sp6" class="msg"></span>
    </div>
  
    <div class="inputbox">
        <span class="detail">Name</span>
        <input type="text" id="name" name="name" placeholder="name" style="width:206.5%" required>
        <span id="sp1" class="msg"></span>
    </div>
</div>
<div class="genderdetail">
    <input type="radio" name="gender" class="gender" id="dot-1" value="0">
    <input type="radio" name="gender" class="gender" id="dot-2" value="1">
    <input type="radio" name="gender" class="gender" id="dot-3" value="2">
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
<span id="sp2" class="msg"></span>
<div class="button">
    <input type="submit" value="Send">
</div>
</form>
    </div>
    <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="js/Register.js"></script>
<script type="text/javascript" src="js/test.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>

    <script>
    $(function(){
    	
    	 const twzipcode = new TWzipcode(".twzipcode");
    	
    	 
    	 //????????????
    	  $('#action').on('click',function(){
    		  $('#name').attr("value","?????????"); 
    		  $("#birth").attr("value","1992-05-25"); 
    		  $('#account').attr("value","860102yeah@gmail.com");
    		  $('#password').attr("value","asd123456");
    		  $('#phone').attr("value","0903060859");
    		  twzipcode.set({
    			    'county': '?????????',
    			    'district': '?????????'
    			});
    		  
    		  let county = twzipcode.get('county');
    		  let district = twzipcode.get('district');
    		  $('#road').attr("value",county+district);
        	
    	  });
//-----------------------------------------------------------------------------------------------------------------//      	
        //for ????????????
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
        //????????????
             $('#name').on('blur',function(){
            checkName()
        });
        
        function checkName(){
            let name =$('#name').val()
            if(typeof name ==="string"){
                if (name == null || name ==""){
                    var msg="??????????????????";
                    $('#sp1').text(msg)
                    return false;
                }else{ //??????
         var eng =new RegExp("[A-Za-z]+");
         var num =new RegExp("[0-9]+"); 
                if(eng.test(name)|| num.test(name)){ //???????????????
                    var msg="?????????????????????";
                    $('#sp1').text(msg)
                    return false;
                }else{ 
                    if(name.length >= 2){
                        var msg="ok";
                        $('#sp1').text(msg)
                        return true;
                    }else{
                        var msg="?????????????????????";
                        $('#sp1').text(msg)
                        return false;
                    }
                }
            }
        }else{
            var msg="?????????????????????"; 
            $('#sp1').text(msg)
            return false
        }
        } 
//-----------------------------------------------------------------------------------------------------------------//        
        //???????????? ??????: onblur/onsubmit
        $("#birth").on('focus',function(){
            checkGender()
        });
        
        function checkGender(){
           var gender =$("input[name='gender']:checked").val(); //radio ?????????????????????
           if( typeof gender ==="undefined"){ // ?????????????????????????????????????????????????????????
           var msg = "????????????";
           $('#sp2').text(msg);
           return false;
        }else{
            var msg = "ok";
            $('#sp2').text(msg);
            return true;
        }
        }
        
//-----------------------------------------------------------------------------------------------------------------//          
        //???????????? ??????18????????? ??????:onblur/onsubmit
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
            var msg="????????????"
            $('#sp3').text(msg)
            return false
        }else{
            if(age < 18){
                var msg="????????????18???"
                $('#sp3').text(msg)
                return false
            }else{
               var msg="ok"
               $('#sp3').text(msg)
               return true
            }
        }
        
        }else{
            var msg="????????????"
            $('#sp3').text(msg)
            return false
        }   
        
        }
//-----------------------------------------------------------------------------------------------------------------//          
          //???????????? ??????/???????????????/??????4????????????'@' ?????????onblur onsubmit
          $('#account').on('blur', function(){
           checkAccount()
          })
          
          
          
          function checkAccount(){
            let account = $('#account').val()
                    if(typeof account === "string"){
                        if (account ==null || account ==""){
                    var msg = "??????????????????";  
                    $('#sp4').text(msg);  
                    return false
                }else{
                if (account.indexOf("@") > 4){ 
                     var eng =new RegExp("[a-zA-z]"); //????????????????????????
                     if(eng.test(account)){
                        var msg="OK";
                        $('#sp4').text(msg);  
                    return true
                    }else{
                    var msg ="?????????????????????";
                    $('#sp4').text(msg);  
                    return false
                }
                }else{
                    var msg ="?????????????????????";
                    $('#sp4').text(msg);  
                    return false
                }
            }
        }else{
            var msg ="?????????????????????";
            $('#sp4').text(msg);  
                    return false
        } 
        }
//-----------------------------------------------------------------------------------------------------------------//          
        //???????????? ?????? ??????/???????????????/??????8-16?????? ??????:onblur onsubmit
        $('#password').on('blur',
        function(){
            checkPassword();
        });
        
        function checkPassword(){
            let password = $('#password').val()
                    if(typeof password === "string"){
                        if (password ==null || password ==""){
                    var msg = "??????????????????";  
                    $('#sp5').text(msg);  
                    return false
                }else{
                     var eng =new RegExp("[a-zA-z]"); //????????????????????????
                     if(eng.test(password)){
                         if(password.length <=7 || password.length >=17){
                             var msg="????????????8???16??????????????????";  
                             $('#sp5').text(msg);  
                    return false                    
                            }else{
                                var msg="OK ";
                                $('#sp5').text(msg);  
                    return true
                            }
                    }else{
                    var msg ="????????????8???16??????????????????";
                    $('#sp5').text(msg);  
                    return false
                }
        
            }
        } else{
            var msg="????????????8???16??????????????????";  
            $('#sp5').text(msg);  
                    return false   
        }
        }
//-----------------------------------------------------------------------------------------------------------------//          
        //????????????  ?????? ??????/???????????????+??????/?????????09/
        $('#phone').on('blur', function(){
        checkPhone()
        });
        
        function checkPhone(){
                var phone = $('#phone').val();
                if(typeof phone === "string"){
                if(phone == null || phone ==""){
                    var msg="??????????????????"
                    $('#sp6').text(msg);
                    return false
                }else{
                    var chinese =new RegExp("[\u4E00-\u9FA5]+");
                    var eng =new RegExp("[A-Za-z]+");
                    if(chinese.test(phone) || eng.test(phone)){
                        var msg = "???????????????????????????"
                        $('#sp6').text(msg);
                    return false
                    }else{
                        if(phone.indexOf('0') == 0 && phone.indexOf('9') == 1){
                        if(phone.length < 10 || phone.length > 10){
                            var msg = "?????????????????????"   
                            $('#sp6').text(msg);
                    return false
                        }else{
                            var msg = "ok"   
                            $('#sp6').text(msg);
                    return true
                        }
                        }else{
                            var msg = "?????????????????????"  
                            $('#sp6').text(msg);
                    return false
                        }
                    }
                }
                }else{
                    var msg = "???????????????????????????" 
                    $('#sp6').text(msg);
                    return false  
                }
            }
//-----------------------------------------------------------------------------------------------------------------//          
        //?????????????????? ?????? ?????? ?????? onblur onsubmit
  /*
        $(".twzipcode").on('blur',function(){
	  selectcity();
  });
         function selectcity() {
         let county = twzipcode.get('county');
          if(typeof county === "string"){
              if(county == null || county ==""){
            	  var msg= "??????????????????";
                  $('#sp7').text(msg);
        }else{
          var msg= "OK";
              $('#sp7').text(msg);
        }
        }
          */
//-----------------------------------------------------------------------------------------------------------------//  
        //?????????????????? ??????  ?????? onblur onsubmit
        $('#township').on('blur',function(){
            checkTownship()
        });
        
        function checkTownship(){
            let township = $('#township').val()
            if(typeof township ==="string"){
                if(township == null  || township == "" ){
                    var msg ="????????????";
                    $('#sp8').text(msg)
                    return false
                }else{
                    var msg ="ok";
                    $('#sp8').text(msg)
                    return true
                }
            }else{
                var msg ="????????????";
                $('#sp8').text(msg)
                    return false
            }
          }
//-----------------------------------------------------------------------------------------------------------------//          
        //?????????????????? ?????? ?????? ?????? onblur onsubmit
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
                    var msg ="????????????";
                    $('#sp9').text(msg)
                    return false
                }else{
                    var msg ="ok";
                    $('#sp9').text(msg)
                    return true
                }
            }else{
                var msg ="?????????????????????";
                $('#sp9').text(msg)
                return false
            }
          
          }
          })
    </script>
</body>
</html>