<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>

<%@ include file="../tiles/sideBar.jsp"%>

<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<div class="w3-main" style="margin-left:340px;margin-right:40px">

<%@ include file="../tiles/headerBar.jsp"%>

		<div class="w3-container" style="margin-top: 80px">
			<h1 class="w3-jumbo">
				<b>Interior Design</b>
			</h1>
			<h1 class="w3-xxxlarge w3-text-red">
				<b>Status.</b>
			</h1>
			<hr style="width: 50px; border: 5px solid red" class="w3-round">
		</div>

		<center>
		<h2>현재까지 주차시간은..</h2>
		<form id="form1" name="form1" method="post">
		<div id="result" name="result" ></div>
		<input type="hidden" name="time" value="">
		<input type="hidden" name="timeStr" value="${timeStr}">

		<input type="submit" value="출차하기" class="w3-button w3-red w3-padding-large w3-hover-black" onclick="go();">

		</form>
		</center>
</div>

<%@ include file="../tiles/footerBar.jsp"%>

</body>
</html>