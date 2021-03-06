<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
var formInfo = document.userinput;
function goFindID(formInfo){
	url = "Team2Servlet?command=goFindID";
	open(url, "confirm", "toolbar = no, location=no, status = no, menubar = no, scrollbars = no, resizable = no, width =450, height = 320" );
}

function goFindPW(formInfo){
    url = "Team2Servlet?command=goFindPW";
    open(url, "confirm", "toolbar = no, location=no, status = no, menubar = no, scrollbars = no, resizable = no, width =450, height = 320" );
}
</script>
</head>
<body>

<%@ include file="../tiles/sideBar.jsp"%>

<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<div class="w3-main" style="margin-left:340px;margin-right:40px">

<%@ include file="../tiles/headerBar.jsp"%>

        <div class="w3-container" id="contact" style="margin-top:75px">

    <h1 class="w3-xxxlarge w3-text-blue gray"><b>로그인</b></h1>
    <font color="red">${message}</font>
    <hr style="width:50px;border:5px solid blue" class="w3-round">

    <form action="Team2Servlet?command=loginCheck"  method="post" name="userinput">
      <div class="w3-section">

        <label>I D</label>
        <input class="w3-input w3-border" type="text" name="userID" required>
      </div>
      <div class="w3-section">
        <label>P W</label>
        <input class="w3-input w3-border" type="password" name="userPassword" required>
      </div>
      <div class="w3-section" align="center">
        <input type="button" name="findID" value="ID찾기" class="w3-button w3-center w3-hover-indigo" onclick="goFindID(this.form)">
        <input type="button" name="findPW" value="PW찾기" class="w3-button w3-center w3-hover-indigo" onclick="goFindPW(this.form)">
      </div>
		<br>
        <input type = "submit" class="w3-button w3-center w3-hover-indigo" value="로그인" style="width:100%">

    </form>
  </div>
</div>

<%@ include file="../tiles/footerBar.jsp"%>
</body>
</html>