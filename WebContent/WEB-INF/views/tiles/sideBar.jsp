<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.w3-bar-block a:hover{
text-shadow: gray 3px 3px 3px;
}
.w3-sidebar{
box-shadow:5px 5px 15px #000;
}
</style>
<script>
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
function go_confirm() {
location.href = "Team2Servlet?command=reserveConfirm";
}

function go_reservation() {
location.href = "Team2Servlet?command=reservation";
}

function go_signUp() {
   location.href = "Team2Servlet?command=signUp";
}

function go_contact() {
	   location.href = "Team2Servlet?command=goContact";
}

function go_login(){
      location.href = "Team2Servlet?command=signIn"
}

function go_logout(){
    location.href = "Team2Servlet?command=logout"
}
function go_home(){
	location.href="Team2Servlet?command=main";
}

function go_goStatus(){
   location.href="Team2Servlet?command=status";
}
function go_goBuyTicket(){
   location.href="Team2Servlet?command=buyTicket";
}
function go_details(){
	   location.href="Team2Servlet?command=usageDetails";
	}
// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}
</script>
<link rel="stylesheet"
href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">

</head>
<body>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-blue gray w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:28px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64" style="font-size:32px" align="center"><a href="Team2Servlet?command=main"><b><i class="fas fa-moon"></i>RnB_Team2<br>Parking Lots</b></a></h3>
  </div>

  <div class="w3-bar-block">
    <a href="#" onclick="go_home()" class="w3-bar-item w3-button w3-hover-white" style="font-size:32px"><i class="fas fa-home"></i>홈</a>
	<c:choose>
	<c:when test="${userInfo eq null }">
	<a href="#" onclick="go_signUp()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px"><i class="fas fa-user-plus"></i> 회원가입</a>
	<a href="#" onclick="go_login()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px"><i class="far fa-user"></i> 로그인</a>
	</c:when>
	<c:otherwise>
	<a href="#" onclick="go_logout()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px"><i class="far fa-user"></i> 로그아웃</a>
	<a href="#" onclick="go_reservation()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px"><i class="far fa-calendar-alt"></i> 예약하기</a>
    <a href="#" onclick="go_confirm()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px"><i class="fas fa-check"></i> 예약확인</a>
	<a href="#" onclick="go_goStatus()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px"><i class="fas fa-car"></i> 주차 현황</a>
    <a href="#" onclick="go_goBuyTicket()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px"><i class="fas fa-ticket-alt"></i> 정액권 구매</a>
    <a href="#" onclick="go_details()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px"><i class="far fa-calendar-alt"></i> 이용내역 조회</a>
	</c:otherwise>
	</c:choose>
    <a href="#" onclick="go_contact()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px"><i class="far fa-comment-alt"></i> 문의사항</a>

  </div>
</nav>
</body>
</html>