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
	$('#bill').click(radioClick);
	$('#bill2').click(radioClick);
	$('#commuterTicket').click(go_free);
	if(<%=session.getAttribute("userInfo")==null%>){
		alert("로그인 정보가 없습니다.");
		location.href="Team2Servlet?command=signIn"
	}
}
function agree(){
	if (!document.form.confirm.checked) {
		alert("동의 여부를 체크해주세요.");
		document.form.confirm.focus();
	} else {
		$.ajax({
			type : "POST",
			url : "Team2Servlet?command=payCertificate",
			dataType : "text",
			success : function(data){
				alert("회원님의 이메일로 인증코드가 전송되었습니다.");
				$('#result').html(data);
				}
			});
	}
}

function radioClick(){
	var time = document.form.time.value;
	var bill = document.form.bill.value;
	$.ajax({
		type : "POST",
		url : "Team2Servlet?command=billingDiscount",
		dataType : "text",
		data : {'billkey':bill,'timekey':time},
		success : function(data){
			$('#fee').html(data);
			document.form.money.value = data;
			}
		});
}

function go_free(){
	$.ajax({
		type : "POST",
		url : "Team2Servlet?command=checkTicket",
		dataType : "text",
		success : function(data){
			if(data=='noticket'){
				alert('정액권 구매정보가 없습니다.');
				document.form.commuterTicket.checked=false;
				return false;
			}
			else if(data=='0'){
				$('#fee').html(data);
				document.form.money.value = data;
				document.form.bill.disabled;
			}
			else{
				alert('기간이 지났습니다!');
				document.form.commuterTicket.checked=false;
				return false;
			}
			}
		});
}

function goComplete(){
	if(document.form.codeValue.value==document.form.code.value){
	alert("구매가 완료되었습니다. 감사합니다.");
	document.form.action="Team2Servlet?command=payFeeComplete";
	document.form.submit();
	}
	else{
	alert("인증코드가 일치하지 않습니다.");
	return false;
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
    <form name="form" method="post">
      <ul class="w3-ul w3-light-grey w3-center">
        <li class="w3-blue gray w3-xlarge w3-padding-32">정산서<br>
        <h3 class="w3-center" style="color:red">본 서비스는 이메일 인증을 통한 가상결제로 운영되고 있습니다.</h3></li>
        <li class="w3-padding-16">${userInfo.userID } 님 / ${userInfo.userCarnum} / ${floor}층</li>
        <li class="w3-padding-16"><input type="checkbox" id="commuterTicket" name="commuterTicket" value="commuterTicket"> 정액권</li>
        <li class="w3-padding-16">영수증 <br>
        <input type="radio" id="bill" name="bill" value="food"> 식당
        <input type="radio" id="bill2" name="bill" value="company"> 회사
        </li>
        <li class="w3-padding-16">주차시간 : ${time} 분</li>
        <li class="w3-padding-16">기본 30분 1000원 / 10분 당 500원</li>
        <li class="w3-padding-16">
        <span class="w3-opacity">주차 요금</span><br>
          <div id="fee">${money }원</div>
        </li>
        <li class="w3-light-grey w3-padding-24">
        <div id="result">
        <input type="checkbox" name="confirm">&nbsp동의합니다.<br><br>
          <input type="button" class="w3-button w3-white w3-padding-large w3-hover-black" onclick="agree()" value="결제하기">
          <h3 class="w3-center" style="color:red">버튼을 누른 후 잠시만 기다려주세요!</h3>
          </div>
          <input type="hidden" id="money" name="money" value="${money}">
          <input type="hidden" id="time" name="time" value="${time}">
          <input type="hidden" id="floor" name="floor" value="${floor}">
        </li>
      </ul>
      </form>
    </div>

    </div>

</div>

<%@ include file="../tiles/footerBar.jsp"%>

</body>
</html>