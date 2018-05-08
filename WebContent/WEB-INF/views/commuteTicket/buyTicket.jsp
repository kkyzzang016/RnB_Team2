<%@page import="dto.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(checkSession);
function checkSession(){
	if(<%=session.getAttribute("userInfo")==null%>){
		alert("로그인 정보가 없습니다.");
		location.href="Team2Servlet?command=signIn"
	}
}
function checkreserve(){
	   if(<%=session.getAttribute("userInfo")!=null%>){
	      alert("이미 정액권을 구매하셨습니다.");
	      location.href="Team2Servlet?command=main";
	   }
}
function go_ticket1(){
	if (!document.form1.check1.checked) {
		alert("동의 여부를 체크해주세요.");
		document.form1.check1.focus();
	} else {
		document.form1.action = "Team2Servlet?command=purchaseConfirm&fee=120000&imgsrc=imgs/tickets/oneMonth.JPG";
		document.form1.submit();
	}
}
function go_ticket2(){
	if (!document.form2.check2.checked) {
		alert("동의 여부를 체크해주세요.");
		document.form2.check2.focus();
	} else {
		document.form2.action = "Team2Servlet?command=purchaseConfirm&fee=300000&imgsrc=imgs/tickets/threeMonth.JPG";
		document.form2.submit();
	}
}
function go_ticket3(){
	if (!document.form3.check3.checked) {
		alert("동의 여부를 체크해주세요.");
		document.form3.check3.focus();
	} else {
		document.form3.action = "Team2Servlet?command=purchaseConfirm&fee=520000&imgsrc=imgs/tickets/sixMonth.JPG";
		document.form3.submit();
	}
}
</script>
</head>
<body>
<%@ include file="../tiles/sideBar.jsp"%>

<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<div class="w3-main" style="margin-left:340px;margin-right:40px">

<%@ include file="../tiles/headerBar.jsp"%>
	<div class="w3-container" style="margin-top: 80px">

			<h1 class="w3-xxxlarge w3-text-blue gray">
				<b>정액권 구매</b>
			</h1>
			<hr style="width: 50px; border: 5px solid blue" class="w3-round">
	</div>

	<!-- 본문 -->
	<c:choose>
	<c:when test="${checkcc == 'yess'}">
    <script>checkreserve();</script>
	</c:when>
	<c:when test="${checkcc == 'noo'}">

	<br><br>
  <div class="w3-row-padding w3-whitescale">

    <div class="w3-col m4 w3-margin-bottom">
     <div class="w3-light-gray">
     <br>
        <center><img src="imgs/tickets/oneMonth.JPG" alt="1개월" style="width:60%"></center><br>
        <div class="w3-container">
          <h3>1개월 권</h3>
          <p class="w3-opacity">1개월 권</p>
          <form name="form1" method="post">
          <p align="center">
          분당 M타워 1개월 <br>주차 정액권을 구매합니다.<br><br>
          <input type="checkbox" name="check1">&nbsp동의합니다.
          <input type="hidden" name="fee" value="120000">
          <input type="hidden" name="imgsrc" value="imgs/tickets/oneMonth.JPG">
          <input type="hidden" name="ticketInfo" value="${ticketInfo }">
          </p>
          <p align="center">
          <br>
          <input type="button" value="120,000 원" onclick="go_ticket1()"
          class="w3-button w3-blue gray w3-padding-large w3-hover-black"></p>
          </form>
        </div>
      </div>
    </div>

    <div class="w3-col m4 w3-margin-bottom">
     <div class="w3-gray">
     <br>
        <center><img src="imgs/tickets/threeMonth.JPG" alt="3개월" style="width:60%"></center><br>
        <div class="w3-container">
          <h3>3개월 권</h3>
          <p class="w3-opacity">3개월 권</p>
          <form name="form2" method="post">
          <p align="center">
          분당 M타워 3개월 <br>주차 정액권을 구매합니다.<br><br>
          <input type="checkbox" name="check2" value="300000">&nbsp동의합니다.
          <input type="hidden" name="fee" value="300000">
          <input type="hidden" name="imgsrc" value="imgs/tickets/threeMonth.JPG">
          <input type="hidden" name="ticketInfo" value="${ticketInfo }">
          </p>
          <p align="center">
          <br>
          <input type="button" value="300,000 원" onclick="go_ticket2()"
          class="w3-button w3-blue gray w3-padding-large w3-hover-black"></p>
          </form>
        </div>
      </div>
    </div>

    <div class="w3-col m4 w3-margin-bottom">
     <div class="w3-light-grey">
     <br>
        <center><img src="imgs/tickets/sixMonth.JPG" alt="6개월" style="width:60%"></center><br>
        <div class="w3-container">
          <h3>6개월 권</h3>
          <p class="w3-opacity">6개월 권</p>
          <form name="form3" method="post">
          <p align="center">
          분당 M타워 6개월 <br>주차 정액권을 구매합니다.<br><br>
          <input type="checkbox" name="check3" value="520000">&nbsp동의합니다.
          <input type="hidden" name="fee" value="520000">
          <input type="hidden" name="imgsrc" value="imgs/tickets/sixMonth.JPG">
          <input type="hidden" name="ticketInfo" value="${ticketInfo }">
          </p>
          <p align="center">
          <br>
          <input type="button" value="520,000 원" onclick="go_ticket3()"
          class="w3-button w3-blue gray w3-padding-large w3-hover-black"></p>
          </form>
        </div>
      </div>
    </div>
	</div>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>

</div>
<%@ include file="../tiles/footerBar.jsp"%>

</body>
</html>