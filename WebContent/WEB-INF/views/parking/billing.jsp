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
</script>
</head>

<body>
<%@ include file="../tiles/sideBar.jsp"%>

<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<div class="w3-main" style="margin-left:340px;margin-right:40px">

<%@ include file="../tiles/headerBar.jsp"%>
	<div class="w3-container" style="margin-top: 80px">
			<h1 class="w3-jumbo">
				<b>Interior Design</b>
			</h1>
			<h1 class="w3-xxxlarge w3-text-blue gray">
				<b>Billing.</b>
			</h1>
			<hr style="width: 50px; border: 5px solid blue" class="w3-round">
		</div>

	<!-- 본문 -->
	<div class="w3-row-padding">
    <div class="w3-margin-bottom">
      <ul class="w3-ul w3-light-grey w3-center">
        <li class="w3-blue gray w3-xlarge w3-padding-32">정산서</li>
        <li class="w3-padding-16">고객이름 및 차량번호</li>
        <li class="w3-padding-16">정액권 정보, 영수증 할인</li>
        <li class="w3-padding-16">${time} 분</li>
        <li class="w3-padding-16">기본 30분 1000원 <br>10분 당 500원</li>
        <li class="w3-padding-16">Good deals</li>
        <li class="w3-padding-16">
        <span class="w3-opacity">주차 요금</span>
          <h2>${money} 원</h2>
        </li>
        <li class="w3-light-grey w3-padding-24">
        <form name="form" method="post">
          <button class="w3-button w3-white w3-padding-large w3-hover-black" onclick="getOutCar">Sign Up</button>
          <input type="hidden" name="money" value="${money}">
          </form>
        </li>
      </ul>
    </div>
    </div>

</div>

<%@ include file="../tiles/footerBar.jsp"%>

</body>
</html>