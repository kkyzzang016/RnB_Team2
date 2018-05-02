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
function agree(){
	if (!document.form.confirm.checked) {
		alert("동의 여부를 체크해주세요.");
		document.form.confirm.focus();
	} else {
		document.form.payConfirm.disabled;
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
function goComplete(){
	if(document.form.codeValue.value==document.form.code.value){
	alert("구매가 완료되었습니다. 감사합니다.");
	document.form.action="Team2Servlet?command=payComplete";
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
				<b>정액권 구매</b>
			</h1>
			<hr style="width: 50px; border: 5px solid blue" class="w3-round">

		<div class="w3-row w3-padding-64 " align="center">
					<img src="${imgsrc}" width="30%">
					<br>
					<h1 class="w3-center">이용 약관</h1>
					<h3 class="w3-center" style="color:red">본 서비스는 이메일 인증을 통한 가상결제로 운영되고 있습니다.</h3>
					<p class="w3-large">
												제1조 (목적, 적용범위 등)<br>
						①	 이 약관은 알앤비2팀(이하 “회사”)의 주차장서비스에서 전용주차 서비스를 이용하기 위해 사용되는 전용상품권과 관련하여 회사와 이용자 사이의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
						②	 이 약관에서 정하지 않은 부분은 회사 이용약관에서 정한 바에 따릅니다.<br>
						<br>제2조 (정의)<br>
						① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
						1. “주차장 서비스”라 함은 회사가 주차장 예약, 전용주차 서비스 컨텐츠를 회사의 온라인 웹사이트(PC, 모바일 등 접근 기기의 종류 불문를 통해 이용자에게 이용 또는 열람할 수 있도록 유•무선으로 제공하는 서비스를 말합니다.<br>
						2. “전용상품권”이라 함은 회사와 제휴관계 있는 자의 서비스에서 컨텐츠를 이용하거나 열람하기 위해 사용할 수 있는 회사가 발행한 전자적 증표 또는 그 증표에 관한 정보로서 전자적 지급수단을 말합니다.<br>
						② 이 약관에서 정하지 않은 부분은 회사 이용약관에서 정한 바에 따릅니다.<br>

						<br>제3조 (전용상품권의 구매 등)<br>
						① 회사는 이용자의 전용상품권 구매 전에 전용상품권에 대한 거래 조건을 정확하게 이해하고 실수나 착오 없이 거래할 수 있도록 다음 각 호의 사항들을 적절한 방법으로 이 약관에서 고지합니다.<br>
						1. 판매자의 상호, 대표자 성명, 주소, 전화번호 등<br>
						2. 전용상품권의 확인 및 선택, 구매 방법의 선택 및 결제정보의 입력, 구매 신청에 관한 확인, 종류 및 가격, 이용방법, 이용시기, 이용조건 등 구체적 내용<br>
						3. 청약철회 및 계약해제의 기한・행사방법 및 효과, 환불 등에 관한 사항<br>
						4. 소비자의 피해보상, 불만 처리 및 분쟁 처리에 관한 사항<br>
						② 회사는 이용자의 전용상품권 구매 신청이 다음 각 호에 해당하는 경우에는 승낙하지 않거나 승낙을 유보하거나, 추후 승낙을 취소할 수 있습니다.<br>
						1. 실명이 아니거나 타인의 명의를 이용한 경우<br>
						2. 허위의 정보를 기재하거나, 필수 사항을 기재하지 않은 경우<br>
						3. 서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우<br>
						4. 동일 아이피의 대량 결제, 유사 아이디에서의 연속적인 결제, 위험 아이피에서의 결제 등 도용에 의한 전용상품권 구매로 판단되는 경우<br>
						5. 결제에 대한 지급이 실제로 이루어지지 않았거나 않을 가능성이 있는 경우<br>
						6. 기타 이용자의 전용상품권 구매 신청이 회사와 제3자의 이익을 훼손할 위험이 있다고 판단되는 경우<br>

					</p>
			</div>
	</div>
	<!-- 본문 -->
	<form name="form" method="post" align="center">
	<h2>총 금액 : ${fee}원</h2><br>
	<div id="result">
	<input type="checkbox" name="confirm">&nbsp동의합니다.<br>
	<input type="button" class="w3-button w3-blue gray w3-padding-large w3-hover-black" name="payConfirm" onclick="agree()" value="인증하기">
	<h3 class="w3-center" style="color:red">버튼을 누른 후 잠시만 기다려주세요!</h3>
	</div>
	</form>
	<!-- 본문 끝 -->
	</div>

<%@ include file="../tiles/footerBar.jsp"%>

</body>
</html>