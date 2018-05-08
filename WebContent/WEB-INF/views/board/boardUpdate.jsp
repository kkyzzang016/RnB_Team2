<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
      <h1>게시글 수정</h1>

      <form action="Team2Servlet?command=board_update"  method="frm" name="userinput">
         <input type="hidden" name="command" value="board_update">
         <input type="hidden" name="num" value="${board.num }">
         <table>

            <tr>
            <label>제목</label>
            <td><input class="w3-input w3-border" type="text" name="title" placeholder="제목" required value="${board.title }"></td>
            </tr>
            <tr>
         <td><input class="w3-input w3-border" type="text" name="userID" placeholder="이름" required></td>
         </tr>
         <tr>
         <td><input class="w3-input w3-border" type="text" name="userEmail" placeholder="이메일" value="${board.userEmail}" required></td>
         </tr>
            <tr>
            <td>
               <textarea class="form-control" cols="50" rows="10" name="content"  required>${board.content}
               </textarea>
            </td>
            </tr>
            <tr>
            <td><input class="w3-input w3-border" type="password" name="pass" placeholder="새로운 비밀번호를 적으세요." required></td>
            </tr>

         </table>
         <br>
         <br> <input type="submit" value="등록" class="w3-button w3-blue gray w3-padding-large w3-hover-black" onclick="return boardCheck()">
            <input type="reset" value="다시 작성" class="w3-button w3-blue gray w3-padding-large w3-hover-black">
            <input type="button" value="목록" class="w3-button w3-blue gray w3-padding-large w3-hover-black" onclick="location.href='Team2Servlet?command=board_list'">
      </form>
   </div>
   </div>
   <%@ include file="../tiles/footerBar.jsp"%>
   <script language="Javascript">
   function boardCheck(){
      if(document.frm.name.value.length==0){
         alert("작성자를 입력하세요.");
         return false;
      }
      if(document.frm.pass.value.length==0){
         alert("비밀번호를  입력하세요.");
         return false;
      }
      if(document.frm.title.value.length==0){
         alert("제목을 입력하세요.");
         return false;
      }
      return true;
   }

   </script>
</body>
</html>