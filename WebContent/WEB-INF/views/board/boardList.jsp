<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

			<h1 class="w3-xxxlarge w3-text-blue gray">
				<b>자유 게시판</b>
			</h1>
			<hr style="width: 50px; border: 5px solid blue" class="w3-round">
		</div>
   <div id="wrap" align="center">
      <table class="w3-table w3-striped">
         <tr>
            <td colspan="5" style="border: white; text-align:right">
            </td>
         </tr>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회</th>
         </tr>
         <c:forEach var="board" items="${boardList}">
         <tr class="record">
            <td>${board.num}</td>
            <td><a href="Team2Servlet?command=board_view&num=${board.num}">${board.title}</a>
            </td>
            <td>${board.userID}</td>
            <td><fmt:formatDate value="${board.writedate}" type="date" dateStyle="short"/></td>
            <td>${board.readcount }</td>
         </tr>
         </c:forEach>
      </table>
      <br><br>
      <button name="write" onclick="location.href='Team2Servlet?command=board_write_form'" class="w3-button w3-blue gray w3-padding-large w3-hover-black">게시글 등록</button>
   </div>
 </div>
   <%@ include file="../tiles/footerBar.jsp"%>
</body>
</html>