<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="imgs/moon.png">
<style type="text/css">

</style>
</head>
<script type="text/javascript">


function goReserve(mode){
   if(confirm("예약하시겠습니까?")){
      if(mode =="1"){
         document.form1.action = "Team2Servlet?command=reserveInsert";
            document.form1.submit();
         }else if(mode =="2"){
           document.form2.action = "Team2Servlet?command=reserveInsert";
           document.form2.submit();
         }else if(mode =="3"){
            document.form3.action = "Team2Servlet?command=reserveInsert";
            document.form3.submit();
         }
    }else{
          return;
          }//에약 if

 }//goreserve(mode)

</script>
<script>

  $(function() {
      if( $("input[name=spare1]").val() == '0'){
          $("input[name=res1]").attr("disabled","disabled");
          $("input[name=i_car_t1]").attr("disabled","disabled");
          }else if( $("input[name=spare2]").val() == '0'){
          $("input[name=res2]").attr("disabled","disabled");
          $("input[name=i_car_t2]").attr("disabled","disabled");
          } else if( $("input[name=spare3]").val() == '0'){
          $("input[name=res3]").attr("disabled","disabled");
          $("input[name=i_car_t3]").attr("disabled","disabled");
          }
  });

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
      <div id="modal01" class="w3-modal w3-black" style="padding-top: 0"
         onclick="this.style.display='none'">
         <span class="w3-button w3-black w3-xxlarge w3-display-topright">×</span>
         <div
            class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
            <img id="img01" class="w3-image">
            <p id="caption"></p>
         </div>
      </div>



      <div class="w3-container" id="reservation" style="margin-top: 75px">
         <h1 class="w3-xxxlarge w3-text-blue gray">
            <b>Reservation</b>
         </h1>
         <hr style="width: 50px; border: 5px solid blue" class="w3-round">
      </div>

      <div class="w3-row-padding">



         <!-- reservation_ok.jsp -->

         <form action="" onsubmit="goReserve('1')" method="post" name="form1" id="form1">

            <div class="w3-half w3-margin-bottom" style="width: 497px;margin-right: 8px;">
               <ul class="w3-ul w3-light-grey w3-center">
                  <li class="w3-light-blue w3-xlarge w3-padding-32"> <input type="hidden" id="floor"
                     name="floor" value="f1">F1</li>
                  <li class="w3-padding-16"><img src="imgs/car.jpg"
                     style="width: 100%" onclick="onClick(this)"></li>
                  <li class="w3-padding-16"><label> 잔여 수 : </label> <input
                     type="text" value="${park1.spare}" size="6" name="spare1"
                     readonly>/ <label>100</label></li>
                  <li class="w3-padding-16"><label> 시작 시간 : </label> <input
                     type="datetime-local" id="i_car_t1" name="i_car_t1" value required></li>
                  <li class="w3-light-grey w3-padding-24">
                      <input type="submit" class="w3-button w3-white w3-padding-large w3-hover-black"
                     name="res1" value="Sign Up"
                     >

                  </li>
               </ul>
            </div>
         </form>

         <form action="" onsubmit="goReserve('2')" method="post" name="form2" id="form2">
            <div class="w3-half" style="width: 497px;margin-right: 8px;">
               <ul class="w3-ul w3-light-grey w3-center">
                  <li class="w3-light-blue w3-xlarge w3-padding-32"><input type="hidden" id="floor"
                     name="floor" value="f2">F2</li>
                  <li class="w3-padding-16"><img src="imgs/car.jpg"
                     style="width: 100%" onclick="onClick(this)"></li>
                  <li class="w3-padding-16"><label> 잔여 수 : </label> <input
                     type="text" value="${park2.spare}" size="6" name="spare2"
                     readonly>/ <label>100</label></li>
                  <li class="w3-padding-16"><label> 시작 시간 : </label> <input
                     type="datetime-local" id="i_car_t1" name="i_car_t2" value required></li>
                  <li class="w3-light-grey w3-padding-24"> <input type="submit" class="w3-button w3-white w3-padding-large w3-hover-black"
                     name="res2" value="Sign Up"
                     ></li>
               </ul>
            </div>
         </form>

         <form  action="" onsubmit="goReserve('3')" method="post" name="form3" id="form3">
            <div class="w3-half" style="width: 497px;  margin-right: 0px; ">
               <ul class="w3-ul w3-light-grey w3-center">
                  <li class="w3-light-blue w3-xlarge w3-padding-32"><input type="hidden" id="floor"
                     name="floor" value="f3">F3</li>
                  <li class="w3-padding-16"><img src="imgs/car.jpg"
                     style="width: 100%" onclick="onClick(this)"></li>
                  <li class="w3-padding-16"><label> 잔여 수 : </label> <input
                     type="text" value="${park3.spare}" size="6" name="spare3"
                     readonly>/ <label>100</label></li>
                  <li class="w3-padding-16"><label> 시작 시간 : </label> <input
                     type="datetime-local" id="i_car_t" name="i_car_t3" value required></li>
                  <li class="w3-light-grey w3-padding-24"> <input type="submit" class="w3-button w3-white w3-padding-large w3-hover-black"
                     name="res3" value="Sign Up"
                     ></li>
               </ul>
            </div>
         </form>

      </div>


      <!-- End page content -->
   </div>

   <%@ include file="../tiles/footerBar.jsp"%>

</body>
</html>