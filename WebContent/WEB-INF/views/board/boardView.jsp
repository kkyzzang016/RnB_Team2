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
      <h1>게시글 상세보기</h1>
      <table class="w3-table-all">
         <tr>
         <th>작성자</th>
         <td>${board.userID }</td>
         </tr>
         <tr>
         <th>이메일</th>
         <td>${board.userEmail }</td>
         </tr>
         <tr>
         <th>작성일</th>
         <td><fmt:formatDate value="${board.writedate}" type="date" dateStyle="short"/></td>
         </tr>
         <tr>
         <th>조회수</th>
         <td>${board.readcount}</td>
         </tr>
         <tr>
         <th>제목</th>
         <td colspan="3"><pre>${board.title }</pre></td>
         </tr>
         <tr>
         <th>내용</th>
         <td colspan="5"><pre>${board.content }</pre></td>
         </tr>
      </table>
      <br><br>
      <input type="button" value="게시글 수정" class="w3-button w3-blue gray w3-padding-large w3-hover-black" onclick="open_win('Team2Servlet?command=board_check_pass_form&num=${board.num}','update')"/>
         <input type="button" value="게시글 삭제" class="w3-button w3-blue gray w3-padding-large w3-hover-black" onclick="open_win('Team2Servlet?command=board_check_pass_form&num=${board.num}','delete')"/>
         <input type="button" value="게시글 리스트" class="w3-button w3-blue gray w3-padding-large w3-hover-black" onclick="location.href='Team2Servlet?command=board_list'">
         <input type="button" value="게시글 등록"  class="w3-button w3-blue gray w3-padding-large w3-hover-black" onclick="location.href='Team2Servlet?command=board_write_form'">
   </div>
     </div>
   <%@ include file="../tiles/footerBar.jsp"%>

   <script language="Javascript">

   function open_win(url,name){
      open(url,name,"width=250","height=250");
   }

   </script>
</body>
</html>