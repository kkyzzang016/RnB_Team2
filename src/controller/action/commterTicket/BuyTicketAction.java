package controller.action.commterTicket;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.action.Action;

import dao.ReservationDao;
import dto.ReservationVO;
import dto.TicketVO;
import dto.UserVO;

public class BuyTicketAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "WEB-INF/views/commuteTicket/buyTicket.jsp";
		HttpSession session = request.getSession(true);
		if (session.getAttribute("userInfo") != null) {
			UserVO uVo = (UserVO) session.getAttribute("userInfo");
			ReservationDao rDao = ReservationDao.getInstance();//
			ReservationVO rVo = rDao.rselectone(uVo.getUserCarnum()); //

			TicketVO tVo = rDao.rtselectone(uVo.getUserCarnum()); //

			if (rVo.getUserCarnum() == null || tVo.getUserCarnum() == null) {
				request.setAttribute("checkcc", "noo");
			}
			if (rVo.getUserCarnum() != null || tVo.getUserCarnum() != null) {
				request.setAttribute("checkcc", "yess");
			}
		} else {
			request.setAttribute("result", null);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}
}