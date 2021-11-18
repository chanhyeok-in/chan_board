<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<html>
<head>
	<title>First</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
	function CheckEmail()
	
	{                                                 
		var str = $('#email').val();
		if($('#passwd1').val()!=$('#passwd2').val()) {
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			$('#passwd1').focus();
			return false;
		}
	     var reg_email = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

	     if(!reg_email.test(str)) {                            

	          alert("이메일 형식이 맞지 않습니다. 다시 확인해주세요.");
	          $('#email').focus();
	          return false;

	     }                            

	     else {                       
			var randomquery = "d1d1d1d1";
	    	 var data22 = {
	    				service_id: 'service_2pp0eeo',
	    				template_id: 'template_qu42mgi',
	    				user_id: 'user_HFVuwTy8HlTgM5YQ3mj5S',
	    				template_params: {
	    				    'to_name': $('#email').val(),
	    				    'from_name':"Chan's World",
	    				    'message': "<a href='http://13.125.134.46/otp/checkEmail?q="+randomquery+"'>http://13.125.134.46:8080/otp/checkEmail?q="+randomquery+"></a>"
	    				  	}
	    			};
	    					$.ajax({
	    				url: "https://api.emailjs.com/api/v1.0/email/send",
	    				type: "POST",
	    				data: JSON.stringify(data22),
	    				contentType: 'application/json'
	    			});         
			alert("활성화 메일이 발송되었습니다. 이메일에서 확인 링크를 클릭시 계정이 활성화 됩니다. 메일이 오지 않는다면, 스팸메일함을 확인해 주시기 바랍니다.");
			location.href="http://13.125.134.46/otp/login";
	     }                            

	}             
	
	</script>
</head>
<body>
<h1>
	로그인
</h1>
 <form name="member">
<P>  E-mail <input type="text" id="email"/></P>
<P>  PASSWORD <input type="password" id="passwd1"/></P>
<P>  for PASSWORD correct <input type="password" id="passwd2"/></P>
<P>  <input type="button" name="가입" value="가입" onclick="CheckEmail()"/></P>
</form>
</body>
</html>
