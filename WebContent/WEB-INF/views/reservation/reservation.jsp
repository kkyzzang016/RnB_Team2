<%@page import="dto.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="imgs/moon.png">
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(checkSession);
function checkSession(){
	if(<%=session.getAttribute("userInfo")==null%>){
		alert("로그인 정보가 없습니다.");
		location.href="Team2Servlet?command=signIn";
	}else{
		requestAjax();
	}
}
function checkreserve(){
	   if(<%=session.getAttribute("userInfo")!=null%>){
	      alert("예약정보가 있습니다.");
	      location.href="Team2Servlet?command=reserveConfirm";
	   }
}
function requestAjax(){
   var spare = new Array();
   $.ajax({
   type : "POST",
   url : "Team2Servlet?command=checkZero",
   dataType : 'json',
   success : function(data){
      $.each(data, function(key, val){
         spare[parseInt(key)] = val;
         });
      document.form1.spare.value=spare[0];
      document.form2.spare.value=spare[1];
      document.form3.spare.value=spare[2];

      if(spare[0]==0){
         document.form1.res.disabled=true;
      }
      if(spare[1]==0){
         document.form2.res.disabled=true;
      }
      if(spare[2]==0){
         document.form3.res.disabled=true;
      }
      }
   });
}
   function goReserve1() {
      if (document.form1.i_car_t.value == null) {
         document.form1.i_car_t.focus();
      } else {
         if (confirm("예약하시겠습니까?")) {
            document.form1.action = "Team2Servlet?command=reserveInsert";
            document.form1.submit();
         }
      }
   }
   function goReserve2() {
      if (document.form2.i_car_t.value == null) {
         document.form2.i_car_t.focus();
      } else {
         if (confirm("예약하시겠습니까?")) {
            document.form2.action = "Team2Servlet?command=reserveInsert";
            document.form2.submit();
         }
      }
   }
   function goReserve3() {
      if (document.form3.i_car_t.value == null) {
         document.form3.i_car_t.focus();
      } else {
         if (confirm("예약하시겠습니까?")) {
            document.form3.action = "Team2Servlet?command=reserveInsert";
            document.form3.submit();
         }
      }
   }

    function s_mouseover(mode) {
      if(mode == "1"){
         if (document.form1.spare.value > 80) {
            form1.spare.style.color = "rgba(0, 255, 0,0.5)";
            form1.spare.value="여유";
            }
         else if(document.form1.spare.value > 40) {
            form1.spare.style.color = "rgba(255, 255, 0,0.5)";
            form1.spare.value="양호";
            }
         else{
            form1.spare.style.color = "rgba(255, 0, 0,0.5)";
            form1.spare.value="부족";
            }
         }
      else if(mode=="2"){
         if (document.form2.spare.value > 80) {
            form2.spare.style.color = "rgba(0, 255, 0,0.5)";
            form2.spare.value="여유";
            }
         else if (document.form2.spare.value > 40) {
            form2.spare.style.color = "rgba(255, 255, 0,0.5)";
            form2.spare.value="양호";
            }
         else{
            form2.spare.style.color = "rgba(255, 0, 0,0.5)";
            form2.spare.value="부족";
            }
         }
   else if(mode=="3"){
      if (document.form3.spare.value > 80) {
         form3.spare.style.color = "rgba(0, 255, 0,0.5)";
         form3.spare.value="여유";
         }
      else if (document.form3.spare.value > 40) {
         form3.spare.style.color = "rgba(255, 255, 0,0.5)";
         form3.spare.value="양호";
         }
      else{
         form3.spare.style.color = "rgba(255, 0, 0,0.5)";
         form3.spare.value="부족";
         }
      }
}
   function s_mouseout() {
      form1.spare.style.color ="";
      form2.spare.style.color ="";
      form3.spare.style.color ="";
       requestAjax();
   }
