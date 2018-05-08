package controller.action.commterTicket;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.action.Action;
import dao.PayDao;
import dto.PayVO;
import dto.UserVO;
import test.TestDao;

public class PayCompleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "WEB-INF/views/mainView.jsp";

		HttpSession session = request.getSession(true);
		UserVO currentUser = (UserVO) session.getAttribute("userInfo");

		String fee = request.getParameter("fee");
		String ticketInfo = request.getParameter("ticketInfo");

		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

	    LocalDateTime endTime=null;
		LocalDateTime dayTime = null;
		LocalDate temp=null;
		String [] userTicket=null;

		if(ticketInfo==null) {
			dayTime = LocalDateTime.now();
		}else {
			userTicket = ticketInfo.split("\\#");
			temp = LocalDate.parse(userTicket[3].substring(0, 19), dateTimeFormatter);
			dayTime = LocalDateTime.of(temp, LocalDateTime.now().toLocalTime());
		}

	    switch(fee) {
	    case "120000":
	    	endTime = dayTime.plusMonths(1);
	    	break;

	    case "300000":
	    	endTime = dayTime.plusMonths(3);
	    	break;

	    case "520000":
	    	endTime = dayTime.plusMonths(6);
	    	break;
	    }

	    String startDate=null;

	    if(userTicket!=null) {
	    	startDate = userTicket[2];
	    }else {
	    	startDate = dayTime.format(dateTimeFormatter);
	    }

	    String endDate = endTime.format(dateTimeFormatter);

	    PayDao pDao = PayDao.getInstance();
		PayVO payVo = new PayVO();
		payVo.setUserCarnum(currentUser.getUserCarnum());
		payVo.setUserName(currentUser.getUserName());
		payVo.setStartDate(startDate);
		payVo.setEndDate(endDate);

		if(userTicket!=null) {
			pDao.updateCommuterTicketInfo(payVo);
	    }else {
	    	pDao.purchasedCommuterTicketInfo(payVo);
	    }

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}
}
