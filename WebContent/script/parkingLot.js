//sidebar
	function w3_open() {
	    document.getElementById("mySidebar").style.display = "block";
	    document.getElementById("myOverlay").style.display = "block";
	}

	function w3_close() {
	    document.getElementById("mySidebar").style.display = "none";
	    document.getElementById("myOverlay").style.display = "none";
	}

	function w3_goStatus(){
		location.href="Team2Servlet?command=status";
	}
	function w3_goBuyTicket(){
		location.href="Team2Servlet?command=buyTicket";
	}

	// Modal Image Gallery
	function onClick(element) {
	  document.getElementById("img01").src = element.src;
	  document.getElementById("modal01").style.display = "block";
	  var captionText = document.getElementById("caption");
	  captionText.innerHTML = element.alt;
	}

//Status.jsp
	function requestAjax() {
		$.ajax({
			type : "POST",
			url : "Team2Servlet?command=time",

			dataType : "text",
			success : function(data) {
				var result = document.getElementById("result");
				if(data<=0){
				$("#outcar").prop("disabled",true);
				result.innerHTML = "주차예약시간 전입니다.";
				}
				else{
					$("#outcar").prop("disabled",false);
				var date = data/86400;
				var hour = (data%86400)/3600;
				var min = ((data%86400)%3600)/60;
				var sec = ((data%86400)%3600)%60;

				var totalMin = parseInt(data/60);
				var money = (parseInt(totalMin/10)-3)*500 + 1000;

				result.innerHTML = "<h2>"+parseInt(date)+"일 "+parseInt(hour)+"시간 "+parseInt(min)+"분 "+sec+"초 <br><br></h2>";
				document.form1.time.value = data;
				}
			}
		});
	}
	setInterval(function() {
		requestAjax();
	}, 1000);

	function go(){
		document.form1.action = "Team2Servlet?command=billing";
		document.form1.submit();
	}

//BuyTicket.jsp
	function go_ticket1(){
		if (!document.form1.check1.checked) {
			alert("동의 여부를 체크해주세요.");
			document.form1.check1.focus();
		} else {
			document.form1.action = "Team2Servlet?command=purchaseConfirm";
			document.form1.submit();
		}
	}
	function go_ticket2(){
		if (!document.form2.check2.checked) {
			alert("동의 여부를 체크해주세요.");
			document.form2.check2.focus();
		} else {
			document.form2.action = "Team2Servlet?command=purchaseConfirm";
			document.form2.submit();
		}
	}
	function go_ticket3(){
		if (!document.form3.check3.checked) {
			alert("동의 여부를 체크해주세요.");
			document.form3.check3.focus();
		} else {
			document.form3.action = "Team2Servlet?command=purchaseConfirm";
			document.form3.submit();
		}
	}