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
	<title>로그인</title>
</head>

<body>
<div class="main">
	<p class="sign" align="center">login</p>
	<form class="form1" name="f" method="post" action="second">
		<input class="un " name="user_id" type="text" align="center" placeholder="ID">
		<input class="pass" name="user_pw" type="password" align="center" placeholder="Password">
		<a class="submit" align="center">login</a>
		<p class="forgot" align="center"><a href="./newMember.do">아직 회원이 아니십니까?</a></p>

	</form>
</div>

</body>

</html>
