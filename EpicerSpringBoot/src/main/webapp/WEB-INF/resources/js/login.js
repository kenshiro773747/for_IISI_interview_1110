$(function(){ 
	
	
	  $('#account').on('blur', function(){
       checkAccount()
      })
      
      
      function checkAccount(){
        let account = $('#account').val()
                if(typeof account === "string"){
                    if (account ==null || account ==""){
                var msg = "帳號必須填寫";  
                $('#sp1').text(msg);  
                $('#password').prop('disabled',true)
                $('#submit').prop('disabled',true)
                return false
            }else{
            if (account.indexOf("@") > 4){ 
                 var eng =new RegExp("[a-zA-z]"); //要改成有中文不行
                 if(eng.test(account)){
                    var msg="";
                    $('#sp1').text(msg);  
                     $('#password').prop('disabled',false)
                    $('#submit').prop('disabled',false)
                return true
                }else{
                var msg ="帳號為有效信箱";
                $('#sp1').text(msg);  
                 $('#password').prop('disabled',true)
                 $('#submit').prop('disabled',true)
                return false
            }
            }else{
                var msg ="帳號為有效信箱";
                $('#sp1').text(msg);  
                  $('#password').prop('disabled',true)
                 $('#submit').prop('disabled',true)
                return false
            }
        }
    }else{
        var msg ="帳號為有效信箱";
        $('#sp1').text(msg);
          $('#password').prop('disabled',true)
          $('#submit').prop('disabled',true)
                return false
    } 
   }
   
   
   
    $('#password').on('blur',
    function(){
        checkPassword()
    }
    )
    
   
   
    function checkPassword(){
        let password = $('#password').val()
                if(typeof password === "string"){
                    if (password ==null || password ==""){
                var msg = "密碼必須填寫";  
                $('#sp2').text(msg);  
                $('#submit').prop('disabled',true)
                return false
            }else{
                 var eng =new RegExp("[a-zA-z]"); //要改成有中文不行
                 if(eng.test(password)){
                     if(password.length <=7 || password.length >=17){
                         var msg="密碼須為8至16字含英文數字";  
                         $('#sp2').text(msg); 
                          $('#submit').prop('disabled',true) 
                return false                    
                        }else{
                            var msg="";
                            $('#sp2').text(msg);  
                             $('#submit').removeAttr('disabled');
                return true
                        }
                }else{
                var msg ="密碼須為8至16字含英文數字";
                $('#sp2').text(msg);  
                 $('#submit').prop('disabled',true)
                return false
            }
    
        }
    } else{
        var msg="密碼須為8至16字含英文數字";  
        $('#sp2').text(msg); 
         $('#submit').prop('disabled',true) 
                return false   
    }
    }

        })
    
    
    
    
    
 