</script>
<body>
   <%@ include file="../tiles/sideBar.jsp"%>

   <!-- Overlay effect when opening sidebar on small screens -->
   <div class="w3-overlay w3-hide-large" onclick="w3_close()"
      style="cursor: pointer" title="close side menu" id="myOverlay"></div>

   <!-- !PAGE CONTENT! -->
   <div class="w3-main" style="margin-left: 340px; margin-right: 40px">

      <%@ include file="../tiles/headerBar.jsp"%>
      <!-- 이미지 클릭할때 큰 사이즈로 이미지를 볼수 있음-->
      <div id="modal01" class="w3-modal w3-black" style="padding-top: 0" onclick="this.style.display='none'">
         <span class="w3-button w3-black w3-xxlarge w3-display-topright">×</span>
         <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
            <img id="img01" class="w3-image">
            <p id="caption"></p>
         </div>
      </div>

      <div class="w3-container" id="reservation" style="margin-top: 75px">

         <h1 class="w3-xxxlarge w3-text-blue gray">
            <b>예약하기</b>
         </h1>
         <hr style="width: 50px; border: 5px solid blue" class="w3-round">
      </div>

	<c:choose>
	<c:when test="${checkc eq 'yess'}">
    <script>checkreserve();</script>
	</c:when>
	<c:when test="${checkc eq 'noo'}">
      <div class="w3-row-padding">

         <!-- reservation_ok.jsp -->

         <form action="" onsubmit="goReserve1()" method="post" name="form1" id="form1">

            <div class="w3-half w3-margin-bottom" style="width: 497px;margin-right: 8px;">
               <ul class="w3-ul w3-light-grey w3-center">
                  <li class="w3-light-blue w3-xlarge w3-padding-32">
                  <input type="hidden" id="floor" name="floor" value="f1">F1</li>
                  <li class="w3-padding-16"><img src="imgs/car.jpg" style="width: 100%" onclick="onClick(this)"></li>
                  <li class="w3-padding-16"><label> 잔여 수 : </label>
                  <input type="text" size="6" name="spare" readonly onmouseover="s_mouseover('1')" onmouseout="s_mouseout()">/
                  <label>100</label></li>
                  <li class="w3-padding-16"><label> 시작 시간 : </label>
                  <input type="datetime-local" id="i_car_t" name="i_car_t" required></li>
                  <li class="w3-light-grey w3-padding-24">
                      <input type="submit" class="w3-button w3-white w3-padding-large w3-hover-black" name="res" value="Sign Up" >

                  </li>
               </ul>
            </div>
         </form>

         <form action="" onsubmit="goReserve2()" method="post" name="form2" id="form2">
            <div class="w3-half" style="width: 497px;margin-right: 8px;">
               <ul class="w3-ul w3-light-grey w3-center">
                  <li class="w3-light-blue w3-xlarge w3-padding-32">
                  <input type="hidden" id="floor" name="floor" value="f2">F2</li>
                  <li class="w3-padding-16"><img src="imgs/car.jpg" style="width: 100%" onclick="onClick(this)"></li>
                  <li class="w3-padding-16"><label> 잔여 수 : </label>
                  <input  type="text" size="6" name="spare" readonly onmouseover="s_mouseover('2')" onmouseout="s_mouseout()">/
                  <label>100</label></li>
                  <li class="w3-padding-16"><label> 시작 시간 : </label>
                  <input type="datetime-local" id="i_car_t" name="i_car_t" required></li>
                  <li class="w3-light-grey w3-padding-24">
                  <input type="submit" class="w3-button w3-white w3-padding-large w3-hover-black" name="res" value="Sign Up" >

                  </li>
               </ul>
            </div>
         </form>

         <form  action="" onsubmit="goReserve3()" method="post" name="form3" id="form3">
            <div class="w3-half" style="width: 497px;  margin-right: 0px; ">
               <ul class="w3-ul w3-light-grey w3-center">
                  <li class="w3-light-blue w3-xlarge w3-padding-32">
                  <input type="hidden" id="floor" name="floor" value="f3">F3</li>
                  <li class="w3-padding-16"><img src="imgs/car.jpg" style="width: 100%" onclick="onClick(this)"></li>
                  <li class="w3-padding-16"><label> 잔여 수 : </label>
                  <input type="text" size="6" name="spare" readonly onmouseover="s_mouseover('3')" onmouseout="s_mouseout()">/
                  <label>100</label></li>
                  <li class="w3-padding-16"><label> 시작 시간 : </label>
                  <input type="datetime-local" id="i_car_t" name="i_car_t" required></li>
                  <li class="w3-light-grey w3-padding-24">
                  <input type="submit" class="w3-button w3-white w3-padding-large w3-hover-black" name="res" value="Sign Up" >

                  </li>
               </ul>
            </div>
         </form>

      </div>
	    </c:when>
    <c:otherwise>error</c:otherwise>
	</c:choose>
      <!-- End page content -->
   </div>

   <%@ include file="../tiles/footerBar.jsp"%>

</body>
</html>