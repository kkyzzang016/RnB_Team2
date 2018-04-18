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
	<div class="w3-container" style="margin-top: 80px">
			<h1 class="w3-jumbo">
				<b>Interior Design</b>
			</h1>
			<h1 class="w3-xxxlarge w3-text-blue gray">
				<b>정액권 구매</b>
			</h1>
			<hr style="width: 50px; border: 5px solid blue" class="w3-round">
		</div>

	<!-- 본문 -->

	  <div class="w3-row-padding w3-grayscale">

	  <form name="form1" method="post">
    <div class="w3-col m4 w3-margin-bottom">
      <div class="w3-light-grey">
        <img src="/w3images/team2.jpg" alt="John" style="width:100%">
        <div class="w3-container">
          <h3>1개월 권</h3>
          <p class="w3-opacity">1개월 권</p>
          <p align="center">
          분당 M타워 1개월 <br>주차 정액권을 구매합니다.<br><br>
          <input type="checkbox" name="check1" value="120000">&nbsp동의합니다.
          </p>
          <p align="center">
          <br>
          <input type="submit" value="120,000 원" onclick="go_ticket1()"
          class="w3-button w3-blue gray w3-padding-large w3-hover-black"></p>
        </div>
      </div>
    </div>
    </form>

    <form name="form2" method="post">
    <div class="w3-col m4 w3-margin-bottom">
      <div class="w3-light-grey">
        <img src="/w3images/team1.jpg" alt="Jane" style="width:100%">
        <div class="w3-container">
          <h3>3개월 권</h3>
          <p class="w3-opacity">3개월 권</p>
          <p align="center">
          분당 M타워 3개월 <br>주차 정액권을 구매합니다.<br><br>
          <input type="checkbox" name="check2" value="300000">&nbsp동의합니다.
          </p>
          <p align="center">
          <br>
          <input type="submit" value="300,000 원" onclick="go_ticket2()"
          class="w3-button w3-blue gray w3-padding-large w3-hover-black"></p>
        </div>
      </div>
    </div>
    </form>

    <form name="form3" method="post">
    <div class="w3-col m4 w3-margin-bottom">
      <div class="w3-light-grey">
        <img src="/w3images/team3.jpg" alt="Mike" style="width:100%">
        <div class="w3-container">
          <h3>6개월 권</h3>
          <p class="w3-opacity">6개월 권</p>
          <p align="center">
          분당 M타워 6개월 <br>주차 정액권을 구매합니다.<br><br>
          <input type="checkbox" name="check3" value="520000">&nbsp동의합니다.
          </p>
          <p align="center">
          <br>
          <input type="submit" value="520,000 원" onclick="go_ticket3()"
          class="w3-button w3-blue gray w3-padding-large w3-hover-black"></p>
        </div>
      </div>
    </div>
    </form>

  </div>

<!--  <input type="hidden" name="fee" value="120000"> -->
<%@ include file="../tiles/footerBar.jsp"%>

</body>
</html>