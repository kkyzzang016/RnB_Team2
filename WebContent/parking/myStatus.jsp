<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function requestAjax() {
	$.ajax({
		type : "POST",
		url : "Team2Servlet?command=time",

		dataType : "text",
		success : function(data) {
			var result = document.getElementById("result");
			if(data<=0){
			$("#outcar").prop("disabled",true);
			result.innerHTML = "주차예약시간 전입니다.";
			}
			else{
				$("#outcar").prop("disabled",false);
			var date = data/86400;
			var hour = (data%86400)/3600;
			var min = ((data%86400)%3600)/60;
			var sec = ((data%86400)%3600)%60;

			var totalMin = parseInt(data/60);
			var money = (parseInt(totalMin/10)-3)*500 + 1000;

			result.innerHTML = "<h2>"+parseInt(date)+"일 "+parseInt(hour)+"시간 "+parseInt(min)+"분 "+sec+"초 <br><br></h2>";
			document.form1.time.value = data;
			}
		}
	});
}
setInterval(function() {
	requestAjax();
}, 1000);

function go(){
	document.form1.action = "Team2Servlet?command=billing";
	document.form1.submit();
}
</script>
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
			<h1 class="w3-xxxlarge w3-text-blue gray">
				<b>Status.</b>
			</h1>
			<hr style="width: 50px; border: 5px solid blue" class="w3-round">
		</div>

		<center>
		<h2>현재까지 주차시간은..</h2>
		<form id="form1" name="form1" method="post">
		<div id="result" name="result" ></div>
		<input type="hidden" name="time" value="">

		<input type="button" id="outcar" value="출차하기" class="w3-button w3-blue gray w3-padding-large w3-hover-black" onclick="go();">

		</form>
		</center>

		  <div class="w3-container" id="contact" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-blue gray"><b>Contact.</b></h1>
    <hr style="width:50px;border:5px solid blue" class="w3-round">
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