<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../tiles/sideBar.jsp"%>

<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<div class="w3-main" style="margin-left:340px;margin-right:40px">

<%@ include file="../tiles/headerBar.jsp"%>

<div class="w3-container" style="margin-top: 80px" id="showcase">

			<h1 class="w3-xxxlarge w3-text-blue gray">
				<b>문의사항</b>
			</h1>
			<hr style="width: 50px; border: 5px solid blue" class="w3-round">

    <h2>서비스 개선을 위한 문의 및 건의사항을 적어주세요!</h2>
    <h3 style="color:red">확인 후 신속한 서비스 개선을 약속드립니다!</h3><br>
    <form action="Team2Servlet?command=contact" target="_blank" method="post">
      <div class="w3-section">
        <label>성함</label>
        <input class="w3-input w3-border" type="text" name="name" required>
      </div>
      <div class="w3-section">
        <label>Email 주소</label>
        <input class="w3-input w3-border" type="text" name="email" required>
      </div>
      <div class="w3-section">
        <label>보내는 메시지</label>
        <input class="w3-input w3-border" type="text" name="message" required>
      </div>
      <input type="submit" class="w3-button w3-block w3-padding-large w3-blue gray w3-margin-bottom" value="보내기">
    </form>
	</div>
</div>
<%@ include file="../tiles/footerBar.jsp"%>
</body>
</html>