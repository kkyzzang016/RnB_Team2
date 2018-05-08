<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div align="center">
      <h1>비밀번호 확인</h1>
      <form action="Team2Servlet?command=board_check_pass_action"  name="frm" method="get">
         <input type="hidden" name="command" value="board_check_pass_action">
         <input type="hidden" name="num" value="${param.num }">
         <table style="width:80%">
            <tr>
               <th>비밀번호</th>
               <td><input type="password" name="pass" size="20"></td>
            </tr>
         </table>
         <br>
         <input type="submit" value="확인"onclick="return passCheck()" class="w3-button w3-blue gray w3-padding-large w3-hover-black"><br>
         <br>${message}
      </form>
   </div>
   <script language="Javascript">

   function passCheck(){
      if(document.frm.pass.value.length==0){
         alert("비밀번호를 입력하세요.");
         return false;
      }
      return true;
   }
   </script>
</body>
</html>