<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>Student Profile Page Design Example</title>
    <meta name="author" content="Codeconvey" />
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet"><link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--Only for demo purpose - no need to add.-->
    <link rel="stylesheet" href="css/demo.css" />
    
	    <link rel="stylesheet" href="css/style.css">
</head>
<body style="background-color:antiquewhite;">
<%@ include file="Userindex.jsp" %>	
<header class="ScriptHeader">
    <div class="rt-container">
    	<div class="col-rt-12">
        	<div class="rt-heading">
            	<h1>Hello ${user.getName()} !</h1>
            </div>
        </div>
    </div>
</header>

<section>
    <div class="rt-container">
          <div class="col-rt-12">
              <div class="Scriptcontent">
              
<!-- Student Profile -->
<form action="modify" method="post">
<div class="student-profile py-4">
  <div class="container">
    <div class="row">
      <div class="col-lg-4">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent text-center">
            <img class="profile_img" src="${user.getAvatar()}" alt="UserAvatar">
            <h3>${user.getName()}</h3>
          </div>
          <div class="card-body">
            <p class="mb-0"><strong class="pr-1">User ID:</strong>${user.getId()}</p>
            <p class="mb-0"><strong class="pr-1">Name:</strong>${user.getName()}</p>
            <p class="mb-0"><strong class="pr-1">Nickname:</strong>${user.getNickname()}</p>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
          </div>
          <div class="card-body pt-0">
            <table class="table table-bordered">
              <tr>
                <th width="30%">Gender</th>
                <td width="2%">:</td>
                <td>${sgender}</td>
              </tr>
              <tr>
                <th width="30%">Birth</th>
                <td width="2%">:</td>
                <td>${sbirth}</td>
              </tr>
              <tr>
                <th width="30%">Account</th>
                <td width="2%">:</td>
                <td>${user.getAccount()}</td>
              </tr>
              <tr>
                <th width="30%">Password</th>
                <td width="2%">:</td>
                <td>${user.getPassword()}</td>
              </tr>
              <tr>
                <th width="30%">Phone</th>
                <td width="2%">:</td>
                <td>${user.getPhone()}</td>
              </tr>
               <tr>
                <th width="30%">City</th>
                <td width="2%">:</td>
                <td>${scity}</td>
              </tr>
               <tr>
                <th width="30%">Township</th>
                <td width="2%">:</td>
                <td>${user.getTownship()}</td>
              </tr>
               <tr>
                <th width="30%">Address</th>
                <td width="2%">:</td>
                <td>${user.getAddress()}</td>
              </tr>
            </table>
          </div>
        </div>
 <div style="height: 15px"></div>
 <div style="height: 15px;display: flex;
  justify-content: center;
  align-content: center;">
<a href="#"><i class="fa fa-dribbble"></i></a>&nbsp; &nbsp; 
  <a href="#"><i class="fa fa-twitter"></i></a>&nbsp;&nbsp;  
   <a href="#"><i class="fa fa-linkedin"></i></a>&nbsp; &nbsp; 
  <a href="#"><i class="fa fa-facebook"></i></a>
        </div>
         <br>
          <div style="height: 50px;display: flex;
  justify-content: center;
  align-content: center;">
<input type="submit"  name="submit" value="修改">
<input type="submit" name="submit"  value="返回">
</div>
            </form>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- partial -->
           
    		</div>
		</div>
    </div>
</section>
     


    <!-- Analytics -->

	</body>
</html>