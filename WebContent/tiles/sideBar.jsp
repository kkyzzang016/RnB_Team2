<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.w3-bar-block a:hover{
text-shadow: gray 3px 3px 3px;
}
</style>
<script>

function op_confirm() {
location.href = "Team2Servlet?command=reserveConfirm";
}

function op_reservation() {
location.href = "Team2Servlet?command=reservation";
}

function go_signUp() {
	location.href = "Team2Servlet?command=signUp";
}

function go_login(){
	   location.href = "Team2Servlet?command=signIn"
}

function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

function w3_goStatus(){
	location.href="Team2Servlet?command=status";
}
function w3_goBuyTicket(){
	location.href="Team2Servlet?command=buyTicket";
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
    <h3 class="w3-padding-64" style="font-size:32px" align="center"><a href="Team2Servlet?command=main"><b>RnB_Team2<br>Parking Lots</b></a></h3>
  </div>

  <div class="w3-bar-block">
    <a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white" style="font-size:32px">Home</a>
    <a href="#showcase" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px">Showcase</a>
    <a href="#" onclick="go_login()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px"><i class="fas fa-check"></i>Login</a>
    <a href="#services" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px">Services</a>
    <a href="#designers" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px">Designers</a>
    <a href="#packages" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px">Packages</a>
    <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px">Contact</a>
    <a href="#" onclick="w3_goStatus()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px">주차 정보</a>
    <a href="#" onclick="w3_goBuyTicket()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px">정액권 구매</a>
    <a href="#" onclick="op_reservation()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px"><i class="fas fa-car"></i>Reservation</a>
    <a href="#" onclick="op_confirm()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px"><i class="fas fa-check"></i>Confirm</a>
    <a href="#" onclick="go_signUp()" class="w3-bar-item w3-button w3-hover-white" style="font-size:28px"><i class="fas fa-check"></i>Sign up</a>
  </div>
</nav>
</body>
</html>
