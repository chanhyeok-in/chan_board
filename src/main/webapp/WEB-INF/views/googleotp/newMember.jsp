<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>

<head>
	<link rel="stylesheet" href="/assets/css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="/assets/css/fontawesome-all.min.css">
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
				$.ajax({
					type : "POST",            // HTTP method type(GET, POST) 형식이다.
					url : "/otp/newMemberAjax",      // 컨트롤러에서 대기중인 URL 주소이다.
					data : {"USER_ID":$('#email').val(), "USER_PW":$('#passwd1').val()},            // Json 형식의 데이터이다.
					success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
						// 응답코드 > 0000
						if(res[2]="success"){
							var data22 = {
								service_id: 'service_2pp0eeo',
								template_id: 'template_qu42mgi',
								user_id: 'JcFKla2m2i7ifVMod',
								template_params: {
									'to_name': $('#email').val(),
									'from_name':"Chan's World",
									'message': "<a href='http://3.34.42.145/otp/emailVaildAjax?USER_ID="+$('#email').val()+"&EMAIL_CODE="+res[1]+"'>http://3.34.42.145/otp/emailVaildAjax?EMAIL_CODE="+res[1]+"</a>"
								}
							};
							$.ajax({
								url: "https://api.emailjs.com/api/v1.0/email/send",
								type: "POST",
								data: JSON.stringify(data22),
								contentType: 'application/json'
							});
							alert(res[0]);
							location.href="http://3.34.42.145/otp/login";
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
						alert("실패.")
					}
				});

			}

		}

	</script>
	<title>회원가입</title>
</head>

<body>
<div class="main">
	<p class="sign" align="center">Sign in</p>
	<form class="form1" name="member" action="second">
		<input class="un " id="email" type="text" align="center" placeholder="E-mail">
		<input class="pass" id="passwd1" type="password" align="center" placeholder="Password">
		<input class="pass" id="passwd2" type="password" align="center" placeholder="Password 확인">
		<a class="submit" align="center" onclick="CheckEmail()">가입</a>
	</form>

</div>

</body>

</html>
