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
		  <h1 class="w3-jumbo">
				<b>Interior Design</b>
			</h1>
    <h1 class="w3-xxxlarge w3-text-blue gray"><b>Sign Up.</b></h1>
    <hr style="width:50px;border:5px solid blue" class="w3-round">

    <form action="Team2Servlet?command=addUser" onsubmit="return joincheck();" method="post" name="userinput">
      <div class="w3-section">
        <label>I D</label>
        <input class="w3-input w3-border" type="text" name="userID" onfocus="openConfirmid(this.form)" required>
      </div>
      <div class="w3-section">
        <label>P W</label>
        <input class="w3-input w3-border" type="password" name="userPassword" required>
      </div>
      <div class="w3-section">
        <label>P W (confirm)</label>
        <input class="w3-input w3-border" type="password" name="userPasswordconfirm" required>
      </div>
      <div class="w3-section">
        <label>Name</label>
        <input class="w3-input w3-border" type="text" name="userName" required>
      </div>
      <div class="w3-section">
        <label>Email (with accuracy)</label>
        <input class="w3-input w3-border" type="text" name="userEmail" required>
      </div>
      <div class="w3-section">
        <label>Car number</label>
        <input class="w3-input w3-border" type="text" name="userCarnum" required>
      </div>
      <div class="w3-section">
        <label>Phone</label>
        <input class="w3-input w3-border" type="text" name="userPhone" placeholder="-를 없이 입력하세요" required>
      </div>
      <input type="submit" class="w3-button w3-block w3-padding-large w3-blue gray w3-margin-bottom" name="confirm">Confirm</button>
    </form>
  </div>

	</div>

<%@ include file="../tiles/footerBar.jsp"%>
<script language="Javascript">

function joincheck() {
   var userinput = document.userinput;

   if (userinput.userPassword.value != userinput.userPasswordconfirm.value) {
      alert("비밀번호를 동일하게 입력하세요");
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