<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" name="userinput" id="userinput">
   <div class="panel panel-default" align="center"><br>
   	<table>
		<tr>
		<td>이름 :</td>
		<td><input type="text" name="name" id="name" value="${name}" onfocus="renual()"></td>
		<td rowspan="2">
		<input type="button" class="w3-button w3-blue gray w3-padding-large w3-hover-black" name="confirm" value="검  사" onclick="findID();"></td>
		</tr>
		<tr>
		<td>이메일 :</td>
		<td><input type="text" name="email" value="${email}"></td>
		</tr>
   	</table>
   	<h5 style="color:red">버튼을 누르고 잠시만 기다려주세요!</h5>
   </div>
   <br><br>
	<div align="center" id="choose">
		<c:choose>
			<c:when test="${result eq null}">
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${result eq 'data'}">
						회원님의 이메일로 아이디가 전송되었습니다.<br>
							<input type="button" class="w3-button w3-blue gray w3-padding-large w3-hover-black" value="확인" onclick="selfclose();">

					</c:when>

					<c:otherwise>
						회원정보가 없습니다.
							<input type="button" class="w3-button w3-blue gray w3-padding-large w3-hover-black" value="확인" onclick="selfclose();">

					</c:otherwise>

				</c:choose>
			</c:otherwise>
		</c:choose>
	</div>
	</form>

<script type="text/javascript">
      function findID() {
         document.userinput.action="Team2Servlet?command=findID";
         document.userinput.submit();
      }

      function selfclose() {
         window.self.close();
      }

      function renual(){
		 document.getElementById('choose').innerHTML = '';
      }

</script>
</body>
</html>