package controller.action.status;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.action.Action;
import dao.ParkingDao;
import dao.ReservationDao;
import dto.UserVO;

public class BillingPayCompleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "WEB-INF/views/mainView.jsp";
		String floor=request.getParameter("floor");
		String commuterTicket = request.getParameter("commuterTicket");
		String bill = request.getParameter("bill");
		if(commuterTicket!=null) {
			bill="commuterTicket";
		}
		else if(bill==null){
			bill="no";
		}

		HttpSession session = request.getSession(true);
		UserVO currentUser = (UserVO) session.getAttribute("userInfo");
		String userCarnum = currentUser.getUserCarnum();

		int money = Integer.parseInt(request.getParameter("money"));

		long now = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddHHmmss");
		String endDate = dayTime.format(new Date(now));

	    ReservationDao rDao = ReservationDao.getInstance();
	    rDao.updateOutCarTime(userCarnum, money, endDate, bill);

	    ParkingDao pDao = ParkingDao.getInstance();
	    pDao.mSpare(floor);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}
}
