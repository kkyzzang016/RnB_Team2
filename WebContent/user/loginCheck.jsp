<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

 <div class="w3-container" id="contact" style="margin-top:75px">
        <h1 class="w3-jumbo">
            <b>Interior Design</b>
         </h1>
    <h1 class="w3-xxxlarge w3-text-blue gray"><b>Login Complete.</b></h1>
    <hr style="width:50px;border:5px solid blue" class="w3-round">

   </div>

      <h1>안녕하세요  ${userID}님</h1>

   <!-- 본문 -->
   </div>

<%@ include file="../tiles/footerBar.jsp"%>
</body>
</html>