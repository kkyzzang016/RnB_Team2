<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
.floor {
   display: none;
}

.bgimg {
   height: 100%;
   width:auto;
   background-position: center;
    background-size: cover;

}

body, html {
   height: 100%
}

#use, .w3-main {

   background-size: cover;
   background-position: center;
}

#use img {
   cursor: pointer;
}
#use table{
 padding-bottom:10%;
 padding-top:10%;
}
#info td {
   width: 250px;
}
.w3-half {
   height: 100%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=UpxzzpVSPKPIjBGZ1c6t&submodules=geocoder"></script>
<script type="text/javascript">
   $(document).ready(requestAjax);
   function requestAjax() {
      var spare = new Array();
      $.ajax({
         type : "POST",
         url : "Team2Servlet?command=checkZero",
         dataType : 'json',
         success : function(data) {
            $.each(data, function(key, val) {
               spare[parseInt(key)] = val;
            });
            document.form1.spare.value = spare[0];
            document.form2.spare.value = spare[1];
            document.form3.spare.value = spare[2];

         }
      });
   }
</script>
<script type="text/javascript">
   window.onload = function() {
      $(".box").each(function() {
         // 개별적으로 Wheel 이벤트 적용
         $(this).on("mousewheel DOMMouseScroll", function(e) {
            e.preventDefault();
            var delta = 0;
            if (!event)
               event = window.event;
            if (event.wheelDelta) {
               delta = event.wheelDelta / 120;
               if (window.opera)
                  delta = -delta;
            } else if (event.detail)
               delta = -event.detail / 3;
            var moveTop = null;
            // 마우스휠을 위에서 아래로
            if (delta < 0) {
               if ($(this).next() != undefined) {
                  moveTop = $(this).next().offset().top;
               }
               // 마우스휠을 아래에서 위로
            } else {
               if ($(this).prev() != undefined) {
                  moveTop = $(this).prev().offset().top;
               }
            }
            // 화면 이동 0.3초(300)
            $("html,body").stop().animate({
               scrollTop : moveTop + 'px'
            }, {
               duration : 200,
               complete : function() {
               }
            });
         });
      });
   }
</script>
</head>
<body>
   <%@ include file="../views/tiles/sideBar.jsp"%>
   <!-- Overlay effect when opening sidebar on small screens -->
   <div class="w3-overlay w3-hide-large" onclick="w3_close()"
      style="cursor: pointer" title="close side menu" id="myOverlay">
   </div>
   <div class="w3-main box"
      style="margin-left: 300px; margin-right: 0px; height:auto;">
   <div class="w3-animate-opacity bgimg">
   <img src="imgs/maincar.jpg" style="width:100%; height:100%;">
   </div>
</div>
   <div class="w3-main box"
      style="margin-left: 300px; margin-right: 0px;height:auto;">

      <div
         class="w3-container w3-padding-64 w3-pale-blue w3-center"
         id="use" style="height:100%;">
         <div class="w3-center">

            <table align="center">
               <tr>
                  <td colspan="3">
                        <font size="12rem"><b>사용방법</b><hr></font>
                     </td>
               </tr>

               <tr>
                  <td><img src="imgs/use1.png" style="padding:5% 5% 5% 0%; width: 100%;"
                     onclick="javascript:location.href='Team2Servlet?command=buyTicket';"></td>
                  <td><img src="imgs/use3.png" style="padding:5% 5% 5% 0%; width: 100%;"
                     onclick="javascript:location.href='Team2Servlet?command=reservation';"></td>
                  <td><img src="imgs/use2.png" style="padding:5% 5% 5% 0%; width: 100%;"
                     onclick="javascript:location.href='Team2Servlet?command=reserveConfirm';"></td>
               </tr>
               <tr>
                  <td><b>주차권 구매</b></td>
                  <td><b>예약하기</b></td>
                  <td><b>예약확인</b></td>
               </tr>
            </table>


         </div>
      </div>
   </div>

   <!-- !PAGE CONTENT! -->
   <div class="w3-main box" style="margin-left: 340px; margin-right: 40px; height:auto;">
      <%@ include file="../views/tiles/headerBar.jsp"%>
      <div class="w3-row-padding">
         <div class="w3-container w3-padding-64" >
            <div class="w3-col">
               <div class="w3-padding-16">
                  <h1 class="w3-xxxlarge w3-text-blue">

                     <b>주차장 소개 </b>
                  </h1>
                  <hr style="width: 50px; border: 5px solid blue" class="w3-round">
               </div>
               <div class="w3-half w3-margin-bottom w3-light-grey">
                  <table id="info">
                     <tr>
                        <td>주소</td>
                        <td>성남시 분당구 구미로8(구미동)</td>
                     </tr>
                     <tr>
                        <td>건물 유형</td>
                        <td>오피스 건물</td>
                     </tr>
                     <tr>
                        <td>주차장 유형</td>
                        <td>지하 주차장</td>
                     </tr>
                     <tr>
                        <td>가능차종</td>
                        <td style="width: 450px">경 승용차, 일반 승용차, SUV, 승합차(9인 이상),1톤
                           트럭</td>
                     </tr>
                     <tr>
                        <td>사용가능 시간</td>
                        <td>평일 00:00 ~ 24:00</td>
                     </tr>
                     <tr>
                        <td></td>
                        <td>토요일 00:00 ~ 24:00</td>
                     </tr>
                     <tr>
                        <td></td>
                        <td>일요일 00:00 ~ 24:00</td>
                     </tr>
                     <tr>
                        <td>넓이</td>
                        <td>입출구 - 폭 3.6m 높이 2.3m <br> 주차면 - 너비 2.3m 길이 5.1m
                        </td>
                     </tr>
                     <tr>
                        <td>요금</td>
                        <td>기본요금 30분 / 1,000원<br> 추가요금 10분 / 500원
                        </td>
                     </tr>
                  </table>

               </div>

               <!-- Menu Container -->
               <div class="w3-half box" id="floor">
                  <div class="w3-content" style="max-width: 700px">

                     <div class="w3-row w3-center w3-card w3-padding">
                        <a href="javascript:void(0)" onclick="openFloor(event, 'F1');"
                           id="myLink">
                           <div class="w3-col s4 tablink">F1</div>
                        </a> <a href="javascript:void(0)" onclick="openFloor(event, 'F2');">
                           <div class="w3-col s4 tablink">F2</div>
                        </a> <a href="javascript:void(0)" onclick="openFloor(event, 'F3');">
                           <div class="w3-col s4 tablink">F3</div>
                        </a>
                     </div>

                     <div id="F1"
                        class="w3-container floor w3-padding-48 w3-card w3-center">
                        <form action="" name="form1" id="form1">


                           <img src="imgs/car.jpg" style="width: 80%; padding: 10px;">
                           <br> <label> 잔여 수 : </label> <input type="text" size="6"
                              name="spare" readonly>/ <label>100</label>
                        </form>
                     </div>
                     <div id="F2"
                        class="w3-container floor w3-padding-48 w3-card w3-center">
                        <form action="" name="form2" id="form2">


                           <img src="imgs/car.jpg" style="width: 80%; padding: 10px;">
                           <br> <label> 잔여 수 : </label> <input type="text" size="6"
                              name="spare" readonly>/ <label>100</label>
                        </form>
                     </div>
                     <div id="F3"
                        class="w3-container floor w3-padding-48 w3-card w3-center">
                        <form action="" name="form3" id="form3">


                           <img src="imgs/car.jpg" style="width: 80%; padding: 10px;">
                           <br> <label> 잔여 수 : </label> <input type="text" size="6"
                              name="spare" readonly>/ <label>100</label>
                        </form>
                     </div>

                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="w3-main box" style="margin-left: 340px; margin-right: 40px; padding-bottom: 120px; height: auto;">

      <div class="w3-container w3-padding-64" id="contact" >
         <div class="w3-col">
               <div class="w3-padding-16">
                  <h1 class="w3-xxxlarge w3-text-blue">
            <b>문의사항</b>
         </h1>
         <hr style="width: 50px; border: 5px solid blue" class="w3-round">
         </div>
          <h2>서비스 개선을 위한 문의 및 건의사항을 적어주세요!</h2>
   		 <h3 style="color:red">확인 후 신속한 서비스 개선을 약속드립니다!</h3><br>

         <form action="Team2Servlet?command=contact" target="_blank"
            method="post">
            <div class="w3-section">
               <label>성함</label> <input class="w3-input w3-border" type="text"
                  name="name" required>
            </div>
            <div class="w3-section">
               <label>Email 주소</label> <input class="w3-input w3-border" type="text"
                  name="email" required>
            </div>
            <div class="w3-section">
               <label>보내는 메시지</label> <input class="w3-input w3-border"
                  type="text" name="message" required>
            </div>
            <input type="submit" class="w3-button w3-block w3-padding-large w3-blue gray w3-margin-bottom" value="보내기">
         </form>
      </div>
      </div>
      </div>


<div class="w3-main box" style="margin-left: 340px; margin-right: 40px;  margin-bottom: 0px; padding-bottom: 120px;">
<div class="w3-container w3-padding-64 " style="padding:50px 0px 150px 0px; height: 100%;">
   <div class="w3-col">
         <div class="w3-padding-16">
                  <h1 class="w3-xxxlarge w3-text-blue">
            <b>지도</b>
         </h1>
         <hr style="width: 50px; border: 5px solid blue" class="w3-round">
         </div>
<div id="map" style="width: 100%; height: 500px; margin-bottom: 30px;"></div></div>
      <script>
         var map = new naver.maps.Map('map');
         var myaddress = '구미로 8';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
         naver.maps.Service
               .geocode(
                     {
                        address : myaddress
                     },
                     function(status, response) {
                        if (status !== naver.maps.Service.Status.OK) {
                           return alert(myaddress
                                 + '의 검색 결과가 없거나 기타 네트워크 에러');
                        }
                        var result = response.result;
                        // 검색 결과 갯수: result.total
                        // 첫번째 결과 결과 주소: result.items[0].address
                        // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
                        var myaddr = new naver.maps.Point(
                              result.items[0].point.x,
                              result.items[0].point.y);
                        map.setCenter(myaddr); // 검색된 좌표로 지도 이동
                        // 마커 표시
                        var marker = new naver.maps.Marker({
                           position : myaddr,
                           map : map
                        });
                        // 마커 클릭 이벤트 처리
                        naver.maps.Event.addListener(marker, "click",
                              function(e) {
                                 if (infowindow.getMap()) {
                                    infowindow.close();
                                 } else {
                                    infowindow.open(map, marker);
                                 }
                              });
                        // 마크 클릭시 인포윈도우 오픈
                        var infowindow = new naver.maps.InfoWindow(
                              {
                                 content : '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
                              });
                     });
      </script>
      </div>
</div>

   <div class="w3-main box" style=" margin-left: 300px; margin-right: 0px">
    <div style="margin-top: -75px;">
   <div style="margin-left: -300px;">
   <%@ include file="../views/tiles/footerBar.jsp"%>
   </div>
   </div>
</div>
   <script type="text/javascript">
      function openFloor(evt, Namef) {
         var i, x, tablinks;
         x = document.getElementsByClassName("floor");
         for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
         }
         tablinks = document.getElementsByClassName("tablink");
         for (i = 0; i < x.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(
                  " w3-dark-grey", "");
         }
         document.getElementById(Namef).style.display = "block";
         evt.currentTarget.firstElementChild.className += " w3-dark-grey";
      }
      document.getElementById("myLink").click();
   </script>


</body>
</html>