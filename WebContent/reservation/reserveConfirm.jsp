<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="imgs/moon.png">

<style>

button{
  background:rgb(244, 67, 54);
  color:#fff;
  border:none;
  position:relative;
  height:50px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:rgb(244, 67, 54);
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: rgb(244, 67, 54);
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}


</style>
<script type="text/javascript">
/* function re_cancel()
{
    openWin = window.open("reservation_cancel.jsp",
            "예약 취소 ", "width=200, height=150, resizable = no, scrollbars = no");


} */
function goCancel(){
   if(confirm("예약 취소 하시겠습니까?")){

      document.del.submit();

   }
}

</script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>

   <%@ include file="../tiles/sideBar.jsp"%>

   <!-- Top menu on small screens -->
   <header
      class="w3-container w3-top w3-hide-large w3-red w3-xlarge w3-padding">
   <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right"
      onclick="w3_open()">☰</a> <span>Rnb_Team2</span> </header>

   <!-- Overlay effect when opening sidebar on small screens -->
   <div class="w3-overlay w3-hide-large" onclick="w3_close()"
      style="cursor: pointer" title="close side menu" id="myOverlay"></div>

   <!-- !PAGE CONTENT! -->
   <div class="w3-main" style="margin-left: 340px; margin-right: 40px">
<%
         request.setCharacterEncoding("UTF-8");
      %>
      <%@ include file="../tiles/headerBar.jsp"%>




      <!-- 예약 확인 -->
      <div class="w3-container" id="confirm" style="margin-top: 75px">
         <h1 class="w3-xxxlarge w3-text-red">
            <b>예약 확인</b>
         </h1>
         <hr style="width: 50px; border: 5px solid red" class="w3-round">
      </div>

      <div class="w3-row-padding">


         <form action="Team2Servlet?command=lotsCountDelete" method="post" name="del" id="del">
            <table class=w3-table-all id="co">
               <tr>
                  <th>예약자 이름</th>
                  <td>로그인한 이름</td>
               </tr>
               <tr>
                  <th>차번호</th>
                  <td>${res1.userCarnum}</td>
               </tr>
               <tr>
                  <th>예약 된 주차장</th>
                  <td>${res1.floor}층</td>
               </tr>
               <tr>
                  <th>시작 시간</th>
                  <td>${res1.i_car_t}</td>
               </tr>
<tr ><td colspan="2" style="text-align:right; padding-right: 30px;">
            <!-- <input type="button" onclick="goCancel();" value="cancel" > -->
            <button onclick="goCancel();" value="cancel" >취소</button>
</td></tr>
         </table>
         </form>
      </div>
   </div>
   <%@ include file="../tiles/footerBar.jsp"%>
</body>
</html>