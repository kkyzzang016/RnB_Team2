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

		  <div class="w3-container" id="contact" style="margin-top:75px">

    <h1 class="w3-xxxlarge w3-text-blue gray"><b>회원가입</b></h1>
    <hr style="width:50px;border:5px solid blue" class="w3-round">

    <form action="Team2Servlet?command=addUser" onsubmit="return joincheck();" method="post" name="userinput">
      <div class="w3-section">
        <label>아이디</label>
        <input class="w3-input w3-border" type="text" name="userID" onfocus="openConfirmid(this.form)" required>
      </div>
      <div class="w3-section">
        <label>비밀번호</label>
        <input class="w3-input w3-border" type="password" name="userPassword"
        placeholder="8~15자 영문,숫자 1자 이상,특수문자 1자 이상으로 조합해주세요" required>
      </div>
      <div class="w3-section">
        <label>비밀번호 확인</label>
        <input class="w3-input w3-border" type="password" name="userPasswordconfirm" required>
      </div>
      <div class="w3-section">
        <label>이름</label>
        <input class="w3-input w3-border" type="text" name="userName" required>
      </div>
      <div class="w3-section">
        <label>이메일 <h3 style="color:red">이메일 인증 서비스를 위하여 정확한 정보를 입력해주세요.</h3></label>
        <input class="w3-input w3-border" type="email" name="userEmail" placeholder="honggildong@korea.com" required>
      </div>
      <div class="w3-section">
        <label>차량번호</label>
        <input class="w3-input w3-border" type="text" name="userCarnum" placeholder="OO가 OOOO" required>
      </div>
      <div class="w3-section">
        <label>휴대전화</label>
        <input class="w3-input w3-border" type="text" name="userPhone" placeholder="-를 없이 입력하세요" required>
      </div>
      <input type="submit" class="w3-button w3-block w3-padding-large w3-blue gray w3-margin-bottom" name="confirm">
    </form>
  </div>

	</div>

<%@ include file="../tiles/footerBar.jsp"%>
<script language="Javascript">

function joincheck() {
   var userinput = document.userinput;
   var pw = document.userinput.userPassword.value;
   var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
   var number = "1234567890";
   var sChar = "-_=+\|()*&^%$#@!~`?></;,.:'";

   var sChar_Count = 0;
   var alphaCheck = false;
   var numberCheck = false;

   //비밀번호
   if(8 <= pw.length || pw.length <= 15){
	 for(var i=0; i<pw.length; i++){
	  if(sChar.indexOf(pw.charAt(i)) != -1){
	   sChar_Count++;
	  }
	  if(alpha.indexOf(pw.charAt(i)) != -1){
	   alphaCheck = true;
	  }
	  if(number.indexOf(pw.charAt(i)) != -1){
	   numberCheck = true;
	  }
	}
	  if(sChar_Count < 1 || alphaCheck != true || numberCheck != true){
       alert("비밀번호는 8~15자 영문,숫자 1자 이상,특수문자 1자 이상으로 조합해주세요");
       userinput.userPassword.focus();
	  return false;
	 }

	}else{
	  alert("비밀번호는 8~15자 영문,숫자 1자 이상,특수문자 1자 이상으로 조합해주세요");
	  userinput.userPassword.focus();
	 return false;
	}

   //기타
   if (userinput.userPassword.value != userinput.userPasswordconfirm.value) {
      alert("비밀번호가 일치하지 않습니다.");
      userinput.userPassword.focus();
      return false;
   }
   if (userinput.userEmail.value.search(/(\S+)@(\S+)\.(\S+)/) == -1 ) {
	  alert('올바른 이메일 형식이 아닙니다.');
      userinput.userEmail.focus();
      return false;
   }
}

//아이디 중복 여부를 판단
function openConfirmid(userinput) {
   //아이디를 입력했는지 검사

   //url과 사용자 입력 id를 조합
   url = "Team2Servlet?command=goConfirmId";

   //새로운 윈도우를 엽니다.
   open(
         url,
         "confirm",
         "toolbar = no, location=no, status = no, menubar = no, scrollbars = no, resizable = no, width =450, height = 320" );
      document.userinput.userPassword.focus();
}

</script>
</body>
</html>