<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
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
   <div class="panel panel-default" align="center"><br><br>
      아이디 : <input type="text" name="userID" id="userID" value="${id}">
      <input type="button" class="w3-button w3-blue gray w3-padding-large w3-hover-black" name="confirm" value="검  사" onclick="memberJoin();">
      <br> <br>
   </div>

		<c:choose>
			<c:when test="${result eq null}">
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${result eq 'true'}">
						<div align="center">
							사용가능한 아이디입니다.<br>
							<input type="button" class="w3-button w3-blue gray w3-padding-large w3-hover-black" value="사용" onclick="idok('${userId}')">
						</div>
					</c:when>

					<c:otherwise>
						<div align="center">이미 존재하는 아이디입니다.</div>
					</c:otherwise>

				</c:choose>
			</c:otherwise>
		</c:choose>
	</form>

<script type="text/javascript">
      function memberJoin() {
         document.userinput.action="Team2Servlet?command=confirmId";
         document.userinput.submit();
      }

      function selfclose() {
         window.self.close();
      }

      function idok(userid) {
         opener.userinput.userID.value = document.userinput.userID.value;
         self.close();
      }
</script>
</body>
</html>