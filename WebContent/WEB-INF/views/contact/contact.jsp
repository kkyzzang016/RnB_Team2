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
			<h1 class="w3-jumbo">
				<b>Interior Design</b>
			</h1>
			<h1 class="w3-xxxlarge w3-text-blue gray">
				<b>Contact.</b>
			</h1>
			<hr style="width: 50px; border: 5px solid blue" class="w3-round">

    <p>하고싶은 말</p>
    <form action="Team2Servlet?command=contact" target="_blank" method="post">
      <div class="w3-section">
        <label>Name</label>
        <input class="w3-input w3-border" type="text" name="name" required>
      </div>
      <div class="w3-section">
        <label>Email</label>
        <input class="w3-input w3-border" type="text" name="email" required>
      </div>
      <div class="w3-section">
        <label>Message</label>
        <input class="w3-input w3-border" type="text" name="message" required>
      </div>
      <button type="submit" class="w3-button w3-block w3-padding-large w3-blue gray w3-margin-bottom">Send Message</button>
    </form>
	</div>
</div>
<%@ include file="../tiles/footerBar.jsp"%>
</body>
</html>