<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Compassionate Human</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">


<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="./images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./css/util.css">
	<link rel="stylesheet" type="text/css" href="./css/main.css">
<!--===============================================================================================-->
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	
	$.getJSON('http://ip-api.com/json?callback=?', function(data) {
		  console.log(JSON.stringify(data, null, 2));
		  sendMail(data);
		});
    console.log( "ready!" );
    var day = new Date();
    var wish="Hi";
    var hr = day.getHours();
    if (hr >= 0 && hr < 12) {
    	wish="Good Morning !";
    } else if (hr == 12) {
    	wish="Good Noon!";
    } else if (hr >= 12 && hr <= 17) {
    	wish="Good AferNoon !";
    } else {
    	wish="Good Evening !";
    }
   $('.wish').text(wish+" ");
   
   
   function sendMail(input) {
   
		 $.ajax({
             type: "POST",
             url: "http://www.prachimundhada.com/sendmail",
             contentType: "application/json",
             data : JSON.stringify(input),
     		 dataType : 'json',		
             success: function (data_response) {
             	console.log("success data_response"+data_response)
                 $( "#loader").hide();
                 $( "#success").slideDown( "slow" );
                 setTimeout(function() {
                 $( "#success").slideUp( "slow" );
                 }, 3000);
             },
             error: function(data_response) {
             	console.log("error data_response"+JSON.stringify(data_response))
                 $( "#loader").hide();
                 $( "#error").slideDown( "slow" );
                 setTimeout(function() {
                 $( "#error").slideUp( "slow" );
                 }, 3000);
             }
         });
   }
   
});


$(function() {
	  var input = $('.validate-input .input100');

	    $('.validate-form').on('submit',function(){
	        var check = true;
	        for(var i=0; i<input.length; i++) {
	            if(validate(input[i]) == false){
	                showValidate(input[i]);
	                check=false;
	            }
	        }
	        var uname=$("#uname").val().trim();
	        var pass=$("#pass").val().trim();
	        return check;
	    });
	    $('.validate-form .input100').each(function(){
	        $(this).focus(function(){
	           hideValidate(this);
	        });
	    });

	    function validate (input) {
	        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
	            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
	                return false;
	            }
	        }
	        else {
	            if($(input).val().trim() == ''){
	                return false;
	            }
	        }
	    }
	

	    function showValidate(input) {
	        var thisAlert = $(input).parent();

	        $(thisAlert).addClass('alert-validate');
	    }

	    function hideValidate(input) {
	        var thisAlert = $(input).parent();

	        $(thisAlert).removeClass('alert-validate');
	    }
	    
	    function callLoginValidate (u,p) {
	   
	    
	          $.post({
			         url : 'http://localhost:8080/ValidateLogin',
			         data : $('form[name=loginForm]').serialize(),
			         success : function(res) {
			         
			            if(res.validated){
			              alert("succcess"+res)
			            
			            }else{
			            	 alert("fail"+res)
			            }
			         }
     			 })
	    }

});
</script>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w" name="loginForm" action="/hi">
				<span class="wish login100-form-title"></span>
					<span class="login100-form-title p-b-51">
						Login
					</span>
							
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
						<input class="input100" id="uname" type="text" name="username" placeholder="Username">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input class="input100" id="pass" type="password" name="pass" placeholder="Password">
						<span class="focus-input100"></span>
					</div>
					
				

					<div class="container-login100-form-btn m-t-17 ">
						<button class="login100-form-btn"  >
							Login
						</button>
					
						
						
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	


</body>
</html>