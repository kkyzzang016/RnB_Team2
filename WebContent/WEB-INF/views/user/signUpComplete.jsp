<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(checkSession);
function checkSession(){
	if(<%=session.getAttribute("userInfo")==null%>){
		alert("로그인 정보가 없습니다.");
		location.href="Team2Servlet?command=signIn"
	}
}
</script>
</head>
<body>
<%@ include file="../tiles/sideBar.jsp"%>

<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<div class="w3-main" style="margin-left:340px;margin-right:40px">

<%@ include file="../tiles/headerBar.jsp"%>

 <div class="w3-container" id="contact" style="margin-top:75px">

    <h1 class="w3-xxxlarge w3-text-blue gray"><b>회원가입</b></h1>
    <hr style="width:50px;border:5px solid blue" class="w3-round">
	<div align="center">
	<h2 align="center">회원가입이 완료되었습니다!</h2>
	<button onclick="location.href='Team2Servlet?command=main'" class="w3-button w3-blue gray w3-padding-large w3-hover-black">홈으로</button>
	</div>
	</div>
	<!-- 본문 -->

	</div>

<%@ include file="../tiles/footerBar.jsp"%>
</body>
</html>