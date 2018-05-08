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

   <!-- Overlay effect when opening sidebar on small screens -->
   <div class="w3-overlay w3-hide-large" onclick="w3_close()"
      style="cursor: pointer" title="close side menu" id="myOverlay"></div>

   <!-- !PAGE CONTENT! -->
      <div class="w3-main" style="margin-left: 340px; margin-right: 40px">

      <%@ include file="../tiles/headerBar.jsp"%>

      <!-- 예약 확인 -->
      <div class="w3-container" id="confirm" style="margin-top: 75px">

         <h1 class="w3-xxxlarge w3-text-blue gray">
            <b>정액권 정보 조회</b>
         </h1>
         <hr style="width: 50px; border: 5px solid blue" class="w3-round">
      </div>

	<div class="w3-row-padding">
		<table class=w3-table-all id="co">
			<tr>
			<th>이름</th>
			<th>시작일</th>
			<th>종료일</th>
			</tr>
		<c:choose>
		<c:when test="${ticketInfo eq 'nodata' }">
			<tr>
			<td colspan="3">정액권 구매내역이 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>

			<tr>
			<td>${ticketInfo.userName }</td>
			<td>${ticketInfo.startDate }</td>
			<td>${ticketInfo.endDate }</td>
			</tr>
		</c:otherwise>
		</c:choose>
		</table>
	</div>
</div>

   <div class="w3-main" style="margin-left: 340px; margin-right: 40px">

      <%@ include file="../tiles/headerBar.jsp"%>

      <!-- 예약 확인 -->
      <div class="w3-container" id="confirm" style="margin-top: 75px">

         <h1 class="w3-xxxlarge w3-text-blue gray">
            <b>이용내역 조회</b>
         </h1>
         <hr style="width: 50px; border: 5px solid blue" class="w3-round">
      </div>

	<div class="w3-row-padding">
            <table class=w3-table-all id="co">
				<tr>
				<th>차량번호</th>
				<th>입차 시간</th>
				<th>출차 시간</th>
				<th>사용 현황</th>
				<th>요금 정보</th>
				<th>할인 정보</th>
				</tr>

			<c:forEach items="${usageList}" var="list">
			<tr>
				<td>${list.userCarnum}</td>
				<td>${list.i_car_t }</td>
				<td>${list.o_car_t }</td>
				<td>${list.inOrOut }</td>
				<td>${list.money }원</td>
				<td>${list.discountInfo }</td>
			</tr>
		</c:forEach>
			</table>
	</div>
</div>
   <%@ include file="../tiles/headerBar.jsp"%>
</body>
</html>