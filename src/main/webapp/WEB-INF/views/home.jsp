<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>초기화면 </title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<h1>
	Heㅣㅣo world!  
</h1>

<P>  현재 시간은  ${serverTime} 입니다. </P>
<a href="/board/boardList.do">게시판 이동</a>
</body>
</html>
