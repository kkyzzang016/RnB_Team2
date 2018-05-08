<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="imgs/moon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(checkSession);
function checkSession(){
	if(<%=session.getAttribute("userInfo")==null%>){
		alert("로그인 정보가 없습니다.");
		location.href="Team2Servlet?command=signIn"
	}
}
function goCancel(){
   if(confirm("예약 취소 하시겠습니까?")){
	  alert('예약이 취소되었습니다.');
      document.del.submit();
   }
}
</script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>

   <%@ include file="../tiles/sideBar.jsp"%>

   <!-- Overlay effect when opening sidebar on small screens -->
   <div class="w3-overlay w3-hide-large" onclick="w3_close()"
      style="cursor: pointer" title="close side menu" id="myOverlay"></div>

   <!-- !PAGE CONTENT! -->
   <div class="w3-main" style="margin-left: 340px; margin-right: 40px">

      <%@ include file="../tiles/headerBar.jsp"%>

      <!-- 예약 확인 -->
      <div class="w3-container" id="confirm" style="margin-top: 75px">

         <h1 class="w3-xxxlarge w3-text-blue gray">
            <b>예약확인</b>
         </h1>
         <hr style="width: 50px; border: 5px solid blue" class="w3-round">
      </div>

	<c:choose>
	<c:when test="${message eq null }">
	<div class="w3-row-padding">
         <form action="Team2Servlet?command=lotsCountDelete" method="post" name="del" id="del">
            <table class=w3-table-all id="co">
               <tr>
                  <th>예약자 이름</th>
                  <td>${userName}</td>
               </tr>
               <tr>
                  <th>차번호</th>
                  <td>${reserveInfo.userCarnum}</td>
               </tr>
               <tr>
                  <th>예약 된 주차장</th>
                  <td>${reserveInfo.floor}층</td>
               </tr>
               <tr>
                  <th>시작 시간</th>
                  <td>${reserveInfo.i_car_t}</td>
               </tr>
				<tr >
				<td colspan="2" style="text-align:right; padding-right: 30px;">
            <!-- <input type="button" onclick="goCancel();" value="cancel" > -->
            <button onclick="goCancel();" value="cancel" class="w3-button w3-blue gray w3-padding-large w3-hover-black">예약취소</button>
				</td></tr>
         </table>
         	<input type="hidden" name="userCarnum" value="${reserveInfo.userCarnum}">
         	<input type="hidden" name="floor" value="${reserveInfo.floor}">
         </form>
      </div>
	</c:when>
	<c:otherwise>
	<div align="center">
	<h2 align="center">예약 정보가 존재하지 않습니다!</h2>
	<button onclick="go_main()" class="w3-button w3-blue gray w3-padding-large w3-hover-black">홈으로</button>
	</div>
    </c:otherwise>
      </c:choose>

   </div>
   <%@ include file="../tiles/footerBar.jsp"%>

<script>
      function go_main(){
		location.href="Team2Servlet?command=main";
      }
</script>
</body>
</html>