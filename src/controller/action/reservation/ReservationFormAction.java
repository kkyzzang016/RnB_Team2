package controller.action.reservation;

import java.io.IOException;
import java.sql.Timestamp;
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
import dto.ReservationVO;
import dto.TicketVO;
import dto.UserVO;

public class ReservationFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "WEB-INF/views/reservation/reservation.jsp";

		HttpSession session = request.getSession(true);
		String result = null;
		if (session.getAttribute("userInfo") != null) {
			UserVO uVo = (UserVO) session.getAttribute("userInfo");
			ReservationDao rDao = ReservationDao.getInstance();//
			ReservationVO rVo = rDao.rselectone(uVo.getUserCarnum()); //

			result = rDao.userReserveInfo(uVo.getUserCarnum());
			request.setAttribute("result", result);
			request.setAttribute("userCarnum", uVo.getUserCarnum());

			if (rVo.getUserCarnum() == null) {
				request.setAttribute("checkc", "noo");

			}
			if (rVo.getUserCarnum() != null) {
				request.setAttribute("checkc", "yess");
			}
		} else {
			request.setAttribute("result", null);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